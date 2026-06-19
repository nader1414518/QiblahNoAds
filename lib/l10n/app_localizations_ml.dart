// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malayalam (`ml`).
class AppLocalizationsMl extends AppLocalizations {
  AppLocalizationsMl([String locale = 'ml']) : super(locale);

  @override
  String get appTitle => 'അൽ-ഖിബ്ല & പ്രാർത്ഥന സഹായി';

  @override
  String get navQiblah => 'ഖിബ്ല';

  @override
  String get navPrayerTimes => 'നമസ്കാര സമയങ്ങൾ';

  @override
  String get navAzkar => 'അസ്കാർ';

  @override
  String get close => 'അടയ്ക്കുക';

  @override
  String get cancel => 'റദ്ദാക്കുക';

  @override
  String get reset => 'റീസെറ്റ്';

  @override
  String get retry => 'വീണ്ടും ശ്രമിക്കുക';

  @override
  String get done => 'പൂർത്തിയായി';

  @override
  String get showMore => 'കൂടുതൽ കാണിക്കുക';

  @override
  String get showLess => 'കുറച്ച് കാണിക്കുക';

  @override
  String get qiblahTitle => 'ഖിബ്ല';

  @override
  String get useCurrentLocation => 'നിലവിലെ സ്ഥലം ഉപയോഗിക്കുക';

  @override
  String get changeCity => 'നഗരം മാറ്റുക';

  @override
  String get currentLocationSaved => 'നിലവിലെ സ്ഥലം സേവ് ചെയ്തു';

  @override
  String get unableToGetGps => 'GPS ലഭ്യമല്ല. നഗരം തിരഞ്ഞെടുക്കാൻ ശ്രമിക്കുക.';

  @override
  String get locationStatusUnavailable => 'സ്ഥല സ്ഥിതി വായിക്കാൻ കഴിഞ്ഞില്ല';

  @override
  String get locationEnableServices => 'ലൊക്കേഷൻ സേവനങ്ങൾ പ്രവർത്തിപ്പിക്കുക';

  @override
  String get locationEnableOrSelectCity =>
      'ലൊക്കേഷൻ സേവനങ്ങൾ പ്രവർത്തിപ്പിക്കുക അല്ലെങ്കിൽ നഗരം തിരഞ്ഞെടുക്കുക';

  @override
  String get locationUnavailableSelectCity =>
      'സ്ഥലം ലഭ്യമല്ല. നഗരം തിരഞ്ഞെടുക്കുക അല്ലെങ്കിൽ അനുമതി നൽകുക.';

  @override
  String get locationPermissionDenied =>
      'ലൊക്കേഷൻ അനുമതി നിഷേധിച്ചു. നഗരം തിരഞ്ഞെടുക്കുക അല്ലെങ്കിൽ അനുമതി നൽകുക.';

  @override
  String get locationPermissionDeniedForever =>
      'ലൊക്കേഷൻ അനുമതി സ്ഥിരമായി നിഷേധിച്ചു. ക്രമീകരണങ്ങളിൽ നഗരം തിരഞ്ഞെടുക്കുക.';

  @override
  String get locationUnavailable => 'സ്ഥലം ലഭ്യമല്ല';

  @override
  String get sensorUnavailable =>
      'ഈ ഉപകരണത്തിൽ കോംപാസ് സെൻസർ ഇല്ല. ഖിബ്ല ദിശ കാണിക്കാൻ കഴിയില്ല.';

  @override
  String get compassUnavailable =>
      'കോംപാസ് ഡാറ്റ ലഭ്യമല്ല. യഥാർത്ഥ ഉപകരണം പരീക്ഷിക്കുക, എമുലേറ്റർ സ്ഥലം സജ്ജമാക്കുക, അല്ലെങ്കിൽ നഗരം സ്വമേധയാ തിരഞ്ഞെടുക്കുക.';

  @override
  String get calibrationHint =>
      'കോംപാസ് കൃത്യത മെച്ചപ്പെടുത്താൻ ഫോൺ 8 ആകൃതിയിൽ ചലിപ്പിക്കുക.';

  @override
  String get facingQiblah => 'ഖിബ്ലയിലേക്ക്';

  @override
  String rotateLeft(int degrees) {
    return 'ഇടത്തോട്ട് $degrees° തിരിക്കുക';
  }

  @override
  String rotateRight(int degrees) {
    return 'വലത്തോട്ട് $degrees° തിരിക്കുക';
  }

  @override
  String get prayerTimesTitle => 'നമസ്കാര സമയങ്ങൾ';

  @override
  String get settings => 'ക്രമീകരണങ്ങൾ';

  @override
  String get todaysSchedule => 'ഇന്നത്തെ ഷെഡ്യൂൾ';

  @override
  String get nextPrayer => 'അടുത്ത നമസ്കാരം';

  @override
  String get locationNotSet => 'സ്ഥലം സജ്ജമാക്കിയിട്ടില്ല';

  @override
  String get failedToLoadPrayerTimes =>
      'നമസ്കാര സമയങ്ങൾ ലോഡ് ചെയ്യുന്നതിൽ പരാജയപ്പെട്ടു';

