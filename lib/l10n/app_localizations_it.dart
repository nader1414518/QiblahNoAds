// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Al-Qiblah e Compagno di Preghiera';

  @override
  String get navQiblah => 'Qiblah';

  @override
  String get navPrayerTimes => 'Orari di preghiera';

  @override
  String get navAzkar => 'Azkar';

  @override
  String get close => 'Chiudi';

  @override
  String get cancel => 'Annulla';

  @override
  String get reset => 'Reimposta';

  @override
  String get retry => 'Riprova';

  @override
  String get done => 'Fatto';

  @override
  String get showMore => 'Mostra di più';

  @override
  String get showLess => 'Mostra di meno';

  @override
  String get qiblahTitle => 'Qiblah';

  @override
  String get useCurrentLocation => 'Usa posizione attuale';

  @override
  String get changeCity => 'Cambia città';

  @override
  String get currentLocationSaved => 'Posizione attuale salvata';

  @override
  String get unableToGetGps =>
      'Impossibile ottenere il GPS. Prova a selezionare una città.';

  @override
  String get locationStatusUnavailable =>
      'Impossibile leggere lo stato della posizione';

  @override
  String get locationEnableServices => 'Attiva i servizi di localizzazione';

  @override
  String get locationEnableOrSelectCity =>
      'Attiva i servizi di localizzazione o seleziona una città';

  @override
  String get locationUnavailableSelectCity =>
      'Posizione non disponibile. Seleziona una città o concedi il permesso.';

  @override
  String get locationPermissionDenied =>
      'Permesso di localizzazione negato. Seleziona una città o concedi il permesso.';

  @override
  String get locationPermissionDeniedForever =>
      'Permesso di localizzazione negato permanentemente. Seleziona una città nelle impostazioni.';

  @override
  String get locationUnavailable => 'Posizione non disponibile';

  @override
  String get sensorUnavailable =>
      'Questo dispositivo non ha un sensore bussola. La direzione della Qiblah non può essere mostrata.';

  @override
  String get compassUnavailable =>
      'Dati bussola non disponibili. Prova un dispositivo fisico, imposta la posizione dell\'emulatore o seleziona una città manualmente.';

  @override
  String get calibrationHint =>
      'Muovi il telefono a forma di 8 per migliorare la precisione della bussola.';

  @override
  String get qiblahAccuracyDisclaimer =>
      'Qiblah direction is approximate. Accuracy depends on your device compass, location, and magnetic interference. Calibrate your phone and verify with a physical compass when precision matters.';

  @override
  String get facingQiblah => 'Rivolto verso la Qiblah';

  @override
  String rotateLeft(int degrees) {
    return 'Ruota a sinistra di $degrees°';
  }

  @override
  String rotateRight(int degrees) {
    return 'Ruota a destra di $degrees°';
  }

  @override
  String get prayerTimesTitle => 'Orari di preghiera';

  @override
  String get settings => 'Impostazioni';

  @override
  String get todaysSchedule => 'Programma di oggi';

  @override
  String get nextPrayer => 'Prossima preghiera';

  @override
  String get locationNotSet => 'Posizione non impostata';

  @override
  String get failedToLoadPrayerTimes =>
      'Impossibile caricare gli orari di preghiera';

  @override
  String get unableToCalculatePrayerTimes =>
      'Impossibile calcolare gli orari di preghiera';

  @override
  String get selectCity => 'Seleziona città';

  @override
  String get searchCityHint => 'Cerca città o paese';

  @override
  String get calculationMethod => 'Metodo di calcolo';

  @override
  String get calculationMethodSubtitle =>
      'Allinea con l\'autorità della tua moschea locale';

  @override
  String get madhab => 'Madhab (orario dell\'Asr)';

  @override
  String get fineTune => 'Regolazione fine (minuti)';

  @override
  String get fineTuneSubtitle =>
      'Regola per corrispondere all\'orario della tua moschea locale';

  @override
  String get use24Hour => 'Formato orario 24 ore';

  @override
  String get notifications => 'Notifiche';

  @override
  String get refreshGps => 'Aggiorna posizione GPS';

  @override
  String get language => 'Lingua';

  @override
  String get languageSubtitle => 'Scegli la lingua dell\'app';

  @override
  String get methodMuslimWorldLeague => 'Lega Musulmana Mondiale';

  @override
  String get methodIsna => 'ISNA';

  @override
  String get methodUmmAlQura => 'Umm al-Qura';

  @override
  String get methodEgyptian => 'Autorità Generale Egiziana';

  @override
  String get methodKarachi => 'Università di Karachi';

  @override
  String get madhabShafi => 'Shafi\'i';

  @override
  String get madhabHanafi => 'Hanafi';

  @override
  String get prayerFajr => 'Fajr';

  @override
  String get prayerSunrise => 'Alba';

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
  String get categoryMorning => 'Mattina';

  @override
  String get categoryEvening => 'Sera';

  @override
  String get categoryPostPrayer => 'Dopo la preghiera';

  @override
  String get morningDescription =>
      'Invocazioni mattutine dopo il Fajr — Hisn al-Muslim';

  @override
  String get eveningDescription =>
      'Invocazioni serali dopo l\'Asr — Hisn al-Muslim';

  @override
  String get postPrayerDescription => 'Dhikr dopo ogni preghiera obbligatoria';

  @override
  String get tapToCount => 'Tocca la scheda per contare le ripetizioni';

  @override
  String get referenceQuran => 'Corano';

  @override
  String get referenceHadith => 'Hadith';

  @override
  String get referenceAthar => 'Athar';

  @override
  String get narrator => 'Narratore';

  @override
  String get grade => 'Grado';

  @override
  String hisnNumber(int number) {
    return 'Hisn n. $number';
  }

  @override
  String get tasbihTitle => 'Contatore Tasbih';

  @override
  String get tapToCountTasbih => 'Tocca ovunque per contare';

  @override
  String get tasbihMilestones => 'Traguardi a 33 e 100';

  @override
  String get resetCounterTitle => 'Reimpostare il contatore?';

  @override
  String get resetCounterMessage =>
      'Questo cancellerà il conteggio della sessione Tasbih corrente.';

  @override
  String get notificationPrayerTitle => 'Orario di preghiera';

  @override
  String notificationPrayerBody(String prayer) {
    return 'È ora di $prayer';
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
