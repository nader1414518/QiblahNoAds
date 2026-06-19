import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

import '../core/constants/app_constants.dart';
import '../core/l10n/l10n_extensions.dart';
import '../core/models/enums.dart';
import '../core/models/models.dart';
import '../l10n/app_localizations.dart';
import '../services/timezone_service.dart';
import 'preferences_service.dart';

class NotificationService {
  NotificationService(this._preferences);

  final PreferencesService _preferences;
  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  bool _initialized = false;

  Future<void> initialize() async {
    if (_initialized) {
      return;
    }

    tz_data.initializeTimeZones();
    tz.setLocalLocation(tz.local);

    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    await _plugin.initialize(
      const InitializationSettings(
        android: androidSettings,
        iOS: iosSettings,
      ),
    );

    const androidChannel = AndroidNotificationChannel(
      'prayer_reminders',
      'Prayer Reminders',
      description: 'Notifications for daily prayer times',
      importance: Importance.max,
    );

    await _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(androidChannel);

    _initialized = true;
  }

  Future<bool> requestPermissions() async {
    final ios = _plugin.resolvePlatformSpecificImplementation<
      IOSFlutterLocalNotificationsPlugin
    >();
    if (ios != null) {
      final granted = await ios.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
      return granted ?? false;
    }

    final android = _plugin.resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin
    >();
    if (android != null) {
      final granted = await android.requestNotificationsPermission();
      return granted ?? false;
    }

    return true;
  }

  Future<void> cancelAllPrayerNotifications() async {
    for (final id in _notificationIds) {
      await _plugin.cancel(id);
    }
  }

  Future<void> reschedulePrayerNotifications({
    required DailyPrayerTimes today,
    required DailyPrayerTimes? tomorrow,
    required String timeZoneId,
  }) async {
    await cancelAllPrayerNotifications();

    final timezoneService = TimezoneService();
    final now = timezoneService.nowInLocation(timeZoneId);
    final notifiable = [
      PrayerName.fajr,
      PrayerName.dhuhr,
      PrayerName.asr,
      PrayerName.maghrib,
      PrayerName.isha,
    ];

    for (final prayer in notifiable) {
      if (!_preferences.isNotificationEnabled(prayer)) {
        continue;
      }

      var scheduledTime = today.times[prayer]!;
      if (!scheduledTime.isAfter(now) && tomorrow != null) {
        scheduledTime = tomorrow.times[prayer]!;
      }

      if (!scheduledTime.isAfter(now)) {
        continue;
      }

      final locale = _preferences.getLocale() ?? const Locale('en');
      final l10n = lookupAppLocalizations(locale);

      await _plugin.zonedSchedule(
        _notificationIdFor(prayer),
        l10n.notificationPrayerTitle,
        l10n.notificationPrayerBody(l10n.prayerName(prayer)),
        timezoneService.toLocationDateTime(timeZoneId, scheduledTime),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'prayer_reminders',
            'Prayer Reminders',
            channelDescription: 'Notifications for daily prayer times',
            importance: Importance.max,
            priority: Priority.high,
          ),
          iOS: DarwinNotificationDetails(),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      );
    }
  }

  int _notificationIdFor(PrayerName prayer) {
    switch (prayer) {
      case PrayerName.fajr:
        return AppConstants.notificationIdFajr;
      case PrayerName.dhuhr:
        return AppConstants.notificationIdDhuhr;
      case PrayerName.asr:
        return AppConstants.notificationIdAsr;
      case PrayerName.maghrib:
        return AppConstants.notificationIdMaghrib;
      case PrayerName.isha:
        return AppConstants.notificationIdIsha;
      case PrayerName.sunrise:
        return 0;
    }
  }

  List<int> get _notificationIds => [
    AppConstants.notificationIdFajr,
    AppConstants.notificationIdDhuhr,
    AppConstants.notificationIdAsr,
    AppConstants.notificationIdMaghrib,
    AppConstants.notificationIdIsha,
  ];
}
