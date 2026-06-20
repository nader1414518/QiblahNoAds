import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

import '../../l10n/app_localizations.dart';
import '../../core/models/enums.dart';
import '../../core/models/models.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_theme.dart';
import '../../providers/app_providers.dart';
import '../../services/qiblah_compass_service.dart';
import '../../core/widgets/safe_area_widgets.dart';
import '../../core/widgets/settings_button.dart';
import '../location/manual_city_picker.dart';
import 'widgets/calibration_banner.dart';
import 'widgets/qiblah_accuracy_disclaimer.dart';
import 'widgets/qiblah_compass_face.dart';
import 'widgets/sensor_error.dart';

class QiblahScreen extends ConsumerStatefulWidget {
  const QiblahScreen({super.key});

  @override
  ConsumerState<QiblahScreen> createState() => _QiblahScreenState();
}

class _QiblahScreenState extends ConsumerState<QiblahScreen> {
  bool _isUsingCurrentLocation = false;

  Future<void> _useCurrentLocation(BuildContext context) async {
    if (_isUsingCurrentLocation) {
      return;
    }

    setState(() => _isUsingCurrentLocation = true);
    try {
      await ref.read(locationProvider.notifier).refreshGps();
      await ref.read(prayerTimesProvider.notifier).load();

      if (!context.mounted) {
        return;
      }

      final location = ref.read(locationProvider).location;
      final messenger = ScaffoldMessenger.of(context);
      final l10n = AppLocalizations.of(context);
      if (location?.source == LocationSource.gps) {
        messenger.showSnackBar(
          SnackBar(
            content: Text(l10n.currentLocationSaved),
            behavior: SnackBarBehavior.floating,
            backgroundColor: AppColors.emeraldPrimary,
          ),
        );
      } else {
        messenger.showSnackBar(
          SnackBar(
            content: Text(l10n.unableToGetGps),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isUsingCurrentLocation = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final locationState = ref.watch(locationProvider);
    final isLocationLoading =
        locationState.isLoading || _isUsingCurrentLocation;

    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.qiblahTitle),
        actions: [
          IconButton(
            tooltip: l10n.useCurrentLocation,
            onPressed: isLocationLoading ? null : () => _useCurrentLocation(context),
            icon: isLocationLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.my_location),
          ),
          IconButton(
            icon: const Icon(Icons.location_city_outlined),
            tooltip: l10n.changeCity,
            onPressed: isLocationLoading
                ? null
                : () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => ManualCityPicker(
                          onSelected: () {
                            ref.read(prayerTimesProvider.notifier).load();
                          },
                        ),
                      ),
                    );
                  },
          ),
          const SettingsIconButton(),
        ],
      ),
      body: SafeScreenBody(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: _QiblahBody(locationState: locationState),
            ),
            const QiblahAccuracyDisclaimer(),
          ],
        ),
      ),
    );
  }
}

class _QiblahBody extends ConsumerStatefulWidget {
  const _QiblahBody({required this.locationState});

  final LocationState locationState;

  @override
  ConsumerState<_QiblahBody> createState() => _QiblahBodyState();
}

class _QiblahBodyState extends ConsumerState<_QiblahBody> {
  bool _isInitializing = true;
  LocationStatus? _locationStatus;
  int _compassRestartGeneration = 0;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      final locationStatus = await FlutterQiblah.checkLocationStatus();
      if (!mounted) {
        return;
      }

      setState(() {
        _locationStatus = locationStatus;
        _isInitializing = false;
      });
    } catch (_) {
      if (!mounted) {
        return;
      }
      setState(() => _isInitializing = false);
    }
  }

  Future<void> _retryLocationAccess() async {
    if (!mounted) {
      return;
    }
    setState(() => _isInitializing = true);
    await ref.read(locationProvider.notifier).refreshGps();
    await _initialize();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final location = widget.locationState.location;

    ref.listen<LocationState>(locationProvider, (previous, next) {
      if (previous?.location != next.location) {
        setState(() => _compassRestartGeneration++);
      }
    });

    if (_isInitializing) {
      return const Center(child: CircularProgressIndicator());
    }

    if (widget.locationState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final status = _locationStatus;
    if (status == null) {
      return _LocationError(
        message: l10n.locationStatusUnavailable,
        onRetry: _retryLocationAccess,
      );
    }

    if (location == null) {
      if (!status.enabled) {
        return _LocationError(
          message: l10n.locationEnableOrSelectCity,
          onRetry: _retryLocationAccess,
        );
      }

      return _LocationError(
        message: l10n.locationUnavailableSelectCity,
        onRetry: _retryLocationAccess,
      );
    }

    if (!status.enabled) {
      return _LocationError(
        message: l10n.locationEnableServices,
        onRetry: _retryLocationAccess,
      );
    }

    switch (status.status) {
      case LocationPermission.always:
      case LocationPermission.whileInUse:
        break;
      case LocationPermission.denied:
      case LocationPermission.deniedForever:
        if (location.source == LocationSource.manual) {
          break;
        }
        return _LocationError(
          message: l10n.locationPermissionDenied,
          onRetry: _retryLocationAccess,
        );
      default:
        return _LocationError(
          message: l10n.locationUnavailable,
          onRetry: _retryLocationAccess,
        );
    }

    return QiblahCompassWidget(
      key: ValueKey(
        '${_locationKey(location)}:$_compassRestartGeneration',
      ),
      latitude: location.latitude,
      longitude: location.longitude,
      cityName: location.cityName,
    );
  }

  String _locationKey(AppLocation location) {
    return '${location.latitude}:${location.longitude}:'
        '${location.source.name}:${location.cityName}';
  }
}

