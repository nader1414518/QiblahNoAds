// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swahili (`sw`).
class AppLocalizationsSw extends AppLocalizations {
  AppLocalizationsSw([String locale = 'sw']) : super(locale);

  @override
  String get appTitle => 'Al-Qiblah na Mwenzi wa Swala';

  @override
  String get navQiblah => 'Qiblah';

  @override
  String get navPrayerTimes => 'Nyakati za Swala';

  @override
  String get navAzkar => 'Azkar';

  @override
  String get close => 'Funga';

  @override
  String get cancel => 'Ghairi';

  @override
  String get reset => 'Weka upya';

  @override
  String get retry => 'Jaribu tena';

  @override
  String get done => 'Imekamilika';

  @override
  String get showMore => 'Onyesha zaidi';

  @override
  String get showLess => 'Onyesha kidogo';

  @override
  String get qiblahTitle => 'Qiblah';

  @override
  String get useCurrentLocation => 'Tumia eneo la sasa';

  @override
  String get changeCity => 'Badilisha jiji';

  @override
  String get currentLocationSaved => 'Eneo la sasa limehifadhiwa';

  @override
  String get unableToGetGps =>
      'Imeshindwa kupata GPS. Jaribu kuchagua jiji badala yake.';

  @override
  String get locationStatusUnavailable => 'Imeshindwa kusoma hali ya eneo';

  @override
  String get locationEnableServices => 'Tafadhali wezesha huduma za eneo';

  @override
  String get locationEnableOrSelectCity =>
      'Tafadhali wezesha huduma za eneo au chagua jiji';

  @override
  String get locationUnavailableSelectCity =>
      'Eneo halipatikani. Chagua jiji au ruhusu ruhusa.';

  @override
  String get locationPermissionDenied =>
      'Ruhusa ya eneo imekataliwa. Chagua jiji au ruhusu ruhusa.';

  @override
  String get locationPermissionDeniedForever =>
      'Ruhusa ya eneo imekataliwa kabisa. Chagua jiji katika mipangilio.';

  @override
  String get locationUnavailable => 'Eneo halipatikani';

  @override
  String get sensorUnavailable =>
      'Kifaa hiki hakina kihisi cha dira. Mwelekeo wa Qiblah hauwezi kuonyeshwa.';

  @override
  String get compassUnavailable =>
      'Data ya dira haipatikani. Jaribu kifaa halisi, weka eneo la kielelezo, au chagua jiji kwa mkono.';

  @override
  String get calibrationHint =>
      'Songesha simu yako kwa umbo la 8 kuboresha usahihi wa dira.';

  @override
  String get qiblahAccuracyDisclaimer =>
      'Qiblah direction is approximate. Accuracy depends on your device compass, location, and magnetic interference. Calibrate your phone and verify with a physical compass when precision matters.';

  @override
  String get facingQiblah => 'Unaelekea Qiblah';

  @override
  String rotateLeft(int degrees) {
    return 'Zungusha kushoto $degrees°';
  }

  @override
  String rotateRight(int degrees) {
    return 'Zungusha kulia $degrees°';
  }

  @override
  String get prayerTimesTitle => 'Nyakati za Swala';

  @override
  String get settings => 'Mipangilio';

  @override
  String get todaysSchedule => 'Ratiba ya Leo';

  @override
  String get nextPrayer => 'Swala Inayofuata';

  @override
  String get locationNotSet => 'Eneo halijawekwa';

  @override
  String get failedToLoadPrayerTimes => 'Imeshindwa kupakia nyakati za swala';

  @override
  String get unableToCalculatePrayerTimes =>
      'Imeshindwa kuhesabu nyakati za swala';

  @override
  String get selectCity => 'Chagua Jiji';

  @override
  String get searchCityHint => 'Tafuta jiji au nchi';

  @override
  String get calculationMethod => 'Njia ya Kuhesabu';

  @override
  String get calculationMethodSubtitle =>
      'Linganisha na mamlaka ya msikiti wako wa karibu';

  @override
  String get madhab => 'Madhab (wakati wa Asr)';

  @override
  String get fineTune => 'Rekebisha (dakika)';

  @override
  String get fineTuneSubtitle =>
      'Rekebisha ili kulingana na ratiba ya msikiti wako wa karibu';

  @override
  String get use24Hour => 'Muundo wa saa 24';

  @override
  String get notifications => 'Arifa';

  @override
  String get refreshGps => 'Onyesha upya eneo la GPS';

  @override
  String get language => 'Lugha';

  @override
  String get languageSubtitle => 'Chagua lugha ya onyesho la programu';

  @override
  String get methodMuslimWorldLeague => 'Muungano wa Uislamu Duniani';

  @override
  String get methodIsna => 'ISNA';

  @override
  String get methodUmmAlQura => 'Umm al-Qura';

  @override
  String get methodEgyptian => 'Mamlaka Kuu ya Misri';

  @override
  String get methodKarachi => 'Chuo Kikuu cha Karachi';

  @override
  String get madhabShafi => 'Shafi\'i';

  @override
  String get madhabHanafi => 'Hanafi';

  @override
  String get prayerFajr => 'Fajr';

  @override
  String get prayerSunrise => 'Machweo ya jua';

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
  String get categoryMorning => 'Asubuhi';

  @override
  String get categoryEvening => 'Jioni';

  @override
  String get categoryPostPrayer => 'Baada ya Swala';

  @override
  String get morningDescription =>
      'Ukumbusho wa asubuhi baada ya Fajr — Hisn al-Muslim';

  @override
  String get eveningDescription =>
      'Ukumbusho wa jioni baada ya Asr — Hisn al-Muslim';

  @override
  String get postPrayerDescription => 'Dhikr baada ya kila swala la lazima';

  @override
  String get tapToCount => 'Gusa kadi kuhesabu marudio';

  @override
  String get referenceQuran => 'Qur\'ani';

  @override
  String get referenceHadith => 'Hadithi';

  @override
  String get referenceAthar => 'Athar';

  @override
  String get narrator => 'Msimulizi';

  @override
  String get grade => 'Daraja';

  @override
  String hisnNumber(int number) {
    return 'Hisn #$number';
  }

  @override
  String get tasbihTitle => 'Kihesabu cha Tasbih';

  @override
  String get tapToCountTasbih => 'Gusa popote kuhesabu';

  @override
  String get tasbihMilestones => 'Hatua muhimu katika 33 na 100';

  @override
  String get resetCounterTitle => 'Weka upya kihesabu?';

  @override
  String get resetCounterMessage =>
      'Hii itafuta hesabu ya kipindi chako cha sasa cha Tasbih.';

  @override
  String get notificationPrayerTitle => 'Wakati wa Swala';

  @override
  String notificationPrayerBody(String prayer) {
    return 'Ni wakati wa $prayer';
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
