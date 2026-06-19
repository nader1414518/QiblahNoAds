import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/constants/app_constants.dart';
import '../core/l10n/l10n_extensions.dart';
import '../core/models/enums.dart';
import '../core/models/models.dart';

class PreferencesService {
  PreferencesService(this._prefs);

  final SharedPreferences _prefs;

  static Future<PreferencesService> create() async {
    final prefs = await SharedPreferences.getInstance();
    return PreferencesService(prefs);
  }

  CalculationMethodId getCalculationMethod() {
    final value = _prefs.getString(AppConstants.prefCalculationMethod);
    return CalculationMethodId.values.firstWhere(
      (method) => method.storageKey == value,
      orElse: () => CalculationMethodId.muslimWorldLeague,
    );
  }

  Future<void> setCalculationMethod(CalculationMethodId method) async {
    await _prefs.setString(AppConstants.prefCalculationMethod, method.storageKey);
  }

  MadhabId getMadhab() {
    final value = _prefs.getString(AppConstants.prefMadhab);
    return MadhabId.values.firstWhere(
      (madhab) => madhab.storageKey == value,
      orElse: () => MadhabId.shafi,
    );
  }

  Future<void> setMadhab(MadhabId madhab) async {
    await _prefs.setString(AppConstants.prefMadhab, madhab.storageKey);
  }

  bool getUse24Hour() => _prefs.getBool(AppConstants.prefUse24Hour) ?? true;

  Future<void> setUse24Hour(bool value) async {
    await _prefs.setBool(AppConstants.prefUse24Hour, value);
  }

  PrayerTimeAdjustments getPrayerAdjustments() {
    return PrayerTimeAdjustments(
      fajr: getAdjustment(PrayerName.fajr),
      dhuhr: getAdjustment(PrayerName.dhuhr),
      asr: getAdjustment(PrayerName.asr),
      maghrib: getAdjustment(PrayerName.maghrib),
      isha: getAdjustment(PrayerName.isha),
    );
  }

  int getAdjustment(PrayerName prayer) {
    return _prefs.getInt(
          '${AppConstants.prefAdjustmentPrefix}${prayer.storageKey}',
        ) ??
        0;
  }

  Future<void> setAdjustment(PrayerName prayer, int minutes) async {
    await _prefs.setInt(
      '${AppConstants.prefAdjustmentPrefix}${prayer.storageKey}',
      minutes,
    );
  }

  double? getLatitude() => _prefs.getDouble(AppConstants.prefLatitude);

  double? getLongitude() => _prefs.getDouble(AppConstants.prefLongitude);

  String? getCityName() => _prefs.getString(AppConstants.prefCityName);

  String? getTimeZoneId() => _prefs.getString(AppConstants.prefTimeZoneId);

  LocationSource? getLocationSource() {
    final value = _prefs.getString(AppConstants.prefLocationSource);
    if (value == null) {
      return null;
    }
    return LocationSource.values.firstWhere(
      (source) => source.name == value,
      orElse: () => LocationSource.manual,
    );
  }

  Future<void> saveLocation({
    required double latitude,
    required double longitude,
    required String cityName,
    required LocationSource source,
    required String timeZoneId,
  }) async {
    await _prefs.setDouble(AppConstants.prefLatitude, latitude);
    await _prefs.setDouble(AppConstants.prefLongitude, longitude);
    await _prefs.setString(AppConstants.prefCityName, cityName);
    await _prefs.setString(AppConstants.prefLocationSource, source.name);
    await _prefs.setString(AppConstants.prefTimeZoneId, timeZoneId);
  }

  String? getPrayerCacheKey() => _prefs.getString(AppConstants.prefPrayerCacheKey);

  String? getPrayerCache() => _prefs.getString(AppConstants.prefPrayerCache);

  Future<void> savePrayerCache({
    required String cacheKey,
    required String json,
  }) async {
    await _prefs.setString(AppConstants.prefPrayerCacheKey, cacheKey);
    await _prefs.setString(AppConstants.prefPrayerCache, json);
  }

  bool isNotificationEnabled(PrayerName prayer) {
    return _prefs.getBool(
          '${AppConstants.prefNotificationPrefix}${prayer.storageKey}',
        ) ??
        true;
  }

  Future<void> setNotificationEnabled(PrayerName prayer, bool enabled) async {
    await _prefs.setBool(
      '${AppConstants.prefNotificationPrefix}${prayer.storageKey}',
      enabled,
    );
  }

  int getTasbihCount() => _prefs.getInt(AppConstants.prefTasbihCount) ?? 0;

  Future<void> setTasbihCount(int count) async {
    await _prefs.setInt(AppConstants.prefTasbihCount, count);
  }

  Future<void> resetTasbihCount() async {
    await _prefs.remove(AppConstants.prefTasbihCount);
  }

  Locale? getLocale() {
    final value = _prefs.getString(AppConstants.prefLocale);
    if (value == null || value.isEmpty) {
      return null;
    }
    final parts = value.split('_');
    if (parts.length == 2) {
      return Locale(parts[0], parts[1]);
    }
    return Locale(parts[0]);
  }

  /// Saved locale, or the closest supported match for the device language.
  Locale getEffectiveLocale() {
    return resolveSupportedLocale(getLocale() ?? getDeviceLocale());
  }

  Future<void> setLocale(Locale locale) async {
    final tag = locale.countryCode == null || locale.countryCode!.isEmpty
        ? locale.languageCode
        : '${locale.languageCode}_${locale.countryCode}';
    await _prefs.setString(AppConstants.prefLocale, tag);
  }
}
