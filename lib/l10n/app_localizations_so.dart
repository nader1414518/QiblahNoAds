// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Somali (`so`).
class AppLocalizationsSo extends AppLocalizations {
  AppLocalizationsSo([String locale = 'so']) : super(locale);

  @override
  String get appTitle => 'Al-Qiblah & Saaxiibka Salaadda';

  @override
  String get navQiblah => 'Qiblah';

  @override
  String get navPrayerTimes => 'Waqtiyada Salaadda';

  @override
  String get navAzkar => 'Azkar';

  @override
  String get close => 'Xir';

  @override
  String get cancel => 'Jooji';

  @override
  String get reset => 'Dib u deji';

  @override
  String get retry => 'Isku day mar kale';

  @override
  String get done => 'Dhammaystiran';

  @override
  String get showMore => 'Muuji wax badan';

  @override
  String get showLess => 'Muuji wax yar';

  @override
  String get qiblahTitle => 'Qiblah';

  @override
  String get useCurrentLocation => 'Isticmaal goobta hadda';

  @override
  String get changeCity => 'Beddel magaalada';

  @override
  String get currentLocationSaved => 'Goobta hadda waa la keydiyay';

  @override
  String get unableToGetGps =>
      'GPS lama heli karo. Isku day inaad magaalo doorato.';

  @override
  String get locationStatusUnavailable => 'Xaaladda goobta lama akhrin karo';

  @override
  String get locationEnableServices => 'Fadlan hawlgeli adeegyada goobta';

  @override
  String get locationEnableOrSelectCity =>
      'Fadlan hawlgeli adeegyada goobta ama dooro magaalo';

  @override
  String get locationUnavailableSelectCity =>
      'Goobta lama heli karo. Dooro magaalo ama ogolow rukhsad.';

  @override
  String get locationPermissionDenied =>
      'Rukhsadda goobta waa la diiday. Dooro magaalo ama ogolow rukhsad.';

  @override
  String get locationPermissionDeniedForever =>
      'Rukhsadda goobta si joogto ah ayaa loo diiday. Dooro magaalo goobaha.';

  @override
  String get locationUnavailable => 'Goobta lama heli karo';

  @override
  String get sensorUnavailable =>
      'Qalabkani ma laha dareemayaal kombaas. Jihada Qiblah lama muujin karo.';

  @override
  String get compassUnavailable =>
      'Xogta kombaasku lama heli karo. Isku day qalab dhab ah, deji goobta emulator-ka, ama dooro magaalo gacanta.';

  @override
  String get calibrationHint =>
      'U dhaqaaq taleefanka qaab 8 si aad u hagaajiso saxnaanta kombaaska.';

  @override
  String get qiblahAccuracyDisclaimer =>
      'Qiblah direction is approximate. Accuracy depends on your device compass, location, and magnetic interference. Calibrate your phone and verify with a physical compass when precision matters.';

  @override
  String get facingQiblah => 'Wajahaya Qiblah';

  @override
  String rotateLeft(int degrees) {
    return 'U leexo bidix $degrees°';
  }

  @override
  String rotateRight(int degrees) {
    return 'U leexo midig $degrees°';
  }

  @override
  String get prayerTimesTitle => 'Waqtiyada Salaadda';

  @override
  String get settings => 'Dejinta';

  @override
  String get todaysSchedule => 'Jadwalka Maanta';

  @override
  String get nextPrayer => 'Salaadda Xigta';

  @override
  String get locationNotSet => 'Goobta lama dejin';

  @override
  String get failedToLoadPrayerTimes => 'Waqtiyada salaadda lama soo rarin';

  @override
  String get unableToCalculatePrayerTimes =>
      'Waqtiyada salaadda lama xisaabin karo';

  @override
  String get selectCity => 'Dooro Magaalo';

  @override
  String get searchCityHint => 'Raadi magaalo ama dal';

  @override
  String get calculationMethod => 'Habka Xisaabinta';

  @override
  String get calculationMethodSubtitle =>
      'U dhig sida hay\'adda masaajidkaaga maxalliga ah';

  @override
  String get madhab => 'Madhab (waqtiga Asr)';

  @override
  String get fineTune => 'Hagaajin (daqiiqado)';

  @override
  String get fineTuneSubtitle =>
      'U hagaaji si uu ula jaanqaado jadwalka masaajidkaaga';

  @override
  String get use24Hour => 'Qaabka saacadda 24-saac';

  @override
  String get notifications => 'Ogeysiisyada';

  @override
  String get refreshGps => 'Cusbooneysii goobta GPS';

  @override
  String get language => 'Luqadda';

  @override
  String get languageSubtitle => 'Dooro luqadda muujinta app-ka';

  @override
  String get methodMuslimWorldLeague => 'Ururka Caalamiga ah ee Muslimiinta';

  @override
  String get methodIsna => 'ISNA';

  @override
  String get methodUmmAlQura => 'Umm al-Qura';

  @override
  String get methodEgyptian => 'Hay\'adda Guud ee Masar';

  @override
  String get methodKarachi => 'Jaamacadda Karachi';

  @override
  String get madhabShafi => 'Shafi\'i';

  @override
  String get madhabHanafi => 'Hanafi';

  @override
  String get prayerFajr => 'Fajr';

  @override
  String get prayerSunrise => 'Qorrax soo bax';

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
  String get categoryMorning => 'Subax';

  @override
  String get categoryEvening => 'Galab';

  @override
  String get categoryPostPrayer => 'Salaadda Kadib';

  @override
  String get morningDescription =>
      'Xusuusinta subaxda kadib Fajr — Hisn al-Muslim';

  @override
  String get eveningDescription =>
      'Xusuusinta galabta kadib Asr — Hisn al-Muslim';

  @override
  String get postPrayerDescription => 'Dhikr kadib salaadda waajibka ah';

  @override
  String get tapToCount => 'Taabo kaadhka si aad u tiriso celcelinta';

  @override
  String get referenceQuran => 'Qur\'aanka';

  @override
  String get referenceHadith => 'Hadith';

  @override
  String get referenceAthar => 'Athar';

  @override
  String get narrator => 'Sheekheeye';

  @override
  String get grade => 'Darajo';

  @override
  String hisnNumber(int number) {
    return 'Hisn #$number';
  }

  @override
  String get tasbihTitle => 'Tirada Tasbih';

  @override
  String get tapToCountTasbih => 'Taabo meel kasta si aad u tiriso';

  @override
  String get tasbihMilestones => '33 iyo 100 beldhi';

  @override
  String get resetCounterTitle => 'Dib u deji tirada?';

  @override
  String get resetCounterMessage =>
      'Tani waxay tirtiri doontaa tirinta fadhigaaga Tasbih ee hadda.';

  @override
  String get notificationPrayerTitle => 'Waqtiga Salaadda';

  @override
  String notificationPrayerBody(String prayer) {
    return 'Waa waqtigii $prayer';
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
