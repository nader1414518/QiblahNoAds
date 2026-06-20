// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appTitle => 'আল-কিবলা ও নামাজের সঙ্গী';

  @override
  String get navQiblah => 'কিবলা';

  @override
  String get navPrayerTimes => 'নামাজের সময়';

  @override
  String get navAzkar => 'আযকার';

  @override
  String get close => 'বন্ধ';

  @override
  String get cancel => 'বাতিল';

  @override
  String get reset => 'রিসেট';

  @override
  String get retry => 'আবার চেষ্টা';

  @override
  String get done => 'সম্পন্ন';

  @override
  String get showMore => 'আরও দেখুন';

  @override
  String get showLess => 'কম দেখুন';

  @override
  String get qiblahTitle => 'কিবলা';

  @override
  String get useCurrentLocation => 'বর্তমান অবস্থান ব্যবহার করুন';

  @override
  String get changeCity => 'শহর পরিবর্তন';

  @override
  String get currentLocationSaved => 'বর্তমান অবস্থান সংরক্ষিত';

  @override
  String get unableToGetGps =>
      'GPS পাওয়া যায়নি। পরিবর্তে একটি শহর নির্বাচন করুন।';

  @override
  String get locationStatusUnavailable => 'অবস্থানের অবস্থা পড়া যায়নি';

  @override
  String get locationEnableServices => 'অনুগ্রহ করে লোকেশন সেবা চালু করুন';

  @override
  String get locationEnableOrSelectCity =>
      'অনুগ্রহ করে লোকেশন সেবা চালু করুন বা একটি শহর নির্বাচন করুন';

  @override
  String get locationUnavailableSelectCity =>
      'অবস্থান অনুপলব্ধ। একটি শহর নির্বাচন করুন বা অনুমতি দিন।';

  @override
  String get locationPermissionDenied =>
      'লোকেশন অনুমতি প্রত্যাখ্যাত। একটি শহর নির্বাচন করুন বা অনুমতি দিন।';

  @override
  String get locationPermissionDeniedForever =>
      'লোকেশন অনুমতি স্থায়ীভাবে প্রত্যাখ্যাত। সেটিংসে একটি শহর নির্বাচন করুন।';

  @override
  String get locationUnavailable => 'অবস্থান অনুপলব্ধ';

  @override
  String get sensorUnavailable =>
      'এই ডিভাইসে কম্পাস সেন্সর নেই। কিবলার দিক দেখানো যাবে না।';

  @override
  String get compassUnavailable =>
      'কম্পাসের তথ্য অনুপলব্ধ। একটি প্রকৃত ডিভাইস ব্যবহার করুন, এমুলেটরে অবস্থান সেট করুন, বা ম্যানুয়ালি একটি শহর নির্বাচন করুন।';

  @override
  String get calibrationHint =>
      'কম্পাসের নির্ভুলতা বাড়াতে ফোনটি ৮ আকৃতিতে নাড়ান।';

  @override
  String get qiblahAccuracyDisclaimer =>
      'Qiblah direction is approximate. Accuracy depends on your device compass, location, and magnetic interference. Calibrate your phone and verify with a physical compass when precision matters.';

  @override
  String get facingQiblah => 'কিবলামুখী';

  @override
  String rotateLeft(int degrees) {
    return 'বামে $degrees° ঘোরান';
  }

  @override
  String rotateRight(int degrees) {
    return 'ডানে $degrees° ঘোরান';
  }

  @override
  String get prayerTimesTitle => 'নামাজের সময়';

  @override
  String get settings => 'সেটিংস';

  @override
  String get todaysSchedule => 'আজকের সময়সূচী';

  @override
  String get nextPrayer => 'পরবর্তী নামাজ';

  @override
  String get locationNotSet => 'অবস্থান নির্ধারিত নয়';

  @override
  String get failedToLoadPrayerTimes => 'নামাজের সময় লোড করা যায়নি';

  @override
  String get unableToCalculatePrayerTimes => 'নামাজের সময় গণনা করা যায়নি';

  @override
  String get selectCity => 'শহর নির্বাচন';

  @override
  String get searchCityHint => 'শহর বা দেশ অনুসন্ধান';

  @override
  String get calculationMethod => 'গণনা পদ্ধতি';

  @override
  String get calculationMethodSubtitle =>
      'আপনার স্থানীয় মসজিদের কর্তৃপক্ষের সাথে মিলিয়ে নিন';

  @override
  String get madhab => 'মাযহাব (আসরের সময়)';

  @override
  String get fineTune => 'সূক্ষ্ম সমন্বয় (মিনিট)';

  @override
  String get fineTuneSubtitle => 'স্থানীয় মসজিদের সময়সূচীর সাথে মিলিয়ে নিন';

  @override
  String get use24Hour => '২৪-ঘণ্টার সময় ফরম্যাট';

  @override
  String get notifications => 'বিজ্ঞপ্তি';

  @override
  String get refreshGps => 'GPS অবস্থান রিফ্রেশ';

  @override
  String get language => 'ভাষা';

  @override
  String get languageSubtitle => 'অ্যাপের প্রদর্শন ভাষা নির্বাচন করুন';

  @override
  String get methodMuslimWorldLeague => 'মুসলিম ওয়ার্ল্ড লীগ';

  @override
  String get methodIsna => 'ISNA';

  @override
  String get methodUmmAlQura => 'উম্মুল কুরা';

  @override
  String get methodEgyptian => 'মিশরীয় সাধারণ কর্তৃপক্ষ';

  @override
  String get methodKarachi => 'করাচি বিশ্ববিদ্যালয়';

  @override
  String get madhabShafi => 'শাফিঈ';

  @override
  String get madhabHanafi => 'হানাফি';

  @override
  String get prayerFajr => 'ফজর';

  @override
  String get prayerSunrise => 'সূর্যোদয়';

  @override
  String get prayerDhuhr => 'যোহর';

  @override
  String get prayerAsr => 'আসর';

  @override
  String get prayerMaghrib => 'মাগরিব';

  @override
  String get prayerIsha => 'এশা';

  @override
  String get azkarTitle => 'আযকার';

  @override
  String get tasbih => 'তাসবিহ';

  @override
  String get categoryMorning => 'সকাল';

  @override
  String get categoryEvening => 'সন্ধ্যা';

  @override
  String get categoryPostPrayer => 'নামাজের পর';

  @override
  String get morningDescription => 'ফজরের পর সকালের আযকার — হিসনুল মুসলিম';

  @override
  String get eveningDescription => 'আসরের পর সন্ধ্যার আযকার — হিসনুল মুসলিম';

  @override
  String get postPrayerDescription => 'প্রতিটি ফরজ নামাজের পর যিকির';

  @override
  String get tapToCount => 'পুনরাবৃত্তি গণনার জন্য কার্ডে ট্যাপ করুন';

  @override
  String get referenceQuran => 'কুরআন';

  @override
  String get referenceHadith => 'হাদিস';

  @override
  String get referenceAthar => 'আছার';

  @override
  String get narrator => 'বর্ণনাকারী';

  @override
  String get grade => 'মান';

  @override
  String hisnNumber(int number) {
    return 'হিসন #$number';
  }

  @override
  String get tasbihTitle => 'তাসবিহ কাউন্টার';

  @override
  String get tapToCountTasbih => 'গণনার জন্য যেকোনো জায়গায় ট্যাপ করুন';

  @override
  String get tasbihMilestones => '৩৩ ও ১০০-এ মাইলফলক';

  @override
  String get resetCounterTitle => 'কাউন্টার রিসেট করবেন?';

  @override
  String get resetCounterMessage =>
      'এটি আপনার বর্তমান তাসবিহ সেশনের গণনা মুছে ফেলবে।';

  @override
  String get notificationPrayerTitle => 'নামাজের সময়';

  @override
  String notificationPrayerBody(String prayer) {
    return '$prayer-এর সময় হয়েছে';
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
