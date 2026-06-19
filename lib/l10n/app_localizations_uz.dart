// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Uzbek (`uz`).
class AppLocalizationsUz extends AppLocalizations {
  AppLocalizationsUz([String locale = 'uz']) : super(locale);

  @override
  String get appTitle => 'Al-Qiblah va Namoz Hamrohi';

  @override
  String get navQiblah => 'Qiblah';

  @override
  String get navPrayerTimes => 'Namoz Vaqtlari';

  @override
  String get navAzkar => 'Azkar';

  @override
  String get close => 'Yopish';

  @override
  String get cancel => 'Bekor qilish';

  @override
  String get reset => 'Qayta o\'rnatish';

  @override
  String get retry => 'Qayta urinish';

  @override
  String get done => 'Tayyor';

  @override
  String get showMore => 'Ko\'proq ko\'rsatish';

  @override
  String get showLess => 'Kamroq ko\'rsatish';

  @override
  String get qiblahTitle => 'Qiblah';

  @override
  String get useCurrentLocation => 'Joriy joylashuvni ishlatish';

  @override
  String get changeCity => 'Shaharni o\'zgartirish';

  @override
  String get currentLocationSaved => 'Joriy joylashuv saqlandi';

  @override
  String get unableToGetGps =>
      'GPS olinmadi. Shaharni tanlashga harakat qiling.';

  @override
  String get locationStatusUnavailable => 'Joylashuv holatini o\'qib bo\'lmadi';

  @override
  String get locationEnableServices => 'Iltimos, joylashuv xizmatlarini yoqing';

  @override
  String get locationEnableOrSelectCity =>
      'Iltimos, joylashuv xizmatlarini yoqing yoki shaharni tanlang';

  @override
  String get locationUnavailableSelectCity =>
      'Joylashuv mavjud emas. Shaharni tanlang yoki ruxsat bering.';

  @override
  String get locationPermissionDenied =>
      'Joylashuv ruxsati rad etildi. Shaharni tanlang yoki ruxsat bering.';

  @override
  String get locationPermissionDeniedForever =>
      'Joylashuv ruxsati doimiy ravishda rad etildi. Sozlamalarda shaharni tanlang.';

  @override
  String get locationUnavailable => 'Joylashuv mavjud emas';

  @override
  String get sensorUnavailable =>
      'Bu qurilmada kompas sensori yo\'q. Qiblah yo\'nalishini ko\'rsatib bo\'lmaydi.';

  @override
  String get compassUnavailable =>
      'Kompas ma\'lumotlari mavjud emas. Haqiqiy qurilmani sinab ko\'ring, emulyator joylashuvini o\'rnating yoki shaharni qo\'lda tanlang.';

  @override
  String get calibrationHint =>
      'Kompas aniqligini yaxshilash uchun telefonni 8 shaklida harakatlantiring.';

  @override
  String get facingQiblah => 'Qiblahga qarab';

  @override
  String rotateLeft(int degrees) {
    return 'Chapga $degrees° buriling';
  }

  @override
  String rotateRight(int degrees) {
    return 'O\'ngga $degrees° buriling';
  }

  @override
  String get prayerTimesTitle => 'Namoz Vaqtlari';

  @override
  String get settings => 'Sozlamalar';

  @override
  String get todaysSchedule => 'Bugungi Jadval';

  @override
  String get nextPrayer => 'Keyingi Namoz';

  @override
  String get locationNotSet => 'Joylashuv o\'rnatilmagan';

  @override
  String get failedToLoadPrayerTimes => 'Namoz vaqtlarini yuklab bo\'lmadi';

  @override
  String get unableToCalculatePrayerTimes =>
      'Namoz vaqtlarini hisoblab bo\'lmadi';

  @override
  String get selectCity => 'Shaharni Tanlash';

  @override
  String get searchCityHint => 'Shahar yoki mamlakat qidirish';

  @override
  String get calculationMethod => 'Hisoblash Usuli';

  @override
  String get calculationMethodSubtitle => 'Mahalliy masjid organiga moslang';

  @override
  String get madhab => 'Madhab (Asr vaqti)';

  @override
  String get fineTune => 'Aniq sozlash (daqiqa)';

  @override
  String get fineTuneSubtitle => 'Mahalliy masjid jadvaliga moslang';

  @override
  String get use24Hour => '24 soatlik vaqt formati';

  @override
  String get notifications => 'Bildirishnomalar';

  @override
  String get refreshGps => 'GPS joylashuvini yangilash';

  @override
  String get language => 'Til';

  @override
  String get languageSubtitle => 'Ilova tilini tanlang';

  @override
  String get methodMuslimWorldLeague => 'Musulmonlar Jahon Ligasi';

  @override
  String get methodIsna => 'ISNA';

  @override
  String get methodUmmAlQura => 'Umm al-Qura';

  @override
  String get methodEgyptian => 'Misr Umumiy Organi';

  @override
  String get methodKarachi => 'Karachi Universiteti';

  @override
  String get madhabShafi => 'Shofi\'i';

  @override
  String get madhabHanafi => 'Hanafi';

  @override
  String get prayerFajr => 'Bomdod';

  @override
  String get prayerSunrise => 'Quyosh chiqishi';

  @override
  String get prayerDhuhr => 'Peshin';

  @override
  String get prayerAsr => 'Asr';

  @override
  String get prayerMaghrib => 'Shom';

  @override
  String get prayerIsha => 'Xufton';

  @override
  String get azkarTitle => 'Azkar';

  @override
  String get tasbih => 'Tasbih';

  @override
  String get categoryMorning => 'Ertalab';

  @override
  String get categoryEvening => 'Kechqurun';

  @override
  String get categoryPostPrayer => 'Namozdan Keyin';

  @override
  String get morningDescription =>
      'Bomdoddan keyin ertalab zikri — Hisn al-Muslim';

  @override
  String get eveningDescription =>
      'Asrdan keyin kechqurun zikri — Hisn al-Muslim';

  @override
  String get postPrayerDescription => 'Har bir farz namozdan keyin zikr';

  @override
  String get tapToCount => 'Takrorlashlarni sanash uchun kartochkani bosing';

  @override
  String get referenceQuran => 'Qur\'on';

  @override
  String get referenceHadith => 'Hadis';

  @override
  String get referenceAthar => 'Athar';

  @override
  String get narrator => 'Raviy';

  @override
  String get grade => 'Daraja';

  @override
  String hisnNumber(int number) {
    return 'Hisn #$number';
  }

  @override
  String get tasbihTitle => 'Tasbih Hisoblagichi';

  @override
  String get tapToCountTasbih => 'Sanash uchun istalgan joyni bosing';

  @override
  String get tasbihMilestones => '33 va 100 da bosqichlar';

  @override
  String get resetCounterTitle => 'Hisoblagichni qayta o\'rnatish?';

  @override
  String get resetCounterMessage =>
      'Bu joriy Tasbih seansidagi hisobingizni tozalaydi.';

  @override
  String get notificationPrayerTitle => 'Namoz Vaqti';

  @override
  String notificationPrayerBody(String prayer) {
    return '$prayer vaqti bo\'ldi';
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
