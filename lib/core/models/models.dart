import 'enums.dart';

class City {
  const City({
    required this.name,
    required this.country,
    required this.lat,
    required this.lng,
  });

  final String name;
  final String country;
  final double lat;
  final double lng;

  String get displayName => '$name, $country';

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      name: json['name'] as String,
      country: json['country'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );
  }
}

class AppLocation {
  const AppLocation({
    required this.latitude,
    required this.longitude,
    required this.cityName,
    required this.source,
  });

  final double latitude;
  final double longitude;
  final String cityName;
  final LocationSource source;
}

class AzkarItem {
  const AzkarItem({
    required this.arabic,
    required this.english,
    required this.repeat,
  });

  final String arabic;
  final String english;
  final int repeat;

  factory AzkarItem.fromJson(Map<String, dynamic> json) {
    return AzkarItem(
      arabic: json['arabic'] as String,
      english: json['english'] as String,
      repeat: json['repeat'] as int? ?? 1,
    );
  }
}

class DailyPrayerTimes {
  const DailyPrayerTimes({
    required this.date,
    required this.times,
  });

  final DateTime date;
  final Map<PrayerName, DateTime> times;
}

class PrayerScheduleEntry {
  const PrayerScheduleEntry({
    required this.name,
    required this.time,
    required this.isNext,
    required this.isCurrent,
  });

  final PrayerName name;
  final DateTime time;
  final bool isNext;
  final bool isCurrent;
}
