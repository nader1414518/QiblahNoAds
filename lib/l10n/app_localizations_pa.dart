// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Panjabi Punjabi (`pa`).
class AppLocalizationsPa extends AppLocalizations {
  AppLocalizationsPa([String locale = 'pa']) : super(locale);

  @override
  String get appTitle => 'ਅਲ-ਕਿਬਲਾ ਅਤੇ ਨਮਾਜ਼ ਸਾਥੀ';

  @override
  String get navQiblah => 'ਕਿਬਲਾ';

  @override
  String get navPrayerTimes => 'ਨਮਾਜ਼ ਦੇ ਸਮੇ';

  @override
  String get navAzkar => 'ਅਜ਼ਕਾਰ';

  @override
  String get close => 'ਬੰਦ ਕਰੋ';

  @override
  String get cancel => 'ਰੱਦ ਕਰੋ';

  @override
  String get reset => 'ਰੀਸੈੱਟ';

  @override
  String get retry => 'ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼';

  @override
  String get done => 'ਪੂਰਾ';

  @override
  String get showMore => 'ਹੋਰ ਦਿਖਾਓ';

  @override
  String get showLess => 'ਘੱਟ ਦਿਖਾਓ';

  @override
  String get qiblahTitle => 'ਕਿਬਲਾ';

  @override
  String get useCurrentLocation => 'ਮੌਜੂਦਾ ਟਿਕਾਣਾ ਵਰਤੋ';

  @override
  String get changeCity => 'ਸ਼ਹਿਰ ਬਦਲੋ';

  @override
  String get currentLocationSaved => 'ਮੌਜੂਦਾ ਟਿਕਾਣਾ ਸੇਵ ਹੋ ਗਿਆ';

  @override
  String get unableToGetGps =>
      'GPS ਪ੍ਰਾਪਤ ਨਹੀਂ ਹੋ ਸਕਿਆ। ਕਿਰਪਾ ਕਰਕੇ ਸ਼ਹਿਰ ਚੁਣੋ।';

  @override
  String get locationStatusUnavailable => 'ਟਿਕਾਣੇ ਦੀ ਸਥਿਤੀ ਪੜ੍ਹਣ ਵਿੱਚ ਅਸਮਰੱਥ';

  @override
  String get locationEnableServices => 'ਕਿਰਪਾ ਕਰਕੇ ਟਿਕਾਣਾ ਸੇਵਾਵਾਂ ਚਾਲੂ ਕਰੋ';

  @override
  String get locationEnableOrSelectCity =>
      'ਕਿਰਪਾ ਕਰਕੇ ਟਿਕਾਣਾ ਸੇਵਾਵਾਂ ਚਾਲੂ ਕਰੋ ਜਾਂ ਸ਼ਹਿਰ ਚੁਣੋ';

  @override
  String get locationUnavailableSelectCity =>
      'ਟਿਕਾਣਾ ਉਪਲਬਧ ਨਹੀਂ। ਸ਼ਹਿਰ ਚੁਣੋ ਜਾਂ ਇਜਾਜ਼ਤ ਦਿਓ।';

  @override
  String get locationPermissionDenied =>
      'ਟਿਕਾਣਾ ਇਜਾਜ਼ਤ ਰੱਦ। ਸ਼ਹਿਰ ਚੁਣੋ ਜਾਂ ਇਜਾਜ਼ਤ ਦਿਓ।';

  @override
  String get locationPermissionDeniedForever =>
      'ਟਿਕਾਣਾ ਇਜਾਜ਼ਤ ਸਥਾਈ ਰੱਦ। ਸੈਟਿੰਗਾਂ ਵਿੱਚ ਸ਼ਹਿਰ ਚੁਣੋ।';

  @override
  String get locationUnavailable => 'ਟਿਕਾਣਾ ਉਪਲਬਧ ਨਹੀਂ';

  @override
  String get sensorUnavailable =>
      'ਇਸ ਡਿਵਾਈਸ ਵਿੱਚ ਕੰਪਾਸ ਸੈਂਸਰ ਨਹੀਂ ਹੈ। ਕਿਬਲਾ ਦਿਸ਼ਾ ਨਹੀਂ ਦਿਖਾਈ ਜਾ ਸਕਦੀ।';

