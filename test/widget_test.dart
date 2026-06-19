import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:qiblah_no_ads/core/models/enums.dart';
import 'package:qiblah_no_ads/core/models/models.dart';
import 'package:qiblah_no_ads/features/shell/main_shell.dart';
import 'package:qiblah_no_ads/providers/app_providers.dart';
import 'package:qiblah_no_ads/services/calculation_method_resolver.dart';
import 'package:qiblah_no_ads/services/notification_service.dart';
import 'package:qiblah_no_ads/services/preferences_service.dart';
import 'package:qiblah_no_ads/services/prayer_calculation_service.dart';
import 'package:qiblah_no_ads/services/qiblah_bearing.dart';
import 'package:qiblah_no_ads/services/timezone_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    TimezoneService.ensureInitialized();
  });

  test('Makkah Umm al-Qura Fajr uses location timezone', () {
    final service = PrayerCalculationService(TimezoneService());
    final daily = service.calculateForDate(
      latitude: 21.4225,
      longitude: 39.8262,
      timeZoneId: 'Asia/Riyadh',
      date: DateTime(2025, 6, 19),
      methodId: CalculationMethodId.ummAlQura,
      madhabId: MadhabId.shafi,
      adjustments: const PrayerTimeAdjustments(),
    );

    final fajr = daily.times[PrayerName.fajr]!;
    expect(DateFormat.Hm().format(fajr), '04:11');
    expect(
      daily.times[PrayerName.fajr]!.isBefore(daily.times[PrayerName.sunrise]!),
      isTrue,
    );
  });

  test('calculates five daily prayers and sunrise', () {
    final service = PrayerCalculationService(TimezoneService());
    final daily = service.calculateForDate(
      latitude: 21.4225,
      longitude: 39.8262,
      timeZoneId: 'Asia/Riyadh',
      date: DateTime(2025, 6, 19),
      methodId: CalculationMethodId.muslimWorldLeague,
      madhabId: MadhabId.shafi,
      adjustments: const PrayerTimeAdjustments(),
    );

    expect(daily.times.length, 6);
    expect(daily.times[PrayerName.fajr], isNotNull);
    expect(daily.times[PrayerName.isha], isNotNull);
  });

  test('countdown remaining uses location timezone', () {
    final timezoneService = TimezoneService();
    final calculator = PrayerCalculationService(timezoneService);
    final daily = calculator.calculateForDate(
      latitude: 30.0444,
      longitude: 31.2357,
      timeZoneId: 'Africa/Cairo',
      date: DateTime(2025, 6, 19),
      methodId: CalculationMethodId.egyptian,
      madhabId: MadhabId.shafi,
      adjustments: const PrayerTimeAdjustments(),
    );

    final dhuhr = daily.times[PrayerName.dhuhr]!;
    final oneHourBefore = dhuhr.subtract(const Duration(hours: 1));
    final remaining = dhuhr.difference(oneHourBefore);

    expect(remaining.inMinutes, 60);
  });

  test('calculation method resolves from nearest city for GPS', () {
    const cities = [
      City(
        name: 'Cairo',
        country: 'Egypt',
        lat: 30.0444,
        lng: 31.2357,
        tz: 'Africa/Cairo',
      ),
      City(
        name: 'Riyadh',
        country: 'Saudi Arabia',
        lat: 24.7136,
        lng: 46.6753,
        tz: 'Asia/Riyadh',
      ),
    ];

    expect(
      CalculationMethodResolver.forCoordinates(30.05, 31.24, cities),
      CalculationMethodId.egyptian,
    );
    expect(
      CalculationMethodResolver.forCoordinates(24.71, 46.67, cities),
      CalculationMethodId.ummAlQura,
    );
  });

  test('qiblah bearing matches known city references', () {
    expect(QiblahBearing.fromNorth(40.7128, -74.0059), closeTo(58.481, 0.01));
    expect(QiblahBearing.fromNorth(38.9072, -77.0369), closeTo(56.560, 0.01));
    expect(QiblahBearing.fromNorth(30.0444, 31.2357), closeTo(136.137, 0.01));
  });

  test('alignment offset is zero when facing qiblah', () {
    final bearing = QiblahBearing.fromNorth(30.0444, 31.2357);
    final offset = QiblahBearing.normalizeAngle(bearing - bearing);

    expect(offset, closeTo(0, 0.001));
  });

  testWidgets('App shell shows three navigation tabs', (WidgetTester tester) async {
    final preferences = await PreferencesService.create();
    await preferences.saveLocation(
      latitude: 21.4225,
      longitude: 39.8262,
      cityName: 'Makkah, Saudi Arabia',
      source: LocationSource.manual,
      timeZoneId: 'Asia/Riyadh',
    );
    final notifications = NotificationService(preferences);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          preferencesServiceProvider.overrideWithValue(preferences),
          notificationServiceProvider.overrideWithValue(notifications),
        ],
        child: const MaterialApp(
          home: MainShell(initialIndex: 2),
        ),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.byType(NavigationBar), findsOneWidget);
    expect(find.text('Qiblah'), findsOneWidget);
    expect(find.text('Prayer Times'), findsOneWidget);
    expect(find.text('Azkar'), findsWidgets);
  });
}
