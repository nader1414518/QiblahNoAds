import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../models/enums.dart';

extension AppLocalizationsX on AppLocalizations {
  String prayerName(PrayerName name) {
    switch (name) {
      case PrayerName.fajr:
        return prayerFajr;
      case PrayerName.sunrise:
        return prayerSunrise;
      case PrayerName.dhuhr:
        return prayerDhuhr;
      case PrayerName.asr:
        return prayerAsr;
      case PrayerName.maghrib:
        return prayerMaghrib;
      case PrayerName.isha:
        return prayerIsha;
    }
  }

  String calculationMethodName(CalculationMethodId method) {
    switch (method) {
      case CalculationMethodId.muslimWorldLeague:
        return methodMuslimWorldLeague;
      case CalculationMethodId.isna:
        return methodIsna;
      case CalculationMethodId.ummAlQura:
        return methodUmmAlQura;
      case CalculationMethodId.egyptian:
        return methodEgyptian;
      case CalculationMethodId.karachi:
        return methodKarachi;
    }
  }

  String madhabName(MadhabId madhab) {
    switch (madhab) {
      case MadhabId.shafi:
        return madhabShafi;
      case MadhabId.hanafi:
        return madhabHanafi;
    }
  }

  String azkarCategoryName(AzkarCategory category) {
    switch (category) {
      case AzkarCategory.morning:
        return categoryMorning;
      case AzkarCategory.evening:
        return categoryEvening;
      case AzkarCategory.postPrayer:
        return categoryPostPrayer;
    }
  }

  String azkarCategoryDescription(AzkarCategory category) {
    switch (category) {
      case AzkarCategory.morning:
        return morningDescription;
      case AzkarCategory.evening:
        return eveningDescription;
      case AzkarCategory.postPrayer:
        return postPrayerDescription;
    }
  }

  String languageLabel(Locale locale) {
    switch (locale.languageCode) {
      case 'ar':
        return langArabic;
      case 'bn':
        return langBengali;
      case 'de':
        return langGerman;
      case 'es':
        return langSpanish;
      case 'fa':
        return langPersian;
      case 'fr':
        return langFrench;
      case 'hi':
        return langHindi;
      case 'id':
        return langIndonesian;
      case 'it':
        return langItalian;
      case 'kk':
        return langKazakh;
      case 'ml':
        return langMalayalam;
      case 'ms':
        return langMalay;
      case 'nl':
        return langDutch;
      case 'pa':
        return langPunjabi;
      case 'pt':
        return langPortuguese;
      case 'ru':
        return langRussian;
      case 'so':
        return langSomali;
      case 'sw':
        return langSwahili;
      case 'ta':
        return langTamil;
      case 'tr':
        return langTurkish;
      case 'ur':
        return langUrdu;
      case 'uz':
        return langUzbek;
      case 'zh':
        return langChinese;
      default:
        return langEnglish;
    }
  }

  String? locationErrorMessage(String? code) {
    switch (code) {
      case 'location_unavailable_select_city':
        return locationUnavailableSelectCity;
      case 'unable_to_get_gps':
        return unableToGetGps;
      default:
        return null;
    }
  }

  String? prayerTimesErrorMessage(String? code) {
    switch (code) {
      case 'location_not_set':
        return locationNotSet;
      case 'unable_to_calculate':
        return unableToCalculatePrayerTimes;
      case 'failed_to_load':
        return failedToLoadPrayerTimes;
      default:
        return null;
    }
  }
}

/// Supported app locales in display order.
const supportedAppLocales = [
  Locale('en'),
  Locale('ar'),
  Locale('ur'),
  Locale('fa'),
  Locale('id'),
  Locale('ms'),
  Locale('bn'),
  Locale('hi'),
  Locale('ml'),
  Locale('ta'),
  Locale('pa'),
  Locale('tr'),
  Locale('uz'),
  Locale('kk'),
  Locale('so'),
  Locale('sw'),
  Locale('fr'),
  Locale('es'),
  Locale('pt'),
  Locale('de'),
  Locale('it'),
  Locale('nl'),
  Locale('ru'),
  Locale('zh'),
];

/// The device's current locale from the platform dispatcher.
Locale getDeviceLocale() {
  return WidgetsBinding.instance.platformDispatcher.locale;
}

/// Maps a locale to the closest supported app locale, defaulting to English.
Locale resolveSupportedLocale(Locale? locale) {
  if (locale == null) {
    return const Locale('en');
  }

  for (final supported in supportedAppLocales) {
    if (supported.languageCode == locale.languageCode) {
      return supported;
    }
  }

  return const Locale('en');
}
