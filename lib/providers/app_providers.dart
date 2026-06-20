import 'package:flutter/material.dart';
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

final localeProvider = StateProvider<Locale>((ref) {
  return ref.watch(preferencesServiceProvider).getEffectiveLocale();
});

class LocationState {
  const LocationState({
    this.location,
    this.isLoading = false,
    this.needsManualSelection = false,
    this.errorCode,
  });

  final AppLocation? location;
  final bool isLoading;
  final bool needsManualSelection;
  final String? errorCode;

  LocationState copyWith({
    AppLocation? location,
    bool? isLoading,
    bool? needsManualSelection,
    String? errorCode,
    bool clearErrorCode = false,
  }) {
    return LocationState(
      location: location ?? this.location,
      isLoading: isLoading ?? this.isLoading,
      needsManualSelection: needsManualSelection ?? this.needsManualSelection,
      errorCode: clearErrorCode ? null : (errorCode ?? this.errorCode),
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

    state = state.copyWith(isLoading: true, clearErrorCode: true);

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
        errorCode: 'location_unavailable_select_city',
      );
    } catch (_) {
      state = state.copyWith(
        isLoading: false,
        needsManualSelection: true,
        errorCode: 'location_unavailable_select_city',
      );
    }
  }

  Future<void> refreshGps() async {
    state = state.copyWith(isLoading: true, clearErrorCode: true);
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
        errorCode: 'unable_to_get_gps',
      );
    } catch (_) {
      state = state.copyWith(
        isLoading: false,
        needsManualSelection: true,
        errorCode: 'unable_to_get_gps',
      );
    }
  }

  Future<void> selectCity(City city) async {
    state = state.copyWith(isLoading: true, clearErrorCode: true);
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
    this.errorCode,
  });

  final DailyPrayerTimes? today;
  final DailyPrayerTimes? tomorrow;
  final List<PrayerScheduleEntry> schedule;
  final bool isLoading;
  final String? errorCode;

  PrayerTimesState copyWith({
    DailyPrayerTimes? today,
    DailyPrayerTimes? tomorrow,
    List<PrayerScheduleEntry>? schedule,
    bool? isLoading,
    String? errorCode,
    bool clearErrorCode = false,
  }) {
    return PrayerTimesState(
      today: today ?? this.today,
      tomorrow: tomorrow ?? this.tomorrow,
      schedule: schedule ?? this.schedule,
      isLoading: isLoading ?? this.isLoading,
      errorCode: clearErrorCode ? null : (errorCode ?? this.errorCode),
    );
  }
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
  Future<void>? _ongoingLoad;
  int _loadGeneration = 0;

  Future<void> load() {
    final existing = _ongoingLoad;
    if (existing != null) {
      return existing;
    }

    final generation = ++_loadGeneration;
    final future = _loadImpl(generation);
    _ongoingLoad = future;
    return future.whenComplete(() {
      if (_ongoingLoad == future) {
        _ongoingLoad = null;
      }
    });
  }

  Future<void> _loadImpl(int generation) async {
    final location = _ref.read(locationProvider).location;
    if (location == null) {
      if (generation == _loadGeneration) {
        state = const PrayerTimesState(errorCode: 'location_not_set');
      }
      return;
    }

    if (generation == _loadGeneration) {
      state = state.copyWith(isLoading: true, clearErrorCode: true);
    }

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

      if (generation != _loadGeneration) {
        return;
      }

      final todayKey = _dateKey(now);
      final tomorrow = DateTime(now.year, now.month, now.day + 1);
      final tomorrowKey = _dateKey(tomorrow);

      final today = monthCache[todayKey];
      final tomorrowTimes = monthCache[tomorrowKey];

      if (today == null) {
        state = const PrayerTimesState(errorCode: 'unable_to_calculate');
        return;
      }

      final schedule = _calculator.buildSchedule(today, location.timeZoneId);
      state = PrayerTimesState(
        today: today,
        tomorrow: tomorrowTimes,
        schedule: schedule,
        isLoading: false,
      );

      try {
        await _notificationService.reschedulePrayerNotifications(
          today: today,
          tomorrow: tomorrowTimes,
          timeZoneId: location.timeZoneId,
        );
      } catch (_) {
        // Prayer times should still display when notification scheduling fails.
      }
    } catch (_) {
      if (generation != _loadGeneration) {
        return;
      }

      if (state.today != null) {
        state = state.copyWith(isLoading: false, errorCode: 'failed_to_load');
        return;
      }

      state = const PrayerTimesState(
        isLoading: false,
        errorCode: 'failed_to_load',
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