class _LocationError extends StatelessWidget {
  const _LocationError({
    required this.message,
    required this.onRetry,
  });

  final String message;
  final Future<void> Function() onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_off, size: 48),
            const SizedBox(height: 16),
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => onRetry(),
              child: Text(l10n.retry),
            ),
          ],
        ),
      ),
    );
  }
}

class QiblahCompassWidget extends ConsumerStatefulWidget {
  const QiblahCompassWidget({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.cityName,
  });

  final double latitude;
  final double longitude;
  final String cityName;

  @override
  ConsumerState<QiblahCompassWidget> createState() => _QiblahCompassWidgetState();
}

class _QiblahCompassWidgetState extends ConsumerState<QiblahCompassWidget> {
  bool _wasAligned = false;
  bool _streamTimedOut = false;
  StreamSubscription<QiblahCompassUpdate>? _subscription;
  QiblahDirection? _direction;
  Timer? _timeoutTimer;
  QiblahCompassService? _compassService;
  bool _sensorNeedsCalibration = false;

  @override
  void initState() {
    super.initState();
    _startCompassStream();
  }

  @override
  void didUpdateWidget(covariant QiblahCompassWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.latitude != widget.latitude ||
        oldWidget.longitude != widget.longitude ||
        oldWidget.cityName != widget.cityName) {
      _wasAligned = false;
      _startCompassStream();
    }
  }

  void _startCompassStream() {
    _subscription?.cancel();
    _timeoutTimer?.cancel();
    _compassService?.dispose();

    _compassService = QiblahCompassService(
      latitude: widget.latitude,
      longitude: widget.longitude,
    );

    setState(() {
      _direction = null;
      _streamTimedOut = false;
      _wasAligned = false;
      _sensorNeedsCalibration = false;
    });

    _subscription = _compassService!.stream.listen(
      (update) {
        if (!mounted) {
          return;
        }
        setState(() {
          if (update.direction != null) {
            _direction = update.direction;
          }
          _sensorNeedsCalibration = update.needsCalibration;
        });
      },
      onError: (_) {
        if (!mounted) {
          return;
        }
        setState(() => _streamTimedOut = true);
      },
    );

    _timeoutTimer = Timer(const Duration(seconds: 8), () {
      if (!mounted || _direction != null || _sensorNeedsCalibration) {
        return;
      }
      setState(() => _streamTimedOut = true);
    });
  }

  @override
  void dispose() {
    _timeoutTimer?.cancel();
    _subscription?.cancel();
    _compassService?.dispose();
    super.dispose();
  }

  void _handleAlignment(double offset) {
    final aligned =
        offset.abs() <= AppConstants.qiblahAlignmentThreshold;
    if (aligned && !_wasAligned) {
      HapticFeedback.mediumImpact();
    }
    _wasAligned = aligned;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    if (_streamTimedOut && _direction == null && !_sensorNeedsCalibration) {
      return SensorErrorWidget(message: l10n.compassUnavailable);
    }

    final direction = _direction;
    if (direction == null) {
      return Column(
        children: [
          if (_sensorNeedsCalibration) const CalibrationBanner(),
          const Expanded(
            child: Center(child: CircularProgressIndicator()),
          ),
        ],
      );
    }

    _handleAlignment(direction.offset);
    final aligned =
        direction.offset.abs() <= AppConstants.qiblahAlignmentThreshold;
    final needsCalibration = _sensorNeedsCalibration ||
        direction.offset.abs() >= AppConstants.qiblahCalibrationThreshold;

    return Column(
      children: [
        if (needsCalibration) const CalibrationBanner(),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            widget.cityName,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        Expanded(
          child: Center(
            child: QiblahCompassFace(
              direction: direction.direction,
              qiblah: direction.qiblah,
              aligned: aligned,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: QiblahStatusBanner(
            aligned: aligned,
            offset: direction.offset,
          ),
        ),
      ],
    );
  }
}
