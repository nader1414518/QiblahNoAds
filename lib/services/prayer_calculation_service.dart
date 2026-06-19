import 'package:adhan/adhan.dart';

import '../core/models/enums.dart';
import '../core/models/models.dart';

class PrayerCalculationService {
  CalculationParameters _parameters(
    CalculationMethodId methodId,
    MadhabId madhabId,
  ) {
    final method = switch (methodId) {
      CalculationMethodId.muslimWorldLeague =>
        CalculationMethod.muslim_world_league,
      CalculationMethodId.isna => CalculationMethod.north_america,
      CalculationMethodId.ummAlQura => CalculationMethod.umm_al_qura,
    };

    final params = method.getParameters();
    params.madhab = madhabId == MadhabId.hanafi ? Madhab.hanafi : Madhab.shafi;
    return params;
  }

  DailyPrayerTimes calculateForDate({
    required double latitude,
    required double longitude,
    required DateTime date,
    required CalculationMethodId methodId,
    required MadhabId madhabId,
  }) {
    final coordinates = Coordinates(latitude, longitude);
    final params = _parameters(methodId, madhabId);
    final prayerTimes = PrayerTimes(coordinates, DateComponents.from(date), params);

    return DailyPrayerTimes(
      date: DateTime(date.year, date.month, date.day),
      times: {
        PrayerName.fajr: prayerTimes.fajr.toLocal(),
        PrayerName.sunrise: prayerTimes.sunrise.toLocal(),
        PrayerName.dhuhr: prayerTimes.dhuhr.toLocal(),
        PrayerName.asr: prayerTimes.asr.toLocal(),
        PrayerName.maghrib: prayerTimes.maghrib.toLocal(),
        PrayerName.isha: prayerTimes.isha.toLocal(),
      },
    );
  }

  List<DailyPrayerTimes> calculateMonth({
    required double latitude,
    required double longitude,
    required DateTime month,
    required CalculationMethodId methodId,
    required MadhabId madhabId,
  }) {
    final daysInMonth = DateTime(month.year, month.month + 1, 0).day;
    return List.generate(daysInMonth, (index) {
      final day = DateTime(month.year, month.month, index + 1);
      return calculateForDate(
        latitude: latitude,
        longitude: longitude,
        date: day,
        methodId: methodId,
        madhabId: madhabId,
      );
    });
  }

  PrayerName? nextPrayer(DailyPrayerTimes daily, DateTime now) {
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

  DateTime? nextPrayerTime(DailyPrayerTimes daily, DateTime now) {
    final next = nextPrayer(daily, now);
    if (next == null) {
      return null;
    }

    final time = daily.times[next]!;
    if (time.isAfter(now)) {
      return time;
    }

    return null;
  }

  List<PrayerScheduleEntry> buildSchedule(DailyPrayerTimes daily, DateTime now) {
    final ordered = [
      PrayerName.fajr,
      PrayerName.sunrise,
      PrayerName.dhuhr,
      PrayerName.asr,
      PrayerName.maghrib,
      PrayerName.isha,
    ];

    final next = nextPrayer(daily, now);
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
    required CalculationMethodId methodId,
    required MadhabId madhabId,
    required DateTime month,
  }) {
    return '${latitude.toStringAsFixed(4)}_'
        '${longitude.toStringAsFixed(4)}_'
        '${methodId.storageKey}_'
        '${madhabId.storageKey}_'
        '${month.year}_${month.month}';
  }
}
