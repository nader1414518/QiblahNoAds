// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Al-Qiblah & Prayer Companion';

  @override
  String get navQiblah => 'Qiblah';

  @override
  String get navPrayerTimes => 'Prayer Times';

  @override
  String get navAzkar => 'Azkar';

  @override
  String get close => 'Close';

  @override
  String get cancel => 'Cancel';

  @override
  String get reset => 'Reset';

  @override
  String get retry => 'Retry';

  @override
  String get done => 'Done';

  @override
  String get showMore => 'Show more';

  @override
  String get showLess => 'Show less';

  @override
  String get qiblahTitle => 'Qiblah';

  @override
  String get useCurrentLocation => 'Use current location';

  @override
  String get changeCity => 'Change city';

  @override
  String get currentLocationSaved => 'Current location saved';

  @override
  String get unableToGetGps =>
      'Unable to get GPS. Try selecting a city instead.';

  @override
  String get locationStatusUnavailable => 'Unable to read location status';

  @override
  String get locationEnableServices => 'Please enable location services';

  @override
  String get locationEnableOrSelectCity =>
      'Please enable location services or select a city';

  @override
  String get locationUnavailableSelectCity =>
      'Location unavailable. Select a city or grant permission.';

  @override
  String get locationPermissionDenied =>
      'Location permission denied. Select a city or grant permission.';

  @override
  String get locationPermissionDeniedForever =>
      'Location permission permanently denied. Select a city in settings.';

  @override
  String get locationUnavailable => 'Location unavailable';

  @override
  String get sensorUnavailable =>
      'This device does not have a compass sensor. Qiblah direction cannot be shown.';

  @override
  String get compassUnavailable =>
      'Compass data is unavailable. Try a physical device, set an emulator location, or select a city manually.';

  @override
  String get calibrationHint =>
      'Move your phone in a figure-8 to improve compass accuracy.';

  @override
  String get qiblahAccuracyDisclaimer =>
      'Qiblah direction is approximate. Accuracy depends on your device compass, location, and magnetic interference. Calibrate your phone and verify with a physical compass when precision matters.';

  @override
  String get facingQiblah => 'Facing Qiblah';

  @override
  String rotateLeft(int degrees) {
    return 'Rotate left $degrees°';
  }

  @override
  String rotateRight(int degrees) {
    return 'Rotate right $degrees°';
  }

  @override
  String get prayerTimesTitle => 'Prayer Times';

  @override
  String get settings => 'Settings';

  @override
  String get todaysSchedule => 'Today\'s Schedule';

  @override
  String get nextPrayer => 'Next Prayer';

  @override
  String get locationNotSet => 'Location not set';

  @override
  String get failedToLoadPrayerTimes => 'Failed to load prayer times';

  @override
  String get unableToCalculatePrayerTimes => 'Unable to calculate prayer times';

  @override
  String get selectCity => 'Select City';

  @override
  String get searchCityHint => 'Search city or country';

  @override
  String get calculationMethod => 'Calculation Method';

  @override
  String get calculationMethodSubtitle => 'Match your local mosque authority';

  @override
  String get madhab => 'Madhab (Asr time)';

  @override
  String get fineTune => 'Fine-tune (minutes)';

  @override
  String get fineTuneSubtitle => 'Adjust to match your local mosque timetable';

  @override
  String get use24Hour => '24-hour time format';

  @override
  String get notifications => 'Notifications';

  @override
  String get refreshGps => 'Refresh GPS location';

  @override
  String get language => 'Language';

  @override
  String get languageSubtitle => 'Choose app display language';

  @override
  String get methodMuslimWorldLeague => 'Muslim World League';

  @override
  String get methodIsna => 'ISNA';

  @override
  String get methodUmmAlQura => 'Umm al-Qura';

  @override
  String get methodEgyptian => 'Egyptian General Authority';

  @override
  String get methodKarachi => 'University of Karachi';

  @override
  String get madhabShafi => 'Shafi';

  @override
  String get madhabHanafi => 'Hanafi';

  @override
  String get prayerFajr => 'Fajr';

  @override
  String get prayerSunrise => 'Sunrise';

  @override
  String get prayerDhuhr => 'Dhuhr';

  @override
  String get prayerAsr => 'Asr';

  @override
  String get prayerMaghrib => 'Maghrib';

  @override
  String get prayerIsha => 'Isha';

  @override
  String get azkarTitle => 'Azkar';

  @override
  String get tasbih => 'Tasbih';

  @override
  String get categoryMorning => 'Morning';

  @override
  String get categoryEvening => 'Evening';

  @override
  String get categoryPostPrayer => 'Post-Prayer';

  @override
  String get morningDescription =>
      'Morning remembrance after Fajr — Hisn al-Muslim';

  @override
  String get eveningDescription =>
      'Evening remembrance after Asr — Hisn al-Muslim';

  @override
  String get postPrayerDescription => 'Dhikr after every obligatory prayer';

  @override
  String get tapToCount => 'Tap card to count repetitions';

  @override
  String get referenceQuran => 'Quran';

  @override
  String get referenceHadith => 'Hadith';

  @override
  String get referenceAthar => 'Athar';

  @override
  String get narrator => 'Narrator';

  @override
  String get grade => 'Grade';

  @override
  String hisnNumber(int number) {
    return 'Hisn #$number';
  }

  @override
  String get tasbihTitle => 'Tasbih Counter';

  @override
  String get tapToCountTasbih => 'Tap anywhere to count';

  @override
  String get tasbihMilestones => 'Milestones at 33 and 100';

  @override
  String get resetCounterTitle => 'Reset counter?';

  @override
  String get resetCounterMessage =>
      'This will clear your current Tasbih session count.';

  @override
  String get notificationPrayerTitle => 'Prayer Time';

  @override
  String notificationPrayerBody(String prayer) {
    return 'It is time for $prayer';
  }

  @override
  String get langEnglish => 'English';

  @override
  String get langArabic => 'العربية';

  @override
  String get langFrench => 'Français';

  @override
  String get langUrdu => 'اردو';

  @override
  String get langTurkish => 'Türkçe';

  @override
  String get langIndonesian => 'Bahasa Indonesia';

  @override
  String get langBengali => 'বাংলা';

  @override
  String get langGerman => 'Deutsch';

  @override
  String get langSpanish => 'Español';

  @override
  String get langMalay => 'Bahasa Melayu';

  @override
  String get langPersian => 'فارسی';

  @override
  String get langHindi => 'हिन्दी';

  @override
  String get langRussian => 'Русский';

  @override
  String get langItalian => 'Italiano';

  @override
  String get langDutch => 'Nederlands';

  @override
  String get langSwahili => 'Kiswahili';

  @override
  String get langPortuguese => 'Português';

  @override
  String get langMalayalam => 'മലയാളം';

  @override
  String get langTamil => 'தமிழ்';

  @override
  String get langPunjabi => 'ਪੰਜਾਬੀ';

  @override
  String get langSomali => 'Soomaali';

  @override
  String get langUzbek => 'O\'zbek';

  @override
  String get langKazakh => 'Қазақша';

  @override
  String get langChinese => '中文';
}
