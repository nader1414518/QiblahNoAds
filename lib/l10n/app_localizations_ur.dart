// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get appTitle => 'القبلہ اور نماز کا ساتھی';

  @override
  String get navQiblah => 'قبلہ';

  @override
  String get navPrayerTimes => 'نماز کے اوقات';

  @override
  String get navAzkar => 'اذکار';

  @override
  String get close => 'بند کریں';

  @override
  String get cancel => 'منسوخ';

  @override
  String get reset => 'ری سیٹ';

  @override
  String get retry => 'دوبارہ کوشش';

  @override
  String get done => 'مکمل';

  @override
  String get showMore => 'مزید دکھائیں';

  @override
  String get showLess => 'کم دکھائیں';

  @override
  String get qiblahTitle => 'قبلہ';

  @override
  String get useCurrentLocation => 'موجودہ مقام استعمال کریں';

  @override
  String get changeCity => 'شہر تبدیل کریں';

  @override
  String get currentLocationSaved => 'موجودہ مقام محفوظ ہو گیا';

  @override
  String get unableToGetGps => 'GPS حاصل نہیں ہو سکا۔ براہ کرم شہر منتخب کریں۔';

  @override
  String get locationStatusUnavailable => 'مقام کی حالت پڑھنے میں ناکامی';

  @override
  String get locationEnableServices => 'براہ کرم لوکیشن سروسز فعال کریں';

  @override
  String get locationEnableOrSelectCity =>
      'براہ کرم لوکیشن سروسز فعال کریں یا شہر منتخب کریں';

  @override
  String get locationUnavailableSelectCity =>
      'مقام دستیاب نہیں۔ شہر منتخب کریں یا اجازت دیں۔';

  @override
  String get locationPermissionDenied =>
      'لوکیشن کی اجازت مسترد۔ شہر منتخب کریں یا اجازت دیں۔';

  @override
  String get locationPermissionDeniedForever =>
      'لوکیشن کی اجازت مستقل طور پر مسترد۔ ترتیبات میں شہر منتخب کریں۔';

  @override
  String get locationUnavailable => 'مقام دستیاب نہیں';

  @override
  String get sensorUnavailable =>
      'اس آلہ میں کمپاس سینسر نہیں ہے۔ قبلہ کی سمت نہیں دکھائی جا سکتی۔';

  @override
  String get compassUnavailable =>
      'کمپاس کا ڈیٹا دستیاب نہیں۔ حقیقی آلہ استعمال کریں، ایمولیٹر میں مقام سیٹ کریں، یا دستی طور پر شہر منتخب کریں۔';

  @override
  String get calibrationHint =>
      'کمپاس کی درستگی بہتر بنانے کے لیے فون کو 8 کی شکل میں حرکت دیں۔';

  @override
  String get facingQiblah => 'قبلہ رخ';

  @override
  String rotateLeft(int degrees) {
    return 'بائیں $degrees° گھمائیں';
  }

  @override
  String rotateRight(int degrees) {
    return 'دائیں $degrees° گھمائیں';
  }

  @override
  String get prayerTimesTitle => 'نماز کے اوقات';

  @override
  String get settings => 'ترتیبات';

  @override
  String get todaysSchedule => 'آج کا شیڈول';

  @override
  String get nextPrayer => 'اگلی نماز';

  @override
  String get locationNotSet => 'مقام مقرر نہیں';

  @override
  String get failedToLoadPrayerTimes => 'نماز کے اوقات لوڈ نہیں ہو سکے';

  @override
  String get unableToCalculatePrayerTimes =>
      'نماز کے اوقات کا حساب نہیں ہو سکا';

  @override
  String get selectCity => 'شہر منتخب کریں';

  @override
  String get searchCityHint => 'شہر یا ملک تلاش کریں';

  @override
  String get calculationMethod => 'حساب کا طریقہ';

  @override
  String get calculationMethodSubtitle => 'اپنی مقامی مسجد کے مطابق رکھیں';

  @override
  String get madhab => 'مذہب (عصر کا وقت)';

  @override
  String get fineTune => 'باریک ترتیب (منٹ)';

  @override
  String get fineTuneSubtitle => 'مقامی مسجد کے شیڈول کے مطابق درست کریں';

  @override
  String get use24Hour => '24 گھنٹے کا وقت فارمیٹ';

  @override
  String get notifications => 'اطلاعات';

  @override
  String get refreshGps => 'GPS مقام تازہ کریں';

  @override
  String get language => 'زبان';

  @override
  String get languageSubtitle => 'ایپ کی زبان منتخب کریں';

  @override
  String get methodMuslimWorldLeague => 'مسلم ورلڈ لیگ';

  @override
  String get methodIsna => 'ISNA';

  @override
  String get methodUmmAlQura => 'ام القریٰ';

  @override
  String get methodEgyptian => 'مصری جنرل اتھارٹی';

  @override
  String get methodKarachi => 'کراچی یونیورسٹی';

  @override
  String get madhabShafi => 'شافعی';

  @override
  String get madhabHanafi => 'حنفی';

  @override
  String get prayerFajr => 'فجر';

  @override
  String get prayerSunrise => 'طلوع';

  @override
  String get prayerDhuhr => 'ظہر';

  @override
  String get prayerAsr => 'عصر';

  @override
  String get prayerMaghrib => 'مغرب';

  @override
  String get prayerIsha => 'عشاء';

  @override
  String get azkarTitle => 'اذکار';

  @override
  String get tasbih => 'تسبیح';

  @override
  String get categoryMorning => 'صبح';

  @override
  String get categoryEvening => 'شام';

  @override
  String get categoryPostPrayer => 'نماز کے بعد';

  @override
  String get morningDescription => 'فجر کے بعد صبح کے اذکار — حصن المسلم';

  @override
  String get eveningDescription => 'عصر کے بعد شام کے اذکار — حصن المسلم';

  @override
  String get postPrayerDescription => 'ہر فرض نماز کے بعد ذکر';

  @override
  String get tapToCount => 'تکرار گننے کے لیے کارڈ پر ٹیپ کریں';

  @override
  String get referenceQuran => 'قرآن';

  @override
  String get referenceHadith => 'حدیث';

  @override
  String get referenceAthar => 'اثر';

  @override
  String get narrator => 'راوی';

  @override
  String get grade => 'درجہ';

  @override
  String hisnNumber(int number) {
    return 'حصن #$number';
  }

  @override
  String get tasbihTitle => 'تسبیح کاؤنٹر';

  @override
  String get tapToCountTasbih => 'گننے کے لیے کہیں بھی ٹیپ کریں';

  @override
  String get tasbihMilestones => '33 اور 100 پر سنگ میل';

  @override
  String get resetCounterTitle => 'کاؤنٹر ری سیٹ کریں؟';

  @override
  String get resetCounterMessage =>
      'یہ آپ کی موجودہ تسبیح سیشن کی گنتی صاف کر دے گا۔';

  @override
  String get notificationPrayerTitle => 'نماز کا وقت';

  @override
  String notificationPrayerBody(String prayer) {
    return '$prayer کا وقت ہو گیا';
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
}
