import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_id.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_ur.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bn'),
    Locale('de'),
    Locale('en'),
    Locale('fr'),
    Locale('id'),
    Locale('tr'),
    Locale('ur'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Al-Qiblah & Prayer Companion'**
  String get appTitle;

  /// No description provided for @navQiblah.
  ///
  /// In en, this message translates to:
  /// **'Qiblah'**
  String get navQiblah;

  /// No description provided for @navPrayerTimes.
  ///
  /// In en, this message translates to:
  /// **'Prayer Times'**
  String get navPrayerTimes;

  /// No description provided for @navAzkar.
  ///
  /// In en, this message translates to:
  /// **'Azkar'**
  String get navAzkar;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @showMore.
  ///
  /// In en, this message translates to:
  /// **'Show more'**
  String get showMore;

  /// No description provided for @showLess.
  ///
  /// In en, this message translates to:
  /// **'Show less'**
  String get showLess;

  /// No description provided for @qiblahTitle.
  ///
  /// In en, this message translates to:
  /// **'Qiblah'**
  String get qiblahTitle;

  /// No description provided for @useCurrentLocation.
  ///
  /// In en, this message translates to:
  /// **'Use current location'**
  String get useCurrentLocation;

  /// No description provided for @changeCity.
  ///
  /// In en, this message translates to:
  /// **'Change city'**
  String get changeCity;

  /// No description provided for @currentLocationSaved.
  ///
  /// In en, this message translates to:
  /// **'Current location saved'**
  String get currentLocationSaved;

  /// No description provided for @unableToGetGps.
  ///
  /// In en, this message translates to:
  /// **'Unable to get GPS. Try selecting a city instead.'**
  String get unableToGetGps;

  /// No description provided for @locationStatusUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Unable to read location status'**
  String get locationStatusUnavailable;

  /// No description provided for @locationEnableServices.
  ///
  /// In en, this message translates to:
  /// **'Please enable location services'**
  String get locationEnableServices;

  /// No description provided for @locationEnableOrSelectCity.
  ///
  /// In en, this message translates to:
  /// **'Please enable location services or select a city'**
  String get locationEnableOrSelectCity;

  /// No description provided for @locationUnavailableSelectCity.
  ///
  /// In en, this message translates to:
  /// **'Location unavailable. Select a city or grant permission.'**
  String get locationUnavailableSelectCity;

  /// No description provided for @locationPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Location permission denied. Select a city or grant permission.'**
  String get locationPermissionDenied;

  /// No description provided for @locationPermissionDeniedForever.
  ///
  /// In en, this message translates to:
  /// **'Location permission permanently denied. Select a city in settings.'**
  String get locationPermissionDeniedForever;

  /// No description provided for @locationUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Location unavailable'**
  String get locationUnavailable;

  /// No description provided for @sensorUnavailable.
  ///
  /// In en, this message translates to:
  /// **'This device does not have a compass sensor. Qiblah direction cannot be shown.'**
  String get sensorUnavailable;

  /// No description provided for @compassUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Compass data is unavailable. Try a physical device, set an emulator location, or select a city manually.'**
  String get compassUnavailable;

  /// No description provided for @calibrationHint.
  ///
  /// In en, this message translates to:
  /// **'Move your phone in a figure-8 to improve compass accuracy.'**
  String get calibrationHint;

  /// No description provided for @facingQiblah.
  ///
  /// In en, this message translates to:
  /// **'Facing Qiblah'**
  String get facingQiblah;

  /// No description provided for @rotateLeft.
  ///
  /// In en, this message translates to:
  /// **'Rotate left {degrees}°'**
  String rotateLeft(int degrees);

  /// No description provided for @rotateRight.
  ///
  /// In en, this message translates to:
  /// **'Rotate right {degrees}°'**
  String rotateRight(int degrees);

  /// No description provided for @prayerTimesTitle.
  ///
  /// In en, this message translates to:
  /// **'Prayer Times'**
  String get prayerTimesTitle;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @todaysSchedule.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Schedule'**
  String get todaysSchedule;

  /// No description provided for @nextPrayer.
  ///
  /// In en, this message translates to:
  /// **'Next Prayer'**
  String get nextPrayer;

  /// No description provided for @locationNotSet.
  ///
  /// In en, this message translates to:
  /// **'Location not set'**
  String get locationNotSet;

  /// No description provided for @failedToLoadPrayerTimes.
  ///
  /// In en, this message translates to:
  /// **'Failed to load prayer times'**
  String get failedToLoadPrayerTimes;

  /// No description provided for @unableToCalculatePrayerTimes.
  ///
  /// In en, this message translates to:
  /// **'Unable to calculate prayer times'**
  String get unableToCalculatePrayerTimes;

  /// No description provided for @selectCity.
  ///
  /// In en, this message translates to:
  /// **'Select City'**
  String get selectCity;

  /// No description provided for @searchCityHint.
  ///
  /// In en, this message translates to:
  /// **'Search city or country'**
  String get searchCityHint;

  /// No description provided for @calculationMethod.
  ///
  /// In en, this message translates to:
  /// **'Calculation Method'**
  String get calculationMethod;

  /// No description provided for @calculationMethodSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Match your local mosque authority'**
  String get calculationMethodSubtitle;

  /// No description provided for @madhab.
  ///
  /// In en, this message translates to:
  /// **'Madhab (Asr time)'**
  String get madhab;

  /// No description provided for @fineTune.
  ///
  /// In en, this message translates to:
  /// **'Fine-tune (minutes)'**
  String get fineTune;

  /// No description provided for @fineTuneSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Adjust to match your local mosque timetable'**
  String get fineTuneSubtitle;

  /// No description provided for @use24Hour.
  ///
  /// In en, this message translates to:
  /// **'24-hour time format'**
  String get use24Hour;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @refreshGps.
  ///
  /// In en, this message translates to:
  /// **'Refresh GPS location'**
  String get refreshGps;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @languageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose app display language'**
  String get languageSubtitle;

  /// No description provided for @methodMuslimWorldLeague.
  ///
  /// In en, this message translates to:
  /// **'Muslim World League'**
  String get methodMuslimWorldLeague;

  /// No description provided for @methodIsna.
  ///
  /// In en, this message translates to:
  /// **'ISNA'**
  String get methodIsna;

  /// No description provided for @methodUmmAlQura.
  ///
  /// In en, this message translates to:
  /// **'Umm al-Qura'**
  String get methodUmmAlQura;

  /// No description provided for @methodEgyptian.
  ///
  /// In en, this message translates to:
  /// **'Egyptian General Authority'**
  String get methodEgyptian;

  /// No description provided for @methodKarachi.
  ///
  /// In en, this message translates to:
  /// **'University of Karachi'**
  String get methodKarachi;

  /// No description provided for @madhabShafi.
  ///
  /// In en, this message translates to:
  /// **'Shafi'**
  String get madhabShafi;

  /// No description provided for @madhabHanafi.
  ///
  /// In en, this message translates to:
  /// **'Hanafi'**
  String get madhabHanafi;

  /// No description provided for @prayerFajr.
  ///
  /// In en, this message translates to:
  /// **'Fajr'**
  String get prayerFajr;

  /// No description provided for @prayerSunrise.
  ///
  /// In en, this message translates to:
  /// **'Sunrise'**
  String get prayerSunrise;

  /// No description provided for @prayerDhuhr.
  ///
  /// In en, this message translates to:
  /// **'Dhuhr'**
  String get prayerDhuhr;

  /// No description provided for @prayerAsr.
  ///
  /// In en, this message translates to:
  /// **'Asr'**
  String get prayerAsr;

  /// No description provided for @prayerMaghrib.
  ///
  /// In en, this message translates to:
  /// **'Maghrib'**
  String get prayerMaghrib;

  /// No description provided for @prayerIsha.
  ///
  /// In en, this message translates to:
  /// **'Isha'**
  String get prayerIsha;

  /// No description provided for @azkarTitle.
  ///
  /// In en, this message translates to:
  /// **'Azkar'**
  String get azkarTitle;

  /// No description provided for @tasbih.
  ///
  /// In en, this message translates to:
  /// **'Tasbih'**
  String get tasbih;

  /// No description provided for @categoryMorning.
  ///
  /// In en, this message translates to:
  /// **'Morning'**
  String get categoryMorning;

  /// No description provided for @categoryEvening.
  ///
  /// In en, this message translates to:
  /// **'Evening'**
  String get categoryEvening;

  /// No description provided for @categoryPostPrayer.
  ///
  /// In en, this message translates to:
  /// **'Post-Prayer'**
  String get categoryPostPrayer;

  /// No description provided for @morningDescription.
  ///
  /// In en, this message translates to:
  /// **'Morning remembrance after Fajr — Hisn al-Muslim'**
  String get morningDescription;

  /// No description provided for @eveningDescription.
  ///
  /// In en, this message translates to:
  /// **'Evening remembrance after Asr — Hisn al-Muslim'**
  String get eveningDescription;

  /// No description provided for @postPrayerDescription.
  ///
  /// In en, this message translates to:
  /// **'Dhikr after every obligatory prayer'**
  String get postPrayerDescription;

  /// No description provided for @tapToCount.
  ///
  /// In en, this message translates to:
  /// **'Tap card to count repetitions'**
  String get tapToCount;

  /// No description provided for @referenceQuran.
  ///
  /// In en, this message translates to:
  /// **'Quran'**
  String get referenceQuran;

  /// No description provided for @referenceHadith.
  ///
  /// In en, this message translates to:
  /// **'Hadith'**
  String get referenceHadith;

  /// No description provided for @referenceAthar.
  ///
  /// In en, this message translates to:
  /// **'Athar'**
  String get referenceAthar;

  /// No description provided for @narrator.
  ///
  /// In en, this message translates to:
  /// **'Narrator'**
  String get narrator;

  /// No description provided for @grade.
  ///
  /// In en, this message translates to:
  /// **'Grade'**
  String get grade;

  /// No description provided for @hisnNumber.
  ///
  /// In en, this message translates to:
  /// **'Hisn #{number}'**
  String hisnNumber(int number);

  /// No description provided for @tasbihTitle.
  ///
  /// In en, this message translates to:
  /// **'Tasbih Counter'**
  String get tasbihTitle;

  /// No description provided for @tapToCountTasbih.
  ///
  /// In en, this message translates to:
  /// **'Tap anywhere to count'**
  String get tapToCountTasbih;

  /// No description provided for @tasbihMilestones.
  ///
  /// In en, this message translates to:
  /// **'Milestones at 33 and 100'**
  String get tasbihMilestones;

  /// No description provided for @resetCounterTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset counter?'**
  String get resetCounterTitle;

  /// No description provided for @resetCounterMessage.
  ///
  /// In en, this message translates to:
  /// **'This will clear your current Tasbih session count.'**
  String get resetCounterMessage;

  /// No description provided for @notificationPrayerTitle.
  ///
  /// In en, this message translates to:
  /// **'Prayer Time'**
  String get notificationPrayerTitle;

  /// No description provided for @notificationPrayerBody.
  ///
  /// In en, this message translates to:
  /// **'It is time for {prayer}'**
  String notificationPrayerBody(String prayer);

  /// No description provided for @langEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get langEnglish;

  /// No description provided for @langArabic.
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get langArabic;

  /// No description provided for @langFrench.
  ///
  /// In en, this message translates to:
  /// **'Français'**
  String get langFrench;

  /// No description provided for @langUrdu.
  ///
  /// In en, this message translates to:
  /// **'اردو'**
  String get langUrdu;

  /// No description provided for @langTurkish.
  ///
  /// In en, this message translates to:
  /// **'Türkçe'**
  String get langTurkish;

  /// No description provided for @langIndonesian.
  ///
  /// In en, this message translates to:
  /// **'Bahasa Indonesia'**
  String get langIndonesian;

  /// No description provided for @langBengali.
  ///
  /// In en, this message translates to:
  /// **'বাংলা'**
  String get langBengali;

  /// No description provided for @langGerman.
  ///
  /// In en, this message translates to:
  /// **'Deutsch'**
  String get langGerman;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'bn',
    'de',
    'en',
    'fr',
    'id',
    'tr',
    'ur',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bn':
      return AppLocalizationsBn();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
    case 'id':
      return AppLocalizationsId();
    case 'tr':
      return AppLocalizationsTr();
    case 'ur':
      return AppLocalizationsUr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
