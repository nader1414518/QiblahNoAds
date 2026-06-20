import 'package:lat_lng_to_timezone/lat_lng_to_timezone.dart' as tz_lookup;
import 'package:timezone/data/latest.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

class TimezoneService {
  static bool _initialized = false;

  static void ensureInitialized() {
    if (_initialized) {
      return;
    }
    tz_data.initializeTimeZones();
    _initialized = true;
  }

  String resolveTimeZoneId({
    required double latitude,
    required double longitude,
    String? cityTimeZoneId,
  }) {
    if (cityTimeZoneId != null && cityTimeZoneId.isNotEmpty) {
      return cityTimeZoneId;
    }

    try {
      return tz_lookup.latLngToTimezoneString(latitude, longitude);
    } catch (_) {
      return 'UTC';
    }
  }

  Duration utcOffsetForDate(String timeZoneId, DateTime date) {
    ensureInitialized();
    try {
      final location = tz.getLocation(timeZoneId);
      final zoned = tz.TZDateTime(
        location,
        date.year,
        date.month,
        date.day,
        12,
      );
      return Duration(seconds: zoned.timeZoneOffset.inSeconds);
    } catch (_) {
      return DateTime.now().timeZoneOffset;
    }
  }

  /// Wall-clock "now" in [timeZoneId], encoded as UTC to match adhan output.
  DateTime nowInLocation(String timeZoneId) {
    ensureInitialized();
    try {
      final location = tz.getLocation(timeZoneId);
      final zoned = tz.TZDateTime.now(location);
      return DateTime.utc(
        zoned.year,
        zoned.month,
        zoned.day,
        zoned.hour,
        zoned.minute,
        zoned.second,
        zoned.millisecond,
        zoned.microsecond,
      );
    } catch (_) {
      final now = DateTime.now();
      return DateTime.utc(
        now.year,
        now.month,
        now.day,
        now.hour,
        now.minute,
        now.second,
        now.millisecond,
        now.microsecond,
      );
    }
  }

  tz.TZDateTime toLocationDateTime(String timeZoneId, DateTime prayerTime) {
    ensureInitialized();
    try {
      final location = tz.getLocation(timeZoneId);
      return tz.TZDateTime(
        location,
        prayerTime.year,
        prayerTime.month,
        prayerTime.day,
        prayerTime.hour,
        prayerTime.minute,
        prayerTime.second,
      );
    } catch (_) {
      return tz.TZDateTime.utc(
        prayerTime.year,
        prayerTime.month,
        prayerTime.day,
        prayerTime.hour,
        prayerTime.minute,
        prayerTime.second,
      );
    }
  }
}
