// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get appTitle => 'القبله و همراه نماز';

  @override
  String get navQiblah => 'قبله';

  @override
  String get navPrayerTimes => 'اوقات نماز';

  @override
  String get navAzkar => 'اذکار';

  @override
  String get close => 'بستن';

  @override
  String get cancel => 'لغو';

  @override
  String get reset => 'بازنشانی';

  @override
  String get retry => 'تلاش مجدد';

  @override
  String get done => 'انجام شد';

  @override
  String get showMore => 'نمایش بیشتر';

  @override
  String get showLess => 'نمایش کمتر';

  @override
  String get qiblahTitle => 'قبله';

  @override
  String get useCurrentLocation => 'استفاده از موقعیت فعلی';

  @override
  String get changeCity => 'تغییر شهر';

  @override
  String get currentLocationSaved => 'موقعیت فعلی ذخیره شد';

  @override
  String get unableToGetGps => 'دریافت GPS ممکن نشد. یک شهر انتخاب کنید.';

  @override
  String get locationStatusUnavailable => 'خواندن وضعیت موقعیت ممکن نشد';

  @override
  String get locationEnableServices => 'لطفاً سرویس‌های موقعیت را فعال کنید';

  @override
  String get locationEnableOrSelectCity =>
      'لطفاً سرویس‌های موقعیت را فعال کنید یا یک شهر انتخاب کنید';

  @override
  String get locationUnavailableSelectCity =>
      'موقعیت در دسترس نیست. یک شهر انتخاب کنید یا اجازه دهید.';

  @override
  String get locationPermissionDenied =>
      'اجازه موقعیت رد شد. یک شهر انتخاب کنید یا اجازه دهید.';

  @override
  String get locationPermissionDeniedForever =>
      'اجازه موقعیت برای همیشه رد شد. در تنظیمات یک شهر انتخاب کنید.';

  @override
  String get locationUnavailable => 'موقعیت در دسترس نیست';

  @override
  String get sensorUnavailable =>
      'این دستگاه حسگر قطب‌نما ندارد. جهت قبله قابل نمایش نیست.';

  @override
  String get compassUnavailable =>
      'داده‌های قطب‌نما در دسترس نیست. دستگاه واقعی امتحان کنید، موقعیت شبیه‌ساز را تنظیم کنید، یا دستی یک شهر انتخاب کنید.';

  @override
  String get calibrationHint =>
      'گوشی را به شکل عدد ۸ حرکت دهید تا دقت قطب‌نما بهتر شود.';

  @override
  String get facingQiblah => 'رو به قبله';

  @override
  String rotateLeft(int degrees) {
    return 'چپ $degrees° بچرخانید';
  }

  @override
  String rotateRight(int degrees) {
    return 'راست $degrees° بچرخانید';
  }

  @override
  String get prayerTimesTitle => 'اوقات نماز';

  @override
  String get settings => 'تنظیمات';

  @override
  String get todaysSchedule => 'برنامه امروز';

  @override
  String get nextPrayer => 'نماز بعدی';

  @override
  String get locationNotSet => 'موقعیت تنظیم نشده';

  @override
  String get failedToLoadPrayerTimes => 'بارگذاری اوقات نماز ناموفق بود';

  @override
  String get unableToCalculatePrayerTimes => 'محاسبه اوقات نماز ممکن نشد';

  @override
  String get selectCity => 'انتخاب شهر';

  @override
  String get searchCityHint => 'جستجوی شهر یا کشور';

  @override
  String get calculationMethod => 'روش محاسبه';

  @override
  String get calculationMethodSubtitle =>
      'مطابق با مرجع مسجد محلی خود تنظیم کنید';

  @override
  String get madhab => 'مذهب (وقت عصر)';

  @override
  String get fineTune => 'تنظیم دقیق (دقیقه)';

  @override
  String get fineTuneSubtitle => 'برای هماهنگی با جدول مسجد محلی تنظیم کنید';

  @override
  String get use24Hour => 'قالب ۲۴ ساعته';

  @override
  String get notifications => 'اعلان‌ها';

  @override
  String get refreshGps => 'به‌روزرسانی موقعیت GPS';

  @override
  String get language => 'زبان';

  @override
  String get languageSubtitle => 'زبان نمایش برنامه را انتخاب کنید';

  @override
  String get methodMuslimWorldLeague => 'اتحادیه جهانی مسلمانان';

  @override
  String get methodIsna => 'ISNA';

  @override
  String get methodUmmAlQura => 'ام‌القری';

  @override
  String get methodEgyptian => 'مرجع عمومی مصر';

  @override
  String get methodKarachi => 'دانشگاه کراچی';

  @override
  String get madhabShafi => 'شافعی';

  @override
  String get madhabHanafi => 'حنفی';

  @override
  String get prayerFajr => 'فجر';

  @override
  String get prayerSunrise => 'طلوع';

  @override
  String get prayerDhuhr => 'ظهر';

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
  String get categoryEvening => 'عصر';

  @override
  String get categoryPostPrayer => 'بعد از نماز';

  @override
  String get morningDescription => 'اذکار صبح پس از فجر — حصن المسلم';

  @override
  String get eveningDescription => 'اذکار عصر پس از عصر — حصن المسلم';

  @override
  String get postPrayerDescription => 'ذکر پس از هر نماز واجب';

  @override
  String get tapToCount => 'برای شمارش تکرار روی کارت بزنید';

  @override
  String get referenceQuran => 'قرآن';

  @override
  String get referenceHadith => 'حدیث';

  @override
  String get referenceAthar => 'اثر';

  @override
  String get narrator => 'راوی';

  @override
  String get grade => 'درجه';

  @override
  String hisnNumber(int number) {
    return 'حصن #$number';
  }

  @override
  String get tasbihTitle => 'شمارنده تسبیح';

  @override
  String get tapToCountTasbih => 'برای شمارش هر جا بزنید';

  @override
  String get tasbihMilestones => 'نقاط عطف در ۳۳ و ۱۰۰';

  @override
  String get resetCounterTitle => 'بازنشانی شمارنده؟';

  @override
  String get resetCounterMessage =>
      'این کار شمارش جلسه تسبیح فعلی شما را پاک می‌کند.';

  @override
  String get notificationPrayerTitle => 'وقت نماز';

  @override
  String notificationPrayerBody(String prayer) {
    return 'وقت $prayer فرا رسیده است';
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
