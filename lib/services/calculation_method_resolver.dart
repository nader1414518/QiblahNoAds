import 'dart:math' show asin, cos, pi, sin, sqrt;

import '../core/models/models.dart';
import '../core/models/enums.dart';

class CalculationMethodResolver {
  static CalculationMethodId forCountry(String country) {
    switch (country) {
      case 'Saudi Arabia':
      case 'UAE':
      case 'Qatar':
      case 'Kuwait':
      case 'Bahrain':
      case 'Oman':
        return CalculationMethodId.ummAlQura;
      case 'Egypt':
      case 'Sudan':
        return CalculationMethodId.egyptian;
      case 'USA':
      case 'Canada':
        return CalculationMethodId.isna;
      case 'Pakistan':
      case 'Bangladesh':
      case 'Afghanistan':
        return CalculationMethodId.karachi;
      default:
        return CalculationMethodId.muslimWorldLeague;
    }
  }

  static CalculationMethodId forCoordinates(
    double latitude,
    double longitude,
    List<City> cities,
  ) {
    if (cities.isEmpty) {
      return CalculationMethodId.muslimWorldLeague;
    }

    City nearest = cities.first;
    var nearestDistance = double.infinity;

    for (final city in cities) {
      final distance = _distanceKm(
        latitude,
        longitude,
        city.lat,
        city.lng,
      );
      if (distance < nearestDistance) {
        nearestDistance = distance;
        nearest = city;
      }
    }

    return forCountry(nearest.country);
  }

  static double _distanceKm(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    const earthRadiusKm = 6371.0;
    final dLat = _toRadians(lat2 - lat1);
    final dLon = _toRadians(lon2 - lon1);
    final a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_toRadians(lat1)) *
            cos(_toRadians(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    return earthRadiusKm * 2 * asin(sqrt(a));
  }

  static double _toRadians(double degrees) => degrees * pi / 180;
}
