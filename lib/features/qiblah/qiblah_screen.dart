import 'dart:async';
import 'dart:math' show pi;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';

import '../../core/constants/app_constants.dart';
import '../../core/theme/app_theme.dart';
import '../../providers/app_providers.dart';
import '../location/manual_city_picker.dart';
import 'widgets/calibration_banner.dart';
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
  final _locationStreamController = StreamController<LocationStatus>.broadcast();
  bool? _sensorSupported;

  Stream<LocationStatus> get _locationStream => _locationStreamController.stream;

  @override
  void initState() {
    super.initState();
    _checkSensorSupport();
    _checkLocationStatus();
  }

  Future<void> _checkSensorSupport() async {
    try {
      final supported = await FlutterQiblah.androidDeviceSensorSupport();
      setState(() => _sensorSupported = supported);
    } catch (_) {
      setState(() => _sensorSupported = true);
    }
  }

  @override
  void dispose() {
    _locationStreamController.close();
    FlutterQiblah().dispose();
    super.dispose();
  }

  Future<void> _checkLocationStatus() async {
    final locationStatus = await FlutterQiblah.checkLocationStatus();
    if (!_locationStreamController.isClosed) {
      _locationStreamController.add(locationStatus);
    }
  }

  Future<void> _retryLocationAccess() async {
    await ref.read(locationProvider.notifier).refreshGps();
    await _checkLocationStatus();
  }

  @override
  Widget build(BuildContext context) {
    if (_sensorSupported == false) {
      return const SensorErrorWidget(
        message:
            'This device does not have a compass sensor. Qiblah direction cannot be shown.',
      );
    }

    return StreamBuilder<LocationStatus>(
      stream: _locationStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final status = snapshot.data;
        if (status == null) {
          return const Center(child: CircularProgressIndicator());
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
              message: 'Location permission denied',
              onRetry: _retryLocationAccess,
            );
          case LocationPermission.deniedForever:
            return _LocationError(
              message: 'Location permission permanently denied',
              onRetry: _retryLocationAccess,
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
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

class QiblahCompassWidget extends StatefulWidget {
  const QiblahCompassWidget({super.key});

  @override
  State<QiblahCompassWidget> createState() => _QiblahCompassWidgetState();
}

class _QiblahCompassWidgetState extends State<QiblahCompassWidget> {
  bool _wasAligned = false;
  final _compassSvg = SvgPicture.asset('assets/compass.svg');
  final _needleSvg = SvgPicture.asset(
    'assets/needle.svg',
    fit: BoxFit.contain,
    height: 280,
    alignment: Alignment.center,
  );

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
    return StreamBuilder<QiblahDirection>(
      stream: FlutterQiblah.qiblahStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final direction = snapshot.data;
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
            Expanded(
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: aligned
                              ? AppTheme.accentGreen
                              : Colors.transparent,
                          width: 4,
                        ),
                      ),
                      child: Transform.rotate(
                        angle: direction.direction * (pi / 180) * -1,
                        child: _compassSvg,
                      ),
                    ),
                    Transform.rotate(
                      angle: direction.qiblah * (pi / 180) * -1,
                      alignment: Alignment.center,
                      child: _needleSvg,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    aligned ? 'Aligned with Qiblah' : 'Rotate to align',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: aligned ? AppTheme.primaryGreen : null,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text('Offset: ${direction.offset.toStringAsFixed(1)}°'),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
