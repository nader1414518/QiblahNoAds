import 'dart:convert';

import '../core/models/enums.dart';
import '../core/models/models.dart';
import 'prayer_calculation_service.dart';
import 'preferences_service.dart';

class PrayerCacheService {
  PrayerCacheService(this._preferences, this._calculator);

  final PreferencesService _preferences;
  final PrayerCalculationService _calculator;

  Future<Map<String, DailyPrayerTimes>> loadOrCompute({
    required double latitude,
    required double longitude,
    required CalculationMethodId methodId,
    required MadhabId madhabId,
    required DateTime month,
  }) async {
    final key = _calculator.cacheKey(
      latitude: latitude,
      longitude: longitude,
      methodId: methodId,
      madhabId: madhabId,
      month: month,
    );

    final cachedKey = _preferences.getPrayerCacheKey();
    final cachedJson = _preferences.getPrayerCache();

    if (cachedKey == key && cachedJson != null) {
      return _decodeCache(cachedJson);
    }

    final computed = _calculator.calculateMonth(
      latitude: latitude,
      longitude: longitude,
      month: month,
      methodId: methodId,
      madhabId: madhabId,
    );

    final encoded = _encodeCache(computed);
    await _preferences.savePrayerCache(cacheKey: key, json: encoded);
    return _decodeCache(encoded);
  }

  Map<String, DailyPrayerTimes> _decodeCache(String json) {
    final decoded = jsonDecode(json) as Map<String, dynamic>;
    final result = <String, DailyPrayerTimes>{};

    for (final entry in decoded.entries) {
      final dateParts = entry.key.split('-');
      final date = DateTime(
        int.parse(dateParts[0]),
        int.parse(dateParts[1]),
        int.parse(dateParts[2]),
      );
      final timesMap = entry.value as Map<String, dynamic>;
      final times = <PrayerName, DateTime>{};

      for (final prayer in PrayerName.values) {
        final iso = timesMap[prayer.storageKey] as String?;
        if (iso != null) {
          times[prayer] = DateTime.parse(iso);
        }
      }

      result[entry.key] = DailyPrayerTimes(date: date, times: times);
    }

    return result;
  }

  String _encodeCache(List<DailyPrayerTimes> days) {
    final map = <String, dynamic>{};

    for (final day in days) {
      final key =
          '${day.date.year.toString().padLeft(4, '0')}-'
          '${day.date.month.toString().padLeft(2, '0')}-'
          '${day.date.day.toString().padLeft(2, '0')}';
      map[key] = day.times.map(
        (prayer, time) => MapEntry(prayer.storageKey, time.toIso8601String()),
      );
    }

    return jsonEncode(map);
  }
}