  @override
  String get unableToCalculatePrayerTimes =>
      'നമസ്കാര സമയങ്ങൾ കണക്കാക്കാൻ കഴിഞ്ഞില്ല';

  @override
  String get selectCity => 'നഗരം തിരഞ്ഞെടുക്കുക';

  @override
  String get searchCityHint => 'നഗരം അല്ലെങ്കിൽ രാജ്യം തിരയുക';

  @override
  String get calculationMethod => 'കണക്കുകൂട്ടൽ രീതി';

  @override
  String get calculationMethodSubtitle =>
      'നിങ്ങളുടെ പ്രാദേശിക മസ്ജിദ് അധികാരവുമായി പൊരുത്തപ്പെടുത്തുക';

  @override
  String get madhab => 'മദ്ഹബ് (അസർ സമയം)';

  @override
  String get fineTune => 'നേർത്ത ക്രമീകരണം (മിനിറ്റുകൾ)';

  @override
  String get fineTuneSubtitle =>
      'പ്രാദേശിക മസ്ജിദ് ടൈംടേബിളുമായി പൊരുത്തപ്പെടുത്തുക';

  @override
  String get use24Hour => '24-മണിക്കൂർ സമയ ഫോർമാറ്റ്';

  @override
  String get notifications => 'അറിയിപ്പുകൾ';

  @override
  String get refreshGps => 'GPS സ്ഥലം പുതുക്കുക';

  @override
  String get language => 'ഭാഷ';

  @override
  String get languageSubtitle => 'ആപ്പ് പ്രദർശന ഭാഷ തിരഞ്ഞെടുക്കുക';

  @override
  String get methodMuslimWorldLeague => 'മുസ്ലിം വേൾഡ് ലീഗ്';

  @override
  String get methodIsna => 'ISNA';

  @override
  String get methodUmmAlQura => 'ഉം അൽ-ഖുറാ';

  @override
  String get methodEgyptian => 'ഈജിപ്ഷ്യൻ പൊതു അധികാരം';

  @override
  String get methodKarachi => 'കറാച്ചി സർവകലാശാല';

  @override
  String get madhabShafi => 'ഷാഫിഈ';

  @override
  String get madhabHanafi => 'ഹനഫി';

  @override
  String get prayerFajr => 'ഫജ്ർ';

  @override
  String get prayerSunrise => 'സൂര്യോദയം';

  @override
  String get prayerDhuhr => 'ദുഹ്ർ';

  @override
  String get prayerAsr => 'അസർ';

  @override
  String get prayerMaghrib => 'മഗ്‌രിബ്';

  @override
  String get prayerIsha => 'ഇശാ';

  @override
  String get azkarTitle => 'അസ്കാർ';

  @override
  String get tasbih => 'തസ്ബീഹ്';

  @override
  String get categoryMorning => 'രാവിലെ';

  @override
  String get categoryEvening => 'വൈകുന്നേരം';

  @override
  String get categoryPostPrayer => 'നമസ്കാരത്തിന് ശേഷം';

  @override
  String get morningDescription =>
      'ഫജ്‌റിന് ശേഷം രാവിലെ ഓർമ്മ — ഹിസ്ൻ അൽ-മുസ്ലിം';

  @override
  String get eveningDescription =>
      'അസറിന് ശേഷം വൈകുന്നേരം ഓർമ്മ — ഹിസ്ൻ അൽ-മുസ്ലിം';

  @override
  String get postPrayerDescription => 'ഓരോ നിർബന്ധിത നമസ്കാരത്തിനും ശേഷം ദിക്ർ';

  @override
  String get tapToCount => 'ആവർത്തനങ്ങൾ എണ്ണാൻ കാർഡിൽ ടാപ്പ് ചെയ്യുക';

  @override
  String get referenceQuran => 'ഖുർആൻ';

  @override
  String get referenceHadith => 'ഹദീസ്';

  @override
  String get referenceAthar => 'അഥർ';

  @override
  String get narrator => 'വിവരണക്കാരൻ';

  @override
  String get grade => 'ഗ്രേഡ്';

  @override
  String hisnNumber(int number) {
    return 'ഹിസ്ൻ #$number';
  }

  @override
  String get tasbihTitle => 'തസ്ബീഹ് കൗണ്ടർ';

  @override
  String get tapToCountTasbih => 'എണ്ണാൻ എവിടെയും ടാപ്പ് ചെയ്യുക';

  @override
  String get tasbihMilestones => '33-ലും 100-ലും നാഴികക്കല്ലുകൾ';

  @override
  String get resetCounterTitle => 'കൗണ്ടർ റീസെറ്റ് ചെയ്യണോ?';

  @override
  String get resetCounterMessage =>
      'ഇത് നിങ്ങളുടെ നിലവിലെ തസ്ബീഹ് സെഷൻ എണ്ണം മായ്ക്കും.';

  @override
  String get notificationPrayerTitle => 'നമസ്കാര സമയം';

  @override
  String notificationPrayerBody(String prayer) {
    return '$prayer സമയമായി';
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
