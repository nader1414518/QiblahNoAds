import 'dart:async';
import 'dart:io';

import 'package:flutter_compass_v2/flutter_compass_v2.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:geomag/geomag.dart';
import 'package:sensors_plus/sensors_plus.dart';

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
/// Qiblah bearing comes from [latitude]/[longitude] (any city worldwide).
/// On Android, hold posture is detected automatically so users do not need to
/// calibrate manually.
class QiblahCompassService {
  QiblahCompassService({
    required this.latitude,
    required this.longitude,
    this.smoothingAlpha = 0.18,
  }) {
    if (Platform.isAndroid) {
      _accelerometerSub = accelerometerEventStream().listen(_onAccelerometer);
    }
  }

  final double latitude;
  final double longitude;
  final double smoothingAlpha;

  double? _smoothedHeading;
  double? _lastAccuracy;
  double _androidHoldOffset = 0;
  StreamSubscription<AccelerometerEvent>? _accelerometerSub;

  static final _geoMag = GeoMag();

  /// Normalizes any angle to \[0, 360).
  static double normalizeHeading(double degrees) {
    var value = degrees % 360;
    if (value < 0) {
      value += 360;
    }
    return value;
  }

  /// Automatic Android trim from how the phone is held.
  ///
  /// Flat (screen up): flutter_compass azimuth is 90° ahead of the top edge.
  /// Upright portrait: use the sensor value as-is.
  static double androidHoldOffsetForGravity({
    required double x,
    required double y,
    required double z,
  }) {
    final ax = x.abs();
    final ay = y.abs();
    final az = z.abs();
    final flat = az >= ay && az >= ax;
    return flat ? -90 : 0;
  }

  /// Converts platform compass reading to true north (degrees).
  static double trueHeading({
    required double magneticHeading,
    required double latitude,
    required double longitude,
    bool applyDeclination = true,
    double androidHoldOffset = 0,
  }) {
    var heading = normalizeHeading(magneticHeading);
    if (Platform.isAndroid) {
      heading = normalizeHeading(heading + androidHoldOffset);
      if (applyDeclination) {
        final declination = _geoMag.calculate(latitude, longitude).dec;
        heading = normalizeHeading(heading + declination);
      }
    }
    return heading;
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

  void _onAccelerometer(AccelerometerEvent event) {
    _androidHoldOffset = androidHoldOffsetForGravity(
      x: event.x,
      y: event.y,
      z: event.z,
    );
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

    final heading = trueHeading(
      magneticHeading: rawHeading,
      latitude: latitude,
      longitude: longitude,
      androidHoldOffset: _androidHoldOffset,
    );

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
    _accelerometerSub?.cancel();
    _accelerometerSub = null;
    reset();
  }
}
