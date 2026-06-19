// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appTitle => 'அல்-கிப்லா & தொழுகை துணை';

  @override
  String get navQiblah => 'கிப்லா';

  @override
  String get navPrayerTimes => 'தொழுகை நேரங்கள்';

  @override
  String get navAzkar => 'அஸ்கார்';

  @override
  String get close => 'மூடு';

  @override
  String get cancel => 'ரத்து';

  @override
  String get reset => 'மீட்டமை';

  @override
  String get retry => 'மீண்டும் முயற்சி';

  @override
  String get done => 'முடிந்தது';

  @override
  String get showMore => 'மேலும் காட்டு';

  @override
  String get showLess => 'குறைவாக காட்டு';

  @override
  String get qiblahTitle => 'கிப்லா';

  @override
  String get useCurrentLocation => 'தற்போதைய இடத்தைப் பயன்படுத்து';

  @override
  String get changeCity => 'நகரத்தை மாற்று';

  @override
  String get currentLocationSaved => 'தற்போதைய இடம் சேமிக்கப்பட்டது';

  @override
  String get unableToGetGps =>
      'GPS பெற முடியவில்லை. நகரத்தைத் தேர்ந்தெடுக்க முயற்சிக்கவும்.';

  @override
  String get locationStatusUnavailable => 'இட நிலையைப் படிக்க முடியவில்லை';

  @override
  String get locationEnableServices => 'இடச் சேவைகளை இயக்கவும்';

  @override
  String get locationEnableOrSelectCity =>
      'இடச் சேவைகளை இயக்கவும் அல்லது நகரத்தைத் தேர்ந்தெடுக்கவும்';

  @override
  String get locationUnavailableSelectCity =>
      'இடம் கிடைக்கவில்லை. நகரத்தைத் தேர்ந்தெடுக்கவும் அல்லது அனுமதி வழங்கவும்.';

  @override
  String get locationPermissionDenied =>
      'இட அனுமதி மறுக்கப்பட்டது. நகரத்தைத் தேர்ந்தெடுக்கவும் அல்லது அனுமதி வழங்கவும்.';

  @override
  String get locationPermissionDeniedForever =>
      'இட அனுமதி நிரந்தரமாக மறுக்கப்பட்டது. அமைப்புகளில் நகரத்தைத் தேர்ந்தெடுக்கவும்.';

  @override
  String get locationUnavailable => 'இடம் கிடைக்கவில்லை';

  @override
  String get sensorUnavailable =>
      'இந்த சாதனத்தில் திசைகாட்டி சென்சார் இல்லை. கிப்லா திசையைக் காட்ட முடியாது.';

  @override
  String get compassUnavailable =>
      'திசைகாட்டி தரவு கிடைக்கவில்லை. உண்மையான சாதனத்தை முயற்சிக்கவும், எமுலேட்டர் இடத்தை அமைக்கவும், அல்லது நகரத்தை கைமுறையாகத் தேர்ந்தெடுக்கவும்.';

  @override
  String get calibrationHint =>
      'திசைகாட்டி துல்லியத்தை மேம்படுத்த ஃபோனை 8 வடிவில் அசைக்கவும்.';

  @override
  String get facingQiblah => 'கிப்லா நோக்கி';

  @override
  String rotateLeft(int degrees) {
    return 'இடதுபுறம் $degrees° திருப்பு';
  }

  @override
  String rotateRight(int degrees) {
    return 'வலதுபுறம் $degrees° திருப்பு';
  }

  @override
  String get prayerTimesTitle => 'தொழுகை நேரங்கள்';

  @override
  String get settings => 'அமைப்புகள்';

  @override
  String get todaysSchedule => 'இன்றைய அட்டவணை';

  @override
  String get nextPrayer => 'அடுத்த தொழுகை';

  @override
  String get locationNotSet => 'இடம் அமைக்கப்படவில்லை';

  @override
  String get failedToLoadPrayerTimes => 'தொழுகை நேரங்களை ஏற்ற முடியவில்லை';

  @override
  String get unableToCalculatePrayerTimes =>
      'தொழுகை நேரங்களைக் கணக்கிட முடியவில்லை';

  @override
  String get selectCity => 'நகரத்தைத் தேர்ந்தெடு';

  @override
  String get searchCityHint => 'நகரம் அல்லது நாட்டைத் தேடு';

  @override
  String get calculationMethod => 'கணக்கீட்டு முறை';

  @override
  String get calculationMethodSubtitle =>
      'உங்கள் உள்ளூர் மஸ்ஜித் அதிகாரத்துடன் பொருந்தவும்';

  @override
  String get madhab => 'மத்ஹப் (அஸர் நேரம்)';

  @override
  String get fineTune => 'நுணுக்கமான சரிசெய்தல் (நிமிடங்கள்)';

  @override
  String get fineTuneSubtitle => 'உள்ளூர் மஸ்ஜித் அட்டவணையுடன் பொருத்தவும்';

  @override
  String get use24Hour => '24-மணி நேர வடிவம்';

  @override
  String get notifications => 'அறிவிப்புகள்';

  @override
  String get refreshGps => 'GPS இடத்தைப் புதுப்பி';

  @override
  String get language => 'மொழி';

  @override
  String get languageSubtitle => 'பயன்பாட்டு மொழியைத் தேர்ந்தெடுக்கவும்';

  @override
  String get methodMuslimWorldLeague => 'முஸ்லிம் உலக லீக்';

  @override
  String get methodIsna => 'ISNA';

  @override
  String get methodUmmAlQura => 'உம் அல்-குரா';

  @override
  String get methodEgyptian => 'எகிப்து பொது அதிகாரம்';

  @override
  String get methodKarachi => 'கராச்சி பல்கலைக்கழகம்';

  @override
  String get madhabShafi => 'ஷாஃபி';

  @override
  String get madhabHanafi => 'ஹனஃபி';

  @override
  String get prayerFajr => 'ஃபஜ்ர்';

  @override
  String get prayerSunrise => 'சூரிய உதயம்';

  @override
  String get prayerDhuhr => 'துஹர்';

  @override
  String get prayerAsr => 'அஸர்';

  @override
  String get prayerMaghrib => 'மக்ரிப்';

  @override
  String get prayerIsha => 'இஷா';

  @override
  String get azkarTitle => 'அஸ்கார்';

  @override
  String get tasbih => 'தஸ்பீஹ்';

  @override
  String get categoryMorning => 'காலை';

  @override
  String get categoryEvening => 'மாலை';

  @override
  String get categoryPostPrayer => 'தொழுகைக்குப் பின்';

  @override
  String get morningDescription =>
      'ஃபஜ்ருக்குப் பின் காலை நினைவூட்டல் — ஹிஸ்ன் அல்-முஸ்லிம்';

  @override
  String get eveningDescription =>
      'அஸருக்குப் பின் மாலை நினைவூட்டல் — ஹிஸ்ன் அல்-முஸ்லிம்';

  @override
  String get postPrayerDescription =>
      'ஒவ்வொரு கடமையான தொழுகைக்கும் பின் திக்ர்';

  @override
  String get tapToCount => 'மறுபடியை எண்ண அட்டையைத் தட்டவும்';

  @override
  String get referenceQuran => 'குர்ஆன்';

  @override
  String get referenceHadith => 'ஹதீஸ்';

  @override
  String get referenceAthar => 'அதர்';

  @override
  String get narrator => 'விவரிப்பாளர்';

  @override
  String get grade => 'தரம்';

  @override
  String hisnNumber(int number) {
    return 'ஹிஸ்ன் #$number';
  }

  @override
  String get tasbihTitle => 'தஸ்பீஹ் எண்ணி';

  @override
  String get tapToCountTasbih => 'எண்ண எங்கும் தட்டவும்';

  @override
  String get tasbihMilestones => '33 மற்றும் 100 இல் மைல்கற்கள்';

  @override
  String get resetCounterTitle => 'எண்ணியை மீட்டமை?';

  @override
  String get resetCounterMessage =>
      'இது உங்கள் தற்போதைய தஸ்பீஹ் அமர்வு எண்ணை அழிக்கும்.';

  @override
  String get notificationPrayerTitle => 'தொழுகை நேரம்';

  @override
  String notificationPrayerBody(String prayer) {
    return '$prayer நேரமாகிவிட்டது';
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
