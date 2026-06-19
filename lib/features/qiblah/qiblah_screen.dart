import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

import '../../core/constants/app_constants.dart';
import '../../providers/app_providers.dart';
import '../location/manual_city_picker.dart';
import 'widgets/calibration_banner.dart';
import 'widgets/qiblah_compass_face.dart';
import 'widgets/sensor_error.dart';

class QiblahScreen extends ConsumerWidget {
  const QiblahScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Qiblah'),
        actions: [
          IconButton(
            icon: const Icon(Icons.location_city_outlined),
            tooltip: 'Change city',
            onPressed: () {
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
        ],
      ),
      body: const _QiblahBody(),
    );
  }
}

class _QiblahBody extends ConsumerStatefulWidget {
  const _QiblahBody();

  @override
  ConsumerState<_QiblahBody> createState() => _QiblahBodyState();
}

class _QiblahBodyState extends ConsumerState<_QiblahBody> {
  bool _isInitializing = true;
  bool? _sensorSupported;
  LocationStatus? _locationStatus;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  void dispose() {
    FlutterQiblah().dispose();
    super.dispose();
  }

  Future<void> _initialize() async {
    try {
      bool? sensorResult;
      try {
        sensorResult = await FlutterQiblah.androidDeviceSensorSupport();
      } catch (_) {
        sensorResult = true;
      }
      final sensorSupported = sensorResult ?? true;

      final locationStatus = await FlutterQiblah.checkLocationStatus();
      if (!mounted) {
        return;
      }

      setState(() {
        _sensorSupported = sensorSupported;
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
    if (_isInitializing) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_sensorSupported == false) {
      return const SensorErrorWidget(
        message:
            'This device does not have a compass sensor. Qiblah direction cannot be shown.',
      );
    }

    final status = _locationStatus;
    if (status == null) {
      return _LocationError(
        message: 'Unable to read location status',
        onRetry: _retryLocationAccess,
      );
    }

    if (!status.enabled) {
      return _LocationError(
        message: 'Please enable location services',
        onRetry: _retryLocationAccess,
      );
    }

    switch (status.status) {
      case LocationPermission.always:
      case LocationPermission.whileInUse:
        return const QiblahCompassWidget();
      case LocationPermission.denied:
        return _LocationError(
          message: 'Location permission denied. Select a city or grant permission.',
          onRetry: _retryLocationAccess,
        );
      case LocationPermission.deniedForever:
        return _LocationError(
          message: 'Location permission permanently denied. Select a city in settings.',
          onRetry: _retryLocationAccess,
        );
      default:
        return _LocationError(
          message: 'Location unavailable',
          onRetry: _retryLocationAccess,
        );
    }
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
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}

class QiblahCompassWidget extends ConsumerStatefulWidget {
  const QiblahCompassWidget({super.key});

  @override
  ConsumerState<QiblahCompassWidget> createState() => _QiblahCompassWidgetState();
}

class _QiblahCompassWidgetState extends ConsumerState<QiblahCompassWidget> {
  bool _wasAligned = false;
  bool _streamTimedOut = false;
  StreamSubscription<QiblahDirection>? _subscription;
  QiblahDirection? _direction;

  @override
  void initState() {
    super.initState();
    _subscription = FlutterQiblah.qiblahStream.listen(
      (direction) {
        if (!mounted) {
          return;
        }
        setState(() => _direction = direction);
      },
      onError: (_) {
        if (!mounted) {
          return;
        }
        setState(() => _streamTimedOut = true);
      },
    );

    Future<void>.delayed(const Duration(seconds: 8), () {
      if (!mounted || _direction != null) {
        return;
      }
      setState(() => _streamTimedOut = true);
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
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
    final cityName = ref.watch(locationProvider).location?.cityName;

    if (_streamTimedOut && _direction == null) {
      return const SensorErrorWidget(
        message:
            'Compass data is unavailable. Try a physical device, set an emulator location, or select a city manually.',
      );
    }

    final direction = _direction;
    if (direction == null) {
      return const Center(child: CircularProgressIndicator());
    }

    _handleAlignment(direction.offset);
    final aligned =
        direction.offset.abs() <= AppConstants.qiblahAlignmentThreshold;
    final needsCalibration =
        direction.offset.abs() >= AppConstants.qiblahCalibrationThreshold;

    return Column(
      children: [
        if (needsCalibration) const CalibrationBanner(),
        if (cityName != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              cityName,
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