  @override
  String get compassUnavailable =>
      'ਕੰਪਾਸ ਡਾਟਾ ਉਪਲਬਧ ਨਹੀਂ। ਅਸਲ ਡਿਵਾਈਸ ਅਜ਼ਮਾਓ, ਐਮੂਲੇਟਰ ਟਿਕਾਣਾ ਸੈੱਟ ਕਰੋ, ਜਾਂ ਹੱਥੋਂ ਸ਼ਹਿਰ ਚੁਣੋ।';

  @override
  String get calibrationHint =>
      'ਕੰਪਾਸ ਦੀ ਸ਼ੁੱਧਤਾ ਵਧਾਉਣ ਲਈ ਫ਼ੋਨ ਨੂੰ 8 ਦੇ ਆਕਾਰ ਵਿੱਚ ਘੁਮਾਓ।';

  @override
  String get facingQiblah => 'ਕਿਬਲਾ ਵੱਲ';

  @override
  String rotateLeft(int degrees) {
    return 'ਖੱਬੇ $degrees° ਘੁਮਾਓ';
  }

  @override
  String rotateRight(int degrees) {
    return 'ਸੱਜੇ $degrees° ਘੁਮਾਓ';
  }

  @override
  String get prayerTimesTitle => 'ਨਮਾਜ਼ ਦੇ ਸਮੇ';

  @override
  String get settings => 'ਸੈਟਿੰਗਾਂ';

  @override
  String get todaysSchedule => 'ਅੱਜ ਦਾ ਸਮਾਂ-ਸਾਰਣੀ';

  @override
  String get nextPrayer => 'ਅਗਲੀ ਨਮਾਜ਼';

  @override
  String get locationNotSet => 'ਟਿਕਾਣਾ ਸੈੱਟ ਨਹੀਂ';

  @override
  String get failedToLoadPrayerTimes => 'ਨਮਾਜ਼ ਦੇ ਸਮੇ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get unableToCalculatePrayerTimes => 'ਨਮਾਜ਼ ਦੇ ਸਮੇ ਦੀ ਗਣਨਾ ਨਹੀਂ ਹੋ ਸਕੀ';

  @override
  String get selectCity => 'ਸ਼ਹਿਰ ਚੁਣੋ';

  @override
  String get searchCityHint => 'ਸ਼ਹਿਰ ਜਾਂ ਦੇਸ਼ ਖੋਜੋ';

  @override
  String get calculationMethod => 'ਗਣਨਾ ਵਿਧੀ';

  @override
  String get calculationMethodSubtitle =>
      'ਆਪਣੀ ਸਥਾਨਕ ਮਸਜਿਦ ਦੇ ਅਧਿਕਾਰ ਨਾਲ ਮੇਲ ਖਾਓ';

  @override
  String get madhab => 'ਮਜ਼ਹਬ (ਅਸਰ ਦਾ ਸਮਾਂ)';

  @override
  String get fineTune => 'ਸੂਖਮ ਸਮਾਯੋਜਨ (ਮਿੰਟ)';

  @override
  String get fineTuneSubtitle => 'ਸਥਾਨਕ ਮਸਜਿਦ ਦੇ ਸਮਾਂ-ਸਾਰਣੀ ਨਾਲ ਮੇਲ ਕਰੋ';

  @override
  String get use24Hour => '24-ਘੰਟੇ ਦਾ ਸਮਾਂ ਫਾਰਮੈਟ';

  @override
  String get notifications => 'ਸੂਚਨਾਵਾਂ';

  @override
  String get refreshGps => 'GPS ਟਿਕਾਣਾ ਤਾਜ਼ਾ ਕਰੋ';

  @override
  String get language => 'ਭਾਸ਼ਾ';

  @override
  String get languageSubtitle => 'ਐਪ ਦੀ ਭਾਸ਼ਾ ਚੁਣੋ';

  @override
  String get methodMuslimWorldLeague => 'ਮੁਸਲਿਮ ਵਰਲਡ ਲੀਗ';

