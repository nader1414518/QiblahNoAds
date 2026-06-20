import 'package:adhan/adhan.dart';

/// Qiblah bearing from north (clockwise degrees).
class QiblahBearing {
  static double fromNorth(double latitude, double longitude) {
    return Qibla(Coordinates(latitude, longitude)).direction;
  }

  static double normalizeAngle(double degrees) {
    var value = degrees % 360;
    if (value > 180) {
      value -= 360;
    }
    if (value < -180) {
      value += 360;
    }
    return value;
  }
}
