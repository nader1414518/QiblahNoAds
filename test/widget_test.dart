import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:qiblah_no_ads/core/models/enums.dart';
import 'package:qiblah_no_ads/core/models/models.dart';
import 'package:qiblah_no_ads/features/shell/main_shell.dart';
import 'package:qiblah_no_ads/providers/app_providers.dart';
import 'package:qiblah_no_ads/services/notification_service.dart';
import 'package:qiblah_no_ads/services/preferences_service.dart';
import 'package:qiblah_no_ads/services/prayer_calculation_service.dart';
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