  @override
  String get methodIsna => 'ISNA';

  @override
  String get methodUmmAlQura => 'ਉਮ ਅਲ-ਕੁਰਾ';

  @override
  String get methodEgyptian => 'ਮਿਸਰ ਜਨਰਲ ਅਥਾਰਿਟੀ';

  @override
  String get methodKarachi => 'ਕਰਾਚੀ ਯੂਨੀਵਰਸਿਟੀ';

  @override
  String get madhabShafi => 'ਸ਼ਾਫ਼ੀ';

  @override
  String get madhabHanafi => 'ਹਨਫ਼ੀ';

  @override
  String get prayerFajr => 'ਫਜਰ';

  @override
  String get prayerSunrise => 'ਸੂਰਜ ਚੜ੍ਹਨਾ';

  @override
  String get prayerDhuhr => 'ਜ਼ੁਹਰ';

  @override
  String get prayerAsr => 'ਅਸਰ';

  @override
  String get prayerMaghrib => 'ਮਗ਼ਰਿਬ';

  @override
  String get prayerIsha => 'ਇਸ਼ਾ';

  @override
  String get azkarTitle => 'ਅਜ਼ਕਾਰ';

  @override
  String get tasbih => 'ਤਸਬੀਹ';

  @override
  String get categoryMorning => 'ਸਵੇਰ';

  @override
  String get categoryEvening => 'ਸ਼ਾਮ';

  @override
  String get categoryPostPrayer => 'ਨਮਾਜ਼ ਤੋਂ ਬਾਅਦ';

  @override
  String get morningDescription =>
      'ਫਜਰ ਤੋਂ ਬਾਅਦ ਸਵੇਰ ਦੇ ਅਜ਼ਕਾਰ — ਹਿਸਨ ਅਲ-ਮੁਸਲਿਮ';

  @override
  String get eveningDescription =>
      'ਅਸਰ ਤੋਂ ਬਾਅਦ ਸ਼ਾਮ ਦੇ ਅਜ਼ਕਾਰ — ਹਿਸਨ ਅਲ-ਮੁਸਲਿਮ';

  @override
  String get postPrayerDescription => 'ਹਰ ਫਰਜ਼ ਨਮਾਜ਼ ਤੋਂ ਬਾਅਦ ਜ਼ਿਕਰ';

  @override
  String get tapToCount => 'ਦੁਹਰਾਅ ਗਿਣਨ ਲਈ ਕਾਰਡ \'ਤੇ ਟੈਪ ਕਰੋ';

  @override
  String get referenceQuran => 'ਕੁਰਆਨ';

  @override
  String get referenceHadith => 'ਹਦੀਸ';

  @override
  String get referenceAthar => 'ਅਥਰ';

  @override
  String get narrator => 'ਰਾਵੀ';

  @override
  String get grade => 'ਦਰਜਾ';

  @override
  String hisnNumber(int number) {
    return 'ਹਿਸਨ #$number';
  }

  @override
  String get tasbihTitle => 'ਤਸਬੀਹ ਕਾਊਂਟਰ';

  @override
  String get tapToCountTasbih => 'ਗਿਣਨ ਲਈ ਕਿਤੇ ਵੀ ਟੈਪ ਕਰੋ';

  @override
  String get tasbihMilestones => '33 ਅਤੇ 100 \'ਤੇ ਮੀਲ ਪੱਥਰ';

  @override
  String get resetCounterTitle => 'ਕਾਊਂਟਰ ਰੀਸੈੱਟ ਕਰਨਾ ਹੈ?';

  @override
  String get resetCounterMessage =>
      'ਇਹ ਤੁਹਾਡੀ ਮੌਜੂਦਾ ਤਸਬੀਹ ਸੈਸ਼ਨ ਦੀ ਗਿਣਤੀ ਮਿਟਾ ਦੇਵੇਗਾ।';

  @override
  String get notificationPrayerTitle => 'ਨਮਾਜ਼ ਦਾ ਸਮਾਂ';

  @override
  String notificationPrayerBody(String prayer) {
    return '$prayer ਦਾ ਸਮਾਂ ਹੋ ਗਿਆ';
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
