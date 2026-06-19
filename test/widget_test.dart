import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:qiblah_no_ads/core/l10n/l10n_extensions.dart';
import 'package:qiblah_no_ads/core/models/enums.dart';
import 'package:qiblah_no_ads/core/models/models.dart';
import 'package:qiblah_no_ads/l10n/app_localizations.dart';
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

  test('resolveSupportedLocale maps to supported languages', () {
    expect(resolveSupportedLocale(const Locale('ar', 'SA')), const Locale('ar'));
    expect(resolveSupportedLocale(const Locale('ur', 'PK')), const Locale('ur'));
    expect(resolveSupportedLocale(const Locale('es', 'ES')), const Locale('es'));
    expect(resolveSupportedLocale(const Locale('fa', 'IR')), const Locale('fa'));
    expect(resolveSupportedLocale(const Locale('pt', 'BR')), const Locale('pt'));
    expect(resolveSupportedLocale(const Locale('zh', 'CN')), const Locale('zh'));
    expect(resolveSupportedLocale(const Locale('xx')), const Locale('en'));
    expect(resolveSupportedLocale(null), const Locale('en'));
  });

  test('getEffectiveLocale uses device language when no preference is saved', () async {
    final preferences = await PreferencesService.create();

    expect(preferences.getLocale(), isNull);
    expect(
      preferences.getEffectiveLocale(),
      resolveSupportedLocale(getDeviceLocale()),
    );
  });

  test('lookupAppLocalizations returns localized app title', () {
    expect(
      lookupAppLocalizations(const Locale('ur')).appTitle,
      'القبلہ اور نماز کا ساتھی',
    );
    expect(
      lookupAppLocalizations(const Locale('en')).appTitle,
      'Al-Qiblah & Prayer Companion',
    );
  });

  test('AzkarItem.fromJson parses reference metadata', () {
    final item = AzkarItem.fromJson({
      'arabic': 'سُبْحَانَ اللَّهِ',
      'english': 'Glory be to Allah.',
      'repeat': 33,
      'reference': {
        'hisn': 87,
        'type': 'hadith',
        'citation': 'Muslim 597',
        'collection': 'Sahih Muslim',
        'narrator': 'Abu Hurayrah',
        'grade': 'Sahih',
      },
    });

    expect(item.reference?.hisn, 87);
    expect(item.reference?.type, 'hadith');
    expect(item.reference?.citation, 'Muslim 597');
    expect(item.reference?.narrator, 'Abu Hurayrah');
    expect(item.reference?.grade, 'Sahih');
  });

  testWidgets('Urdu locale renders RTL navigation labels', (WidgetTester tester) async {
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
          locale: Locale('ur'),
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [Locale('ur')],
          home: MainShell(initialIndex: 2),
        ),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    final direction = Directionality.of(tester.element(find.byType(NavigationBar)));
    expect(direction, ui.TextDirection.rtl);
    expect(find.text('قبلہ'), findsOneWidget);
    expect(find.text('نماز کے اوقات'), findsOneWidget);
    expect(find.text('اذکار'), findsWidgets);
  });

  testWidgets('Arabic locale renders RTL navigation labels', (WidgetTester tester) async {
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
          locale: Locale('ar'),
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [Locale('ar')],
          home: MainShell(initialIndex: 2),
        ),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    final direction = Directionality.of(tester.element(find.byType(NavigationBar)));
    expect(direction, ui.TextDirection.rtl);
    expect(find.text('القبلة'), findsOneWidget);
    expect(find.text('أوقات الصلاة'), findsOneWidget);
    expect(find.text('الأذكار'), findsWidgets);
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
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [Locale('en')],
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
