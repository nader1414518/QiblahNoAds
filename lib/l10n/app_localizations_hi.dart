// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'अल-क़िबला और नमाज़ साथी';

  @override
  String get navQiblah => 'क़िबला';

  @override
  String get navPrayerTimes => 'नमाज़ के समय';

  @override
  String get navAzkar => 'अज़कार';

  @override
  String get close => 'बंद करें';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get reset => 'रीसेट';

  @override
  String get retry => 'पुनः प्रयास';

  @override
  String get done => 'पूर्ण';

  @override
  String get showMore => 'और दिखाएँ';

  @override
  String get showLess => 'कम दिखाएँ';

  @override
  String get qiblahTitle => 'क़िबला';

  @override
  String get useCurrentLocation => 'वर्तमान स्थान का उपयोग करें';

  @override
  String get changeCity => 'शहर बदलें';

  @override
  String get currentLocationSaved => 'वर्तमान स्थान सहेजा गया';

  @override
  String get unableToGetGps => 'GPS प्राप्त नहीं हो सका। कृपया शहर चुनें।';

  @override
  String get locationStatusUnavailable => 'स्थान की स्थिति पढ़ने में असमर्थ';

  @override
  String get locationEnableServices => 'कृपया स्थान सेवाएँ सक्षम करें';

  @override
  String get locationEnableOrSelectCity =>
      'कृपया स्थान सेवाएँ सक्षम करें या शहर चुनें';

  @override
  String get locationUnavailableSelectCity =>
      'स्थान उपलब्ध नहीं। शहर चुनें या अनुमति दें।';

  @override
  String get locationPermissionDenied =>
      'स्थान अनुमति अस्वीकृत। शहर चुनें या अनुमति दें।';

  @override
  String get locationPermissionDeniedForever =>
      'स्थान अनुमति स्थायी रूप से अस्वीकृत। सेटिंग में शहर चुनें।';

  @override
  String get locationUnavailable => 'स्थान उपलब्ध नहीं';

  @override
  String get sensorUnavailable =>
      'इस उपकरण में कम्पास सेंसर नहीं है। क़िबला दिशा नहीं दिखाई जा सकती।';

  @override
  String get compassUnavailable =>
      'कम्पास डेटा उपलब्ध नहीं। वास्तविक उपकरण आज़माएँ, एमुलेटर में स्थान सेट करें, या मैन्युअल रूप से शहर चुनें।';

  @override
  String get calibrationHint =>
      'कम्पास की सटीकता बढ़ाने के लिए फ़ोन को 8 के आकार में घुमाएँ।';

  @override
  String get qiblahAccuracyDisclaimer =>
      'Qiblah direction is approximate. Accuracy depends on your device compass, location, and magnetic interference. Calibrate your phone and verify with a physical compass when precision matters.';

  @override
  String get facingQiblah => 'क़िबला की ओर';

  @override
  String rotateLeft(int degrees) {
    return 'बाएँ $degrees° घुमाएँ';
  }

  @override
  String rotateRight(int degrees) {
    return 'दाएँ $degrees° घुमाएँ';
  }

  @override
  String get prayerTimesTitle => 'नमाज़ के समय';

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get todaysSchedule => 'आज का कार्यक्रम';

  @override
  String get nextPrayer => 'अगली नमाज़';

  @override
  String get locationNotSet => 'स्थान सेट नहीं';

  @override
  String get failedToLoadPrayerTimes => 'नमाज़ के समय लोड करने में विफल';

  @override
  String get unableToCalculatePrayerTimes => 'नमाज़ के समय की गणना नहीं हो सकी';

  @override
  String get selectCity => 'शहर चुनें';

  @override
  String get searchCityHint => 'शहर या देश खोजें';

  @override
  String get calculationMethod => 'गणना विधि';

  @override
  String get calculationMethodSubtitle =>
      'अपनी स्थानीय मस्जिद के अनुसार मिलाएँ';

  @override
  String get madhab => 'मज़हब (अस्र का समय)';

  @override
  String get fineTune => 'सूक्ष्म समायोजन (मिनट)';

  @override
  String get fineTuneSubtitle =>
      'स्थानीय मस्जिद के समय सारिणी के अनुसार समायोजित करें';

  @override
  String get use24Hour => '24-घंटे का समय प्रारूप';

  @override
  String get notifications => 'सूचनाएँ';

  @override
  String get refreshGps => 'GPS स्थान रीफ़्रेश करें';

  @override
  String get language => 'भाषा';

  @override
  String get languageSubtitle => 'ऐप की प्रदर्शन भाषा चुनें';

  @override
  String get methodMuslimWorldLeague => 'मुस्लिम वर्ल्ड लीग';

  @override
  String get methodIsna => 'ISNA';

  @override
  String get methodUmmAlQura => 'उम्म अल-क़ुरा';

  @override
  String get methodEgyptian => 'मिस्र सामान्य प्राधिकरण';

  @override
  String get methodKarachi => 'कराची विश्वविद्यालय';

  @override
  String get madhabShafi => 'शाफ़ी';

  @override
  String get madhabHanafi => 'हनफ़ी';

  @override
  String get prayerFajr => 'फज्र';

  @override
  String get prayerSunrise => 'सूर्योदय';

  @override
  String get prayerDhuhr => 'ज़ुह्र';

  @override
  String get prayerAsr => 'अस्र';

  @override
  String get prayerMaghrib => 'मग़रिब';

  @override
  String get prayerIsha => 'इशा';

  @override
  String get azkarTitle => 'अज़कार';

  @override
  String get tasbih => 'तस्बीह';

  @override
  String get categoryMorning => 'सुबह';

  @override
  String get categoryEvening => 'शाम';

  @override
  String get categoryPostPrayer => 'नमाज़ के बाद';

  @override
  String get morningDescription =>
      'फज्र के बाद सुबह के अज़कार — हिस्न अल-मुस्लिम';

  @override
  String get eveningDescription =>
      'अस्र के बाद शाम के अज़कार — हिस्न अल-मुस्लिम';

  @override
  String get postPrayerDescription => 'हर फ़र्ज़ नमाज़ के बाद ज़िक्र';

  @override
  String get tapToCount => 'दोहराव गिनने के लिए कार्ड पर टैप करें';

  @override
  String get referenceQuran => 'क़ुरआन';

  @override
  String get referenceHadith => 'हदीस';

  @override
  String get referenceAthar => 'अथर';

  @override
  String get narrator => 'रावी';

  @override
  String get grade => 'दर्जा';

  @override
  String hisnNumber(int number) {
    return 'हिस्न #$number';
  }

  @override
  String get tasbihTitle => 'तस्बीह काउंटर';

  @override
  String get tapToCountTasbih => 'गिनने के लिए कहीं भी टैप करें';

  @override
  String get tasbihMilestones => '33 और 100 पर मील के पत्थर';

  @override
  String get resetCounterTitle => 'काउंटर रीसेट करें?';

  @override
  String get resetCounterMessage =>
      'यह आपकी वर्तमान तस्बीह सत्र की गिनती मिटा देगा।';

  @override
  String get notificationPrayerTitle => 'नमाज़ का समय';

  @override
  String notificationPrayerBody(String prayer) {
    return '$prayer का समय हो गया है';
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
