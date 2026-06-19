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
}
