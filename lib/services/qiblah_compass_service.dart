import 'dart:async';

import 'package:flutter_compass_v2/flutter_compass_v2.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';

import 'qiblah_bearing.dart';

/// Latest compass reading, including calibration state when heading is withheld.
class QiblahCompassUpdate {
  const QiblahCompassUpdate({
    this.direction,
    required this.needsCalibration,
  });

  final QiblahDirection? direction;
  final bool needsCalibration;
}

/// Builds a Qiblah direction stream from the device compass and a fixed location.
///
/// Uses the platform compass heading as reported by [FlutterCompass], combined
/// with a Qiblah bearing from [latitude]/[longitude].
class QiblahCompassService {
  QiblahCompassService({
    required this.latitude,
    required this.longitude,
    this.smoothingAlpha = 0.18,
  });

  final double latitude;
  final double longitude;
  final double smoothingAlpha;

  double? _smoothedHeading;
  double? _lastAccuracy;

  /// Normalizes any angle to \[0, 360).
  static double normalizeHeading(double degrees) {
    var value = degrees % 360;
    if (value < 0) {
      value += 360;
    }
    return value;
  }

  /// Smooths compass jitter while handling the 0°/360° wrap.
  static double smoothAngle(double previous, double next, double alpha) {
    final delta = ((next - previous + 540) % 360) - 180;
    return normalizeHeading(previous + alpha * delta);
  }

  /// Whether the latest compass reading is low quality and needs calibration.
  static bool needsSensorCalibration(double? accuracy) {
    if (accuracy == null) {
      return false;
    }
    return accuracy < 0 || accuracy >= 45;
  }

  QiblahCompassUpdate updateFromEvent(CompassEvent event) {
    _lastAccuracy = event.accuracy;
    final needsCalibration = needsSensorCalibration(event.accuracy);
    final direction = directionFromEvent(event);

    return QiblahCompassUpdate(
      direction: direction,
      needsCalibration: needsCalibration,
    );
  }

  QiblahDirection? directionFromEvent(CompassEvent event) {
    final rawHeading = event.heading;
    if (rawHeading == null) {
      return null;
    }

    final heading = normalizeHeading(rawHeading);

    _smoothedHeading = _smoothedHeading == null
        ? heading
        : smoothAngle(_smoothedHeading!, heading, smoothingAlpha);

    final bearing = QiblahBearing.fromNorth(latitude, longitude);
    final deviceHeading = _smoothedHeading!;
    final qiblah = normalizeHeading(deviceHeading + (360 - bearing));
    final offset = QiblahBearing.normalizeAngle(bearing - deviceHeading);

    return QiblahDirection(qiblah, deviceHeading, offset);
  }

  Stream<QiblahCompassUpdate> get stream {
    final events = FlutterCompass.events;
    if (events == null) {
      return const Stream.empty();
    }

    return events.map(updateFromEvent);
  }

  bool get sensorNeedsCalibration => needsSensorCalibration(_lastAccuracy);

  void reset() {
    _smoothedHeading = null;
    _lastAccuracy = null;
  }

  void dispose() {
    reset();
  }
}
