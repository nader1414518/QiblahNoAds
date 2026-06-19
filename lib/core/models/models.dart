import 'enums.dart';

class City {
  const City({
    required this.name,
    required this.country,
    required this.lat,
    required this.lng,
    required this.tz,
  });

  final String name;
  final String country;
  final double lat;
  final double lng;
  final String tz;

  String get displayName => '$name, $country';

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      name: json['name'] as String,
      country: json['country'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      tz: json['tz'] as String? ?? 'UTC',
    );
  }
}

class AppLocation {
  const AppLocation({
    required this.latitude,
    required this.longitude,
    required this.cityName,
    required this.source,
    required this.timeZoneId,
  });

  final double latitude;
  final double longitude;
  final String cityName;
  final LocationSource source;
  final String timeZoneId;
}

class AzkarReference {
  const AzkarReference({
    required this.hisn,
    required this.type,
    required this.citation,
    this.collection,
    this.narrator,
    this.grade,
  });

  final int hisn;
  final String type;
  final String citation;
  final String? collection;
  final String? narrator;
  final String? grade;

  factory AzkarReference.fromJson(Map<String, dynamic> json) {
    return AzkarReference(
      hisn: json['hisn'] as int,
      type: json['type'] as String,
      citation: json['citation'] as String,
      collection: json['collection'] as String?,
      narrator: json['narrator'] as String?,
      grade: json['grade'] as String?,
    );
  }
}

class AzkarItem {
  const AzkarItem({
    required this.arabic,
    required this.english,
    required this.repeat,
    this.reference,
    this.source,
  });

  final String arabic;
  final String english;
  final int repeat;
  final AzkarReference? reference;
  final String? source;

  factory AzkarItem.fromJson(Map<String, dynamic> json) {
    final referenceJson = json['reference'];
    return AzkarItem(
      arabic: json['arabic'] as String,
      english: json['english'] as String,
      repeat: json['repeat'] as int? ?? 1,
      reference: referenceJson is Map<String, dynamic>
          ? AzkarReference.fromJson(referenceJson)
          : null,
      source: json['source'] as String?,
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

class PrayerTimeAdjustments {
  const PrayerTimeAdjustments({
    this.fajr = 0,
    this.dhuhr = 0,
    this.asr = 0,
    this.maghrib = 0,
    this.isha = 0,
  });

  final int fajr;
  final int dhuhr;
  final int asr;
  final int maghrib;
  final int isha;
}
