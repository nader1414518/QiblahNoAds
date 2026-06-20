// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kazakh (`kk`).
class AppLocalizationsKk extends AppLocalizations {
  AppLocalizationsKk([String locale = 'kk']) : super(locale);

  @override
  String get appTitle => 'Al-Qiblah және Намаз Көмекшісі';

  @override
  String get navQiblah => 'Қибла';

  @override
  String get navPrayerTimes => 'Намаз Уақыттары';

  @override
  String get navAzkar => 'Азкар';

  @override
  String get close => 'Жабу';

  @override
  String get cancel => 'Болдырмау';

  @override
  String get reset => 'Қайта орнату';

  @override
  String get retry => 'Қайта көру';

  @override
  String get done => 'Дайын';

  @override
  String get showMore => 'Көбірек көрсету';

  @override
  String get showLess => 'Аз көрсету';

  @override
  String get qiblahTitle => 'Қибла';

  @override
  String get useCurrentLocation => 'Ағымдағы орынды пайдалану';

  @override
  String get changeCity => 'Қаланы өзгерту';

  @override
  String get currentLocationSaved => 'Ағымдағы орын сақталды';

  @override
  String get unableToGetGps => 'GPS алу мүмкін емес. Қаланы таңдап көріңіз.';

  @override
  String get locationStatusUnavailable => 'Орын күйін оқу мүмкін емес';

  @override
  String get locationEnableServices => 'Орын қызметтерін қосыңыз';

  @override
  String get locationEnableOrSelectCity =>
      'Орын қызметтерін қосыңыз немесе қаланы таңдаңыз';

  @override
  String get locationUnavailableSelectCity =>
      'Орын қолжетімсіз. Қаланы таңдаңыз немесе рұқсат беріңіз.';

  @override
  String get locationPermissionDenied =>
      'Орын рұқсаты қабылданбады. Қаланы таңдаңыз немесе рұқсат беріңіз.';

  @override
  String get locationPermissionDeniedForever =>
      'Орын рұқсаты тұрақты түрде қабылданбады. Баптауларда қаланы таңдаңыз.';

  @override
  String get locationUnavailable => 'Орын қолжетімсіз';

  @override
  String get sensorUnavailable =>
      'Бұл құрылғыда компас сенсоры жоқ. Қибла бағытын көрсету мүмкін емес.';

  @override
  String get compassUnavailable =>
      'Компас деректері қолжетімсіз. Нақты құрылғыны пайдаланып көріңіз, эмулятор орнын орнатыңыз немесе қаланы қолмен таңдаңыз.';

  @override
  String get calibrationHint =>
      'Компас дәлдігін арттыру үшін телефонды 8 пішінінде қозғалыңыз.';

  @override
  String get qiblahAccuracyDisclaimer =>
      'Qiblah direction is approximate. Accuracy depends on your device compass, location, and magnetic interference. Calibrate your phone and verify with a physical compass when precision matters.';

  @override
  String get facingQiblah => 'Қиблаға қарап';

  @override
  String rotateLeft(int degrees) {
    return 'Солға $degrees° бұру';
  }

  @override
  String rotateRight(int degrees) {
    return 'Оңға $degrees° бұру';
  }

  @override
  String get prayerTimesTitle => 'Намаз Уақыттары';

  @override
  String get settings => 'Баптаулар';

  @override
  String get todaysSchedule => 'Бүгінгі Кесте';

  @override
  String get nextPrayer => 'Келесі Намаз';

  @override
  String get locationNotSet => 'Орын орнатылмаған';

  @override
  String get failedToLoadPrayerTimes =>
      'Намаз уақыттарын жүктеу сәтсіз аяқталды';

  @override
  String get unableToCalculatePrayerTimes =>
      'Намаз уақыттарын есептеу мүмкін емес';

  @override
  String get selectCity => 'Қаланы Таңдау';

  @override
  String get searchCityHint => 'Қала немесе ел іздеу';

  @override
  String get calculationMethod => 'Есептеу Әдісі';

  @override
  String get calculationMethodSubtitle =>
      'Жергілікті мешіт органына сәйкес келтіріңіз';

  @override
  String get madhab => 'Мазхаб (Аср уақыты)';

  @override
  String get fineTune => 'Нақты реттеу (минут)';

  @override
  String get fineTuneSubtitle => 'Жергілікті мешіт кестесіне сәйкестендіріңіз';

  @override
  String get use24Hour => '24 сағаттық уақыт форматы';

  @override
  String get notifications => 'Хабарландырулар';

  @override
  String get refreshGps => 'GPS орнын жаңарту';

  @override
  String get language => 'Тіл';

  @override
  String get languageSubtitle => 'Қолданба тілін таңдаңыз';

  @override
  String get methodMuslimWorldLeague => 'Мусылмандар Әлем Лигасы';

  @override
  String get methodIsna => 'ISNA';

  @override
  String get methodUmmAlQura => 'Умм әл-Құра';

  @override
  String get methodEgyptian => 'Мысыр Жалпы Органы';

  @override
  String get methodKarachi => 'Карачи Университеті';

  @override
  String get madhabShafi => 'Шафии';

  @override
  String get madhabHanafi => 'Ханафи';

  @override
  String get prayerFajr => 'Таң';

  @override
  String get prayerSunrise => 'Күн шығу';

  @override
  String get prayerDhuhr => 'Бесін';

  @override
  String get prayerAsr => 'Екінті';

  @override
  String get prayerMaghrib => 'Ақшам';

  @override
  String get prayerIsha => 'Құптан';

  @override
  String get azkarTitle => 'Азкар';

  @override
  String get tasbih => 'Тасбих';

  @override
  String get categoryMorning => 'Таңертең';

  @override
  String get categoryEvening => 'Кеш';

  @override
  String get categoryPostPrayer => 'Намаздан кейін';

  @override
  String get morningDescription =>
      'Таң намаздан кейін таңертен зикр — Хисн аль-Муслим';

  @override
  String get eveningDescription =>
      'Екінті намаздан кейін кеш зикр — Хисн аль-Муслим';

  @override
  String get postPrayerDescription => 'Ар міндетті намаздан кейін зикр';

  @override
  String get tapToCount => 'Қайталауларды санау үшін карточканы басыңыз';

  @override
  String get referenceQuran => 'Қуран';

  @override
  String get referenceHadith => 'Хадис';

  @override
  String get referenceAthar => 'Атар';

  @override
  String get narrator => 'Айтушы';

  @override
  String get grade => 'Дәреже';

  @override
  String hisnNumber(int number) {
    return 'Hisn #$number';
  }

  @override
  String get tasbihTitle => 'Тасбих санағышы';

  @override
  String get tapToCountTasbih => 'Санау үшін кез келген жерді басыңыз';

  @override
  String get tasbihMilestones => '33 және 100-де белгілер';

  @override
  String get resetCounterTitle => 'Санағышты қайта орнату?';

  @override
  String get resetCounterMessage =>
      'Бұл ағымдағы тасбих сеансындағы санағыңызды тазалайды.';

  @override
  String get notificationPrayerTitle => 'Намаз Уақыты';

  @override
  String notificationPrayerBody(String prayer) {
    return '$prayer уақыты болды';
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
