import 'package:adhan/adhan.dart' hide PrayerAdjustments;

import '../core/models/enums.dart';
import '../core/models/models.dart';
import 'timezone_service.dart';

class PrayerCalculationService {
  PrayerCalculationService(this._timezoneService);

  final TimezoneService _timezoneService;

  CalculationParameters _parameters(
    CalculationMethodId methodId,
    MadhabId madhabId,
    PrayerTimeAdjustments adjustments,
  ) {
    final method = switch (methodId) {
      CalculationMethodId.muslimWorldLeague =>
        CalculationMethod.muslim_world_league,
      CalculationMethodId.isna => CalculationMethod.north_america,
      CalculationMethodId.ummAlQura => CalculationMethod.umm_al_qura,
      CalculationMethodId.egyptian => CalculationMethod.egyptian,
      CalculationMethodId.karachi => CalculationMethod.karachi,
    };

    final params = method.getParameters();
    params.madhab = madhabId == MadhabId.hanafi ? Madhab.hanafi : Madhab.shafi;
    params.adjustments.fajr = adjustments.fajr;
    params.adjustments.dhuhr = adjustments.dhuhr;
    params.adjustments.asr = adjustments.asr;
    params.adjustments.maghrib = adjustments.maghrib;
    params.adjustments.isha = adjustments.isha;
    return params;
  }

  DailyPrayerTimes calculateForDate({
    required double latitude,
    required double longitude,
    required String timeZoneId,
    required DateTime date,
    required CalculationMethodId methodId,
    required MadhabId madhabId,
    required PrayerTimeAdjustments adjustments,
  }) {
    final coordinates = Coordinates(latitude, longitude);
    final params = _parameters(methodId, madhabId, adjustments);
    final utcOffset = _timezoneService.utcOffsetForDate(timeZoneId, date);
    final prayerTimes = PrayerTimes(
      coordinates,
      DateComponents.from(date),
      params,
      utcOffset: utcOffset,
    );

    return DailyPrayerTimes(
      date: DateTime(date.year, date.month, date.day),
      times: {
        PrayerName.fajr: prayerTimes.fajr,
        PrayerName.sunrise: prayerTimes.sunrise,
        PrayerName.dhuhr: prayerTimes.dhuhr,
        PrayerName.asr: prayerTimes.asr,
        PrayerName.maghrib: prayerTimes.maghrib,
        PrayerName.isha: prayerTimes.isha,
      },
    );
  }

  List<DailyPrayerTimes> calculateMonth({
    required double latitude,
    required double longitude,
    required String timeZoneId,
    required DateTime month,
    required CalculationMethodId methodId,
    required MadhabId madhabId,
    required PrayerTimeAdjustments adjustments,
  }) {
    final daysInMonth = DateTime(month.year, month.month + 1, 0).day;
    return List.generate(daysInMonth, (index) {
      final day = DateTime(month.year, month.month, index + 1);
      return calculateForDate(
        latitude: latitude,
        longitude: longitude,
        timeZoneId: timeZoneId,
        date: day,
        methodId: methodId,
        madhabId: madhabId,
        adjustments: adjustments,
      );
    });
  }

  PrayerName? nextPrayer(DailyPrayerTimes daily, String timeZoneId) {
    final now = _timezoneService.nowInLocation(timeZoneId);
    return _nextPrayerForNow(daily, now);
  }

  PrayerName? _nextPrayerForNow(DailyPrayerTimes daily, DateTime now) {
    final ordered = [
      PrayerName.fajr,
      PrayerName.dhuhr,
      PrayerName.asr,
      PrayerName.maghrib,
      PrayerName.isha,
    ];

    for (final prayer in ordered) {
      final time = daily.times[prayer]!;
      if (time.isAfter(now)) {
        return prayer;
      }
    }

    return PrayerName.fajr;
  }

  DateTime? nextPrayerTime(
    DailyPrayerTimes daily,
    String timeZoneId, {
    DailyPrayerTimes? tomorrow,
  }) {
    final now = _timezoneService.nowInLocation(timeZoneId);
    final next = _nextPrayerForNow(daily, now);
    if (next == null) {
      return null;
    }

    final time = daily.times[next]!;
    if (time.isAfter(now)) {
      return time;
    }

    return tomorrow?.times[PrayerName.fajr];
  }

  List<PrayerScheduleEntry> buildSchedule(
    DailyPrayerTimes daily,
    String timeZoneId,
  ) {
    final now = _timezoneService.nowInLocation(timeZoneId);
    final ordered = [
      PrayerName.fajr,
      PrayerName.sunrise,
      PrayerName.dhuhr,
      PrayerName.asr,
      PrayerName.maghrib,
      PrayerName.isha,
    ];

    final next = _nextPrayerForNow(daily, now);
    PrayerName? current;

    for (var i = ordered.length - 1; i >= 0; i--) {
      final prayer = ordered[i];
      if (prayer == PrayerName.sunrise) {
        continue;
      }
      final time = daily.times[prayer]!;
      if (!time.isAfter(now)) {
        current = prayer;
        break;
      }
    }

    return ordered.map((prayer) {
      return PrayerScheduleEntry(
        name: prayer,
        time: daily.times[prayer]!,
        isNext: prayer == next,
        isCurrent: prayer == current,
      );
    }).toList();
  }

  String cacheKey({
    required double latitude,
    required double longitude,
    required String timeZoneId,
    required CalculationMethodId methodId,
    required MadhabId madhabId,
    required PrayerTimeAdjustments adjustments,
    required DateTime month,
  }) {
    return '${latitude.toStringAsFixed(4)}_'
        '${longitude.toStringAsFixed(4)}_'
        '${timeZoneId}_'
        '${methodId.storageKey}_'
        '${madhabId.storageKey}_'
        '${adjustments.fajr}_${adjustments.dhuhr}_${adjustments.asr}_'
        '${adjustments.maghrib}_${adjustments.isha}_'
        '${month.year}_${month.month}';
  }
}
