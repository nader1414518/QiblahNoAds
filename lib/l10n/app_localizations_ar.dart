// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'القبلة ورفيق الصلاة';

  @override
  String get navQiblah => 'القبلة';

  @override
  String get navPrayerTimes => 'أوقات الصلاة';

  @override
  String get navAzkar => 'الأذكار';

  @override
  String get close => 'إغلاق';

  @override
  String get cancel => 'إلغاء';

  @override
  String get reset => 'إعادة تعيين';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get done => 'تم';

  @override
  String get showMore => 'عرض المزيد';

  @override
  String get showLess => 'عرض أقل';

  @override
  String get qiblahTitle => 'القبلة';

  @override
  String get useCurrentLocation => 'استخدام الموقع الحالي';

  @override
  String get changeCity => 'تغيير المدينة';

  @override
  String get currentLocationSaved => 'تم حفظ الموقع الحالي';

  @override
  String get unableToGetGps =>
      'تعذّر الحصول على GPS. جرّب اختيار مدينة بدلاً من ذلك.';

  @override
  String get locationStatusUnavailable => 'تعذّر قراءة حالة الموقع';

  @override
  String get locationEnableServices => 'يرجى تفعيل خدمات الموقع';

  @override
  String get locationEnableOrSelectCity =>
      'يرجى تفعيل خدمات الموقع أو اختيار مدينة';

  @override
  String get locationUnavailableSelectCity =>
      'الموقع غير متاح. اختر مدينة أو امنح الإذن.';

  @override
  String get locationPermissionDenied =>
      'تم رفض إذن الموقع. اختر مدينة أو امنح الإذن.';

  @override
  String get locationPermissionDeniedForever =>
      'تم رفض إذن الموقع نهائياً. اختر مدينة من الإعدادات.';

  @override
  String get locationUnavailable => 'الموقع غير متاح';

  @override
  String get sensorUnavailable =>
      'هذا الجهاز لا يحتوي على مستشعر بوصلة. لا يمكن عرض اتجاه القبلة.';

  @override
  String get compassUnavailable =>
      'بيانات البوصلة غير متاحة. جرّب جهازاً فعلياً، أو حدّد موقعاً في المحاكي، أو اختر مدينة يدوياً.';

  @override
  String get calibrationHint => 'حرّك هاتفك بحركة رقم 8 لتحسين دقة البوصلة.';

  @override
  String get facingQiblah => 'متجه نحو القبلة';

  @override
  String rotateLeft(int degrees) {
    return 'أدر يساراً $degrees°';
  }

  @override
  String rotateRight(int degrees) {
    return 'أدر يميناً $degrees°';
  }

  @override
  String get prayerTimesTitle => 'أوقات الصلاة';

  @override
  String get settings => 'الإعدادات';

  @override
  String get todaysSchedule => 'جدول اليوم';

  @override
  String get nextPrayer => 'الصلاة التالية';

  @override
  String get locationNotSet => 'لم يُحدَّد الموقع';

  @override
  String get failedToLoadPrayerTimes => 'فشل تحميل أوقات الصلاة';

  @override
  String get unableToCalculatePrayerTimes => 'تعذّر حساب أوقات الصلاة';

  @override
  String get selectCity => 'اختر المدينة';

  @override
  String get searchCityHint => 'ابحث عن مدينة أو دولة';

  @override
  String get calculationMethod => 'طريقة الحساب';

  @override
  String get calculationMethodSubtitle => 'طابقها مع مسجدك المحلي';

  @override
  String get madhab => 'المذهب (وقت العصر)';

  @override
  String get fineTune => 'ضبط دقيق (بالدقائق)';

  @override
  String get fineTuneSubtitle => 'عدّل لتطابق جدول مسجدك المحلي';

  @override
  String get use24Hour => 'تنسيق الوقت 24 ساعة';

  @override
  String get notifications => 'الإشعارات';

  @override
  String get refreshGps => 'تحديث موقع GPS';

  @override
  String get language => 'اللغة';

  @override
  String get languageSubtitle => 'اختر لغة عرض التطبيق';

  @override
  String get methodMuslimWorldLeague => 'رابطة العالم الإسلامي';

  @override
  String get methodIsna => 'ISNA';

  @override
  String get methodUmmAlQura => 'أم القرى';

  @override
  String get methodEgyptian => 'الهيئة المصرية العامة للمساحة';

  @override
  String get methodKarachi => 'جامعة كراتشي';

  @override
  String get madhabShafi => 'الشافعي';

  @override
  String get madhabHanafi => 'الحنفي';

  @override
  String get prayerFajr => 'الفجر';

  @override
  String get prayerSunrise => 'الشروق';

  @override
  String get prayerDhuhr => 'الظهر';

  @override
  String get prayerAsr => 'العصر';

  @override
  String get prayerMaghrib => 'المغرب';

  @override
  String get prayerIsha => 'العشاء';

  @override
  String get azkarTitle => 'الأذكار';

  @override
  String get tasbih => 'التسبيح';

  @override
  String get categoryMorning => 'الصباح';

  @override
  String get categoryEvening => 'المساء';

  @override
  String get categoryPostPrayer => 'بعد الصلاة';

  @override
  String get morningDescription => 'أذكار الصباح بعد الفجر — حصن المسلم';

  @override
  String get eveningDescription => 'أذكار المساء بعد العصر — حصن المسلم';

  @override
  String get postPrayerDescription => 'ذكر بعد كل صلاة مفروضة';

  @override
  String get tapToCount => 'اضغط على البطاقة لعدّ التكرارات';

  @override
  String get referenceQuran => 'القرآن';

  @override
  String get referenceHadith => 'الحديث';

  @override
  String get referenceAthar => 'الأثر';

  @override
  String get narrator => 'الراوي';

  @override
  String get grade => 'الدرجة';

  @override
  String hisnNumber(int number) {
    return 'حصن #$number';
  }

  @override
  String get tasbihTitle => 'عداد التسبيح';

  @override
  String get tapToCountTasbih => 'اضغط في أي مكان للعد';

  @override
  String get tasbihMilestones => 'معالم عند 33 و100';

  @override
  String get resetCounterTitle => 'إعادة تعيين العداد؟';

  @override
  String get resetCounterMessage =>
      'سيؤدي هذا إلى مسح عدد جلسة التسبيح الحالية.';

  @override
  String get notificationPrayerTitle => 'وقت الصلاة';

  @override
  String notificationPrayerBody(String prayer) {
    return 'حان وقت $prayer';
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
