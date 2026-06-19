import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/models/enums.dart';
import '../core/models/models.dart';
import '../services/location_service.dart';
import '../services/notification_service.dart';
import '../services/prayer_cache_service.dart';
import '../services/prayer_calculation_service.dart';
import '../services/preferences_service.dart';
import '../services/timezone_service.dart';

final preferencesServiceProvider = Provider<PreferencesService>((ref) {
  throw UnimplementedError('PreferencesService must be overridden');
});

final timezoneServiceProvider = Provider<TimezoneService>(
  (ref) => TimezoneService(),
);

final locationServiceProvider = Provider<LocationService>((ref) {
  return LocationService(
    ref.watch(preferencesServiceProvider),
    ref.watch(timezoneServiceProvider),
  );
});

final prayerCalculationServiceProvider = Provider<PrayerCalculationService>(
  (ref) => PrayerCalculationService(ref.watch(timezoneServiceProvider)),
);

final prayerCacheServiceProvider = Provider<PrayerCacheService>((ref) {
  return PrayerCacheService(
    ref.watch(preferencesServiceProvider),
    ref.watch(prayerCalculationServiceProvider),
  );
});

final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService(ref.watch(preferencesServiceProvider));
});

final calculationMethodProvider =
    StateProvider<CalculationMethodId>((ref) {
      return ref.watch(preferencesServiceProvider).getCalculationMethod();
    });

final madhabProvider = StateProvider<MadhabId>((ref) {
  return ref.watch(preferencesServiceProvider).getMadhab();
});

class LocationState {
  const LocationState({
    this.location,
    this.isLoading = false,
    this.needsManualSelection = false,
    this.error,
  });

  final AppLocation? location;
  final bool isLoading;
  final bool needsManualSelection;
  final String? error;

  LocationState copyWith({
    AppLocation? location,
    bool? isLoading,
    bool? needsManualSelection,
    String? error,
  }) {
    return LocationState(
      location: location ?? this.location,
      isLoading: isLoading ?? this.isLoading,
      needsManualSelection: needsManualSelection ?? this.needsManualSelection,
      error: error,
    );
  }
}

class LocationNotifier extends StateNotifier<LocationState> {
  LocationNotifier(this._locationService) : super(const LocationState());

  final LocationService _locationService;
  Future<void>? _initializeFuture;

  Future<void> initialize() {
    _initializeFuture ??= _initialize();
    return _initializeFuture!;
  }

  Future<void> _initialize() async {
    if (state.location != null) {
      return;
    }

    state = state.copyWith(isLoading: true, error: null);

    try {
      final saved = await _locationService.getSavedLocation();
      if (saved != null) {
        state = state.copyWith(location: saved, isLoading: false);
        return;
      }

      final gps = await _locationService.fetchGpsLocation();
      if (gps != null) {
        state = state.copyWith(location: gps, isLoading: false);
        return;
      }

      state = state.copyWith(
        isLoading: false,
        needsManualSelection: true,
        error: 'Location unavailable. Please select a city.',
      );
    } catch (_) {
      state = state.copyWith(
        isLoading: false,
        needsManualSelection: true,
        error: 'Location unavailable. Please select a city.',
      );
    }
  }

  Future<void> refreshGps() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final gps = await _locationService.fetchGpsLocation();
      if (gps != null) {
        state = state.copyWith(
          location: gps,
          isLoading: false,
          needsManualSelection: false,
        );
        return;
      }

      state = state.copyWith(
        isLoading: false,
        needsManualSelection: true,
        error: 'Unable to get GPS location. Please select a city.',
      );
    } catch (_) {
      state = state.copyWith(
        isLoading: false,
        needsManualSelection: true,
        error: 'Unable to get GPS location. Please select a city.',
      );
    }
  }

  Future<void> selectCity(City city) async {
    state = state.copyWith(isLoading: true, error: null);
    final location = await _locationService.saveManualCity(city);
    state = state.copyWith(
      location: location,
      isLoading: false,
      needsManualSelection: false,
    );
  }
}

final locationProvider =
    StateNotifierProvider<LocationNotifier, LocationState>((ref) {
      return LocationNotifier(ref.watch(locationServiceProvider));
    });

class PrayerTimesState {
  const PrayerTimesState({
    this.today,
    this.tomorrow,
    this.schedule = const [],
    this.isLoading = false,
    this.error,
  });

  final DailyPrayerTimes? today;
  final DailyPrayerTimes? tomorrow;
  final List<PrayerScheduleEntry> schedule;
  final bool isLoading;
  final String? error;
}

class PrayerTimesNotifier extends StateNotifier<PrayerTimesState> {
  PrayerTimesNotifier(
    this._cacheService,
    this._calculator,
    this._preferences,
    this._notificationService,
    this._ref,
  ) : super(const PrayerTimesState());

  final PrayerCacheService _cacheService;
  final PrayerCalculationService _calculator;
  final PreferencesService _preferences;
  final NotificationService _notificationService;
  final Ref _ref;

  Future<void> load() async {
    final location = _ref.read(locationProvider).location;
    if (location == null) {
      state = const PrayerTimesState(error: 'Location not set');
      return;
    }

    state = const PrayerTimesState(isLoading: true);
    final now = DateTime.now();
    final method = _preferences.getCalculationMethod();
    final madhab = _preferences.getMadhab();
    final adjustments = _preferences.getPrayerAdjustments();

    try {
      final monthCache = await _cacheService.loadOrCompute(
        latitude: location.latitude,
        longitude: location.longitude,
        timeZoneId: location.timeZoneId,
        methodId: method,
        madhabId: madhab,
        adjustments: adjustments,
        month: DateTime(now.year, now.month),
      );

      final todayKey = _dateKey(now);
      final tomorrow = DateTime(now.year, now.month, now.day + 1);
      final tomorrowKey = _dateKey(tomorrow);

      final today = monthCache[todayKey];
      final tomorrowTimes = monthCache[tomorrowKey];

      if (today == null) {
        state = const PrayerTimesState(error: 'Unable to calculate prayer times');
        return;
      }

      final schedule = _calculator.buildSchedule(today, location.timeZoneId);
      state = PrayerTimesState(
        today: today,
        tomorrow: tomorrowTimes,
        schedule: schedule,
        isLoading: false,
      );

      await _notificationService.reschedulePrayerNotifications(
        today: today,
        tomorrow: tomorrowTimes,
        timeZoneId: location.timeZoneId,
      );
    } catch (error) {
      state = PrayerTimesState(
        isLoading: false,
        error: 'Failed to load prayer times',
      );
    }
  }

  String _dateKey(DateTime date) {
    return '${date.year.toString().padLeft(4, '0')}-'
        '${date.month.toString().padLeft(2, '0')}-'
        '${date.day.toString().padLeft(2, '0')}';
  }
}

final prayerTimesProvider =
    StateNotifierProvider<PrayerTimesNotifier, PrayerTimesState>((ref) {
      return PrayerTimesNotifier(
        ref.watch(prayerCacheServiceProvider),
        ref.watch(prayerCalculationServiceProvider),
        ref.watch(preferencesServiceProvider),
        ref.watch(notificationServiceProvider),
        ref,
      );
    });

final tasbihCountProvider = StateProvider<int>((ref) {
  return ref.watch(preferencesServiceProvider).getTasbihCount();
});
