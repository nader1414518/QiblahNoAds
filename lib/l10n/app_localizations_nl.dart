// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appTitle => 'Al-Qiblah & Gebedsmetgezel';

  @override
  String get navQiblah => 'Qiblah';

  @override
  String get navPrayerTimes => 'Gebedstijden';

  @override
  String get navAzkar => 'Azkar';

  @override
  String get close => 'Sluiten';

  @override
  String get cancel => 'Annuleren';

  @override
  String get reset => 'Resetten';

  @override
  String get retry => 'Opnieuw proberen';

  @override
  String get done => 'Klaar';

  @override
  String get showMore => 'Meer tonen';

  @override
  String get showLess => 'Minder tonen';

  @override
  String get qiblahTitle => 'Qiblah';

  @override
  String get useCurrentLocation => 'Huidige locatie gebruiken';

  @override
  String get changeCity => 'Stad wijzigen';

  @override
  String get currentLocationSaved => 'Huidige locatie opgeslagen';

  @override
  String get unableToGetGps =>
      'GPS kon niet worden opgehaald. Probeer een stad te selecteren.';

  @override
  String get locationStatusUnavailable =>
      'Locatiestatus kon niet worden gelezen';

  @override
  String get locationEnableServices => 'Schakel locatieservices in';

  @override
  String get locationEnableOrSelectCity =>
      'Schakel locatieservices in of selecteer een stad';

  @override
  String get locationUnavailableSelectCity =>
      'Locatie niet beschikbaar. Selecteer een stad of geef toestemming.';

  @override
  String get locationPermissionDenied =>
      'Locatietoestemming geweigerd. Selecteer een stad of geef toestemming.';

  @override
  String get locationPermissionDeniedForever =>
      'Locatietoestemming permanent geweigerd. Selecteer een stad in instellingen.';

  @override
  String get locationUnavailable => 'Locatie niet beschikbaar';

  @override
  String get sensorUnavailable =>
      'Dit apparaat heeft geen kompassignaal. Qiblah-richting kan niet worden getoond.';

  @override
  String get compassUnavailable =>
      'Kompasgegevens niet beschikbaar. Probeer een fysiek apparaat, stel een emulatorlocatie in of selecteer handmatig een stad.';

  @override
  String get calibrationHint =>
      'Beweeg je telefoon in een 8-vorm om de kompasnauwkeurigheid te verbeteren.';

  @override
  String get qiblahAccuracyDisclaimer =>
      'Qiblah direction is approximate. Accuracy depends on your device compass, location, and magnetic interference. Calibrate your phone and verify with a physical compass when precision matters.';

  @override
  String get facingQiblah => 'Gericht op de Qiblah';

  @override
  String rotateLeft(int degrees) {
    return 'Draai $degrees° naar links';
  }

  @override
  String rotateRight(int degrees) {
    return 'Draai $degrees° naar rechts';
  }

  @override
  String get prayerTimesTitle => 'Gebedstijden';

  @override
  String get settings => 'Instellingen';

  @override
  String get todaysSchedule => 'Schema van vandaag';

  @override
  String get nextPrayer => 'Volgend gebed';

  @override
  String get locationNotSet => 'Locatie niet ingesteld';

  @override
  String get failedToLoadPrayerTimes => 'Gebedstijden laden mislukt';

  @override
  String get unableToCalculatePrayerTimes =>
      'Gebedstijden konden niet worden berekend';

  @override
  String get selectCity => 'Stad selecteren';

  @override
  String get searchCityHint => 'Zoek stad of land';

  @override
  String get calculationMethod => 'Berekeningsmethode';

  @override
  String get calculationMethodSubtitle => 'Stem af op je lokale moskee';

  @override
  String get madhab => 'Madhab (Asr-tijd)';

  @override
  String get fineTune => 'Fijnafstelling (minuten)';

  @override
  String get fineTuneSubtitle => 'Pas aan op het rooster van je lokale moskee';

  @override
  String get use24Hour => '24-uurs tijdformaat';

  @override
  String get notifications => 'Meldingen';

  @override
  String get refreshGps => 'GPS-locatie vernieuwen';

  @override
  String get language => 'Taal';

  @override
  String get languageSubtitle => 'Kies de weergavetaal van de app';

  @override
  String get methodMuslimWorldLeague => 'Muslim World League';

  @override
  String get methodIsna => 'ISNA';

  @override
  String get methodUmmAlQura => 'Umm al-Qura';

  @override
  String get methodEgyptian => 'Egyptische Algemene Autoriteit';

  @override
  String get methodKarachi => 'Universiteit van Karachi';

  @override
  String get madhabShafi => 'Shafi\'i';

  @override
  String get madhabHanafi => 'Hanafi';

  @override
  String get prayerFajr => 'Fajr';

  @override
  String get prayerSunrise => 'Zonsopgang';

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
  String get categoryMorning => 'Ochtend';

  @override
  String get categoryEvening => 'Avond';

  @override
  String get categoryPostPrayer => 'Na het gebed';

  @override
  String get morningDescription =>
      'Ochtendherinnering na Fajr — Hisn al-Muslim';

  @override
  String get eveningDescription => 'Avondherinnering na Asr — Hisn al-Muslim';

  @override
  String get postPrayerDescription => 'Dhikr na elk verplicht gebed';

  @override
  String get tapToCount => 'Tik op de kaart om herhalingen te tellen';

  @override
  String get referenceQuran => 'Koran';

  @override
  String get referenceHadith => 'Hadith';

  @override
  String get referenceAthar => 'Athar';

  @override
  String get narrator => 'Overleveraar';

  @override
  String get grade => 'Graad';

  @override
  String hisnNumber(int number) {
    return 'Hisn #$number';
  }

  @override
  String get tasbihTitle => 'Tasbih-teller';

  @override
  String get tapToCountTasbih => 'Tik ergens om te tellen';

  @override
  String get tasbihMilestones => 'Mijlpalen bij 33 en 100';

  @override
  String get resetCounterTitle => 'Teller resetten?';

  @override
  String get resetCounterMessage =>
      'Dit wist het aantal van je huidige Tasbih-sessie.';

  @override
  String get notificationPrayerTitle => 'Gebedstijd';

  @override
  String notificationPrayerBody(String prayer) {
    return 'Het is tijd voor $prayer';
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
