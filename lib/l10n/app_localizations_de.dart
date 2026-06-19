// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Al-Qiblah & Gebetsbegleiter';

  @override
  String get navQiblah => 'Qibla';

  @override
  String get navPrayerTimes => 'Gebetszeiten';

  @override
  String get navAzkar => 'Azkar';

  @override
  String get close => 'Schließen';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get reset => 'Zurücksetzen';

  @override
  String get retry => 'Erneut versuchen';

  @override
  String get done => 'Fertig';

  @override
  String get showMore => 'Mehr anzeigen';

  @override
  String get showLess => 'Weniger anzeigen';

  @override
  String get qiblahTitle => 'Qibla';

  @override
  String get useCurrentLocation => 'Aktuellen Standort verwenden';

  @override
  String get changeCity => 'Stadt ändern';

  @override
  String get currentLocationSaved => 'Aktueller Standort gespeichert';

  @override
  String get unableToGetGps =>
      'GPS konnte nicht abgerufen werden. Versuchen Sie stattdessen, eine Stadt auszuwählen.';

  @override
  String get locationStatusUnavailable =>
      'Standortstatus konnte nicht gelesen werden';

  @override
  String get locationEnableServices =>
      'Bitte aktivieren Sie die Standortdienste';

  @override
  String get locationEnableOrSelectCity =>
      'Bitte aktivieren Sie die Standortdienste oder wählen Sie eine Stadt';

  @override
  String get locationUnavailableSelectCity =>
      'Standort nicht verfügbar. Wählen Sie eine Stadt oder erteilen Sie die Berechtigung.';

  @override
  String get locationPermissionDenied =>
      'Standortberechtigung verweigert. Wählen Sie eine Stadt oder erteilen Sie die Berechtigung.';

  @override
  String get locationPermissionDeniedForever =>
      'Standortberechtigung dauerhaft verweigert. Wählen Sie eine Stadt in den Einstellungen.';

  @override
  String get locationUnavailable => 'Standort nicht verfügbar';

  @override
  String get sensorUnavailable =>
      'Dieses Gerät hat keinen Kompasssensor. Die Qibla-Richtung kann nicht angezeigt werden.';

  @override
  String get compassUnavailable =>
      'Kompassdaten sind nicht verfügbar. Versuchen Sie ein physisches Gerät, setzen Sie einen Emulator-Standort oder wählen Sie manuell eine Stadt.';

  @override
  String get calibrationHint =>
      'Bewegen Sie Ihr Telefon in einer Acht, um die Kompassgenauigkeit zu verbessern.';

  @override
  String get facingQiblah => 'Qibla ausgerichtet';

  @override
  String rotateLeft(int degrees) {
    return 'Nach links $degrees° drehen';
  }

  @override
  String rotateRight(int degrees) {
    return 'Nach rechts $degrees° drehen';
  }

  @override
  String get prayerTimesTitle => 'Gebetszeiten';

  @override
  String get settings => 'Einstellungen';

  @override
  String get todaysSchedule => 'Heutiger Zeitplan';

  @override
  String get nextPrayer => 'Nächstes Gebet';

  @override
  String get locationNotSet => 'Standort nicht festgelegt';

  @override
  String get failedToLoadPrayerTimes =>
      'Gebetszeiten konnten nicht geladen werden';

  @override
  String get unableToCalculatePrayerTimes =>
      'Gebetszeiten konnten nicht berechnet werden';

  @override
  String get selectCity => 'Stadt auswählen';

  @override
  String get searchCityHint => 'Stadt oder Land suchen';

  @override
  String get calculationMethod => 'Berechnungsmethode';

  @override
  String get calculationMethodSubtitle =>
      'An die Autorität Ihrer lokalen Moschee anpassen';

  @override
  String get madhab => 'Madhab (Asr-Zeit)';

  @override
  String get fineTune => 'Feinabstimmung (Minuten)';

  @override
  String get fineTuneSubtitle =>
      'An den Zeitplan Ihrer lokalen Moschee anpassen';

  @override
  String get use24Hour => '24-Stunden-Zeitformat';

  @override
  String get notifications => 'Benachrichtigungen';

  @override
  String get refreshGps => 'GPS-Standort aktualisieren';

  @override
  String get language => 'Sprache';

  @override
  String get languageSubtitle => 'Anzeigesprache der App wählen';

  @override
  String get methodMuslimWorldLeague => 'Muslim World League';

  @override
  String get methodIsna => 'ISNA';

  @override
  String get methodUmmAlQura => 'Umm al-Qura';

  @override
  String get methodEgyptian => 'Ägyptische Generalbehörde';

  @override
  String get methodKarachi => 'Universität Karachi';

  @override
  String get madhabShafi => 'Schafiitisch';

  @override
  String get madhabHanafi => 'Hanafitisch';

  @override
  String get prayerFajr => 'Fajr';

  @override
  String get prayerSunrise => 'Sonnenaufgang';

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
  String get categoryMorning => 'Morgen';

  @override
  String get categoryEvening => 'Abend';

  @override
  String get categoryPostPrayer => 'Nach dem Gebet';

  @override
  String get morningDescription =>
      'Morgendliches Gedenken nach dem Fajr — Hisn al-Muslim';

  @override
  String get eveningDescription =>
      'Abendliches Gedenken nach dem Asr — Hisn al-Muslim';

  @override
  String get postPrayerDescription => 'Dhikr nach jedem Pflichtgebet';

  @override
  String get tapToCount => 'Auf die Karte tippen, um Wiederholungen zu zählen';

  @override
  String get referenceQuran => 'Koran';

  @override
  String get referenceHadith => 'Hadith';

  @override
  String get referenceAthar => 'Athar';

  @override
  String get narrator => 'Überlieferer';

  @override
  String get grade => 'Grad';

  @override
  String hisnNumber(int number) {
    return 'Hisn Nr. $number';
  }

  @override
  String get tasbihTitle => 'Tasbih-Zähler';

  @override
  String get tapToCountTasbih => 'Überall tippen zum Zählen';

  @override
  String get tasbihMilestones => 'Meilensteine bei 33 und 100';

  @override
  String get resetCounterTitle => 'Zähler zurücksetzen?';

  @override
  String get resetCounterMessage =>
      'Dies löscht die Anzahl Ihrer aktuellen Tasbih-Sitzung.';

  @override
  String get notificationPrayerTitle => 'Gebetszeit';

  @override
  String notificationPrayerBody(String prayer) {
    return 'Es ist Zeit für $prayer';
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
