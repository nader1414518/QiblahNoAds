// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Al-Qiblah et Compagnon de Prière';

  @override
  String get navQiblah => 'Qiblah';

  @override
  String get navPrayerTimes => 'Heures de prière';

  @override
  String get navAzkar => 'Azkar';

  @override
  String get close => 'Fermer';

  @override
  String get cancel => 'Annuler';

  @override
  String get reset => 'Réinitialiser';

  @override
  String get retry => 'Réessayer';

  @override
  String get done => 'Terminé';

  @override
  String get showMore => 'Afficher plus';

  @override
  String get showLess => 'Afficher moins';

  @override
  String get qiblahTitle => 'Qiblah';

  @override
  String get useCurrentLocation => 'Utiliser la position actuelle';

  @override
  String get changeCity => 'Changer de ville';

  @override
  String get currentLocationSaved => 'Position actuelle enregistrée';

  @override
  String get unableToGetGps =>
      'Impossible d\'obtenir le GPS. Essayez de sélectionner une ville.';

  @override
  String get locationStatusUnavailable =>
      'Impossible de lire l\'état de la localisation';

  @override
  String get locationEnableServices =>
      'Veuillez activer les services de localisation';

  @override
  String get locationEnableOrSelectCity =>
      'Veuillez activer les services de localisation ou sélectionner une ville';

  @override
  String get locationUnavailableSelectCity =>
      'Localisation indisponible. Sélectionnez une ville ou accordez l\'autorisation.';

  @override
  String get locationPermissionDenied =>
      'Autorisation de localisation refusée. Sélectionnez une ville ou accordez l\'autorisation.';

  @override
  String get locationPermissionDeniedForever =>
      'Autorisation de localisation refusée définitivement. Sélectionnez une ville dans les paramètres.';

  @override
  String get locationUnavailable => 'Localisation indisponible';

  @override
  String get sensorUnavailable =>
      'Cet appareil ne possède pas de capteur de boussole. La direction de la Qiblah ne peut pas être affichée.';

  @override
  String get compassUnavailable =>
      'Les données de la boussole sont indisponibles. Essayez un appareil physique, définissez une localisation sur l\'émulateur ou sélectionnez une ville manuellement.';

  @override
  String get calibrationHint =>
      'Déplacez votre téléphone en forme de 8 pour améliorer la précision de la boussole.';

  @override
  String get facingQiblah => 'Face à la Qiblah';

  @override
  String rotateLeft(int degrees) {
    return 'Tourner à gauche de $degrees°';
  }

  @override
  String rotateRight(int degrees) {
    return 'Tourner à droite de $degrees°';
  }

  @override
  String get prayerTimesTitle => 'Heures de prière';

  @override
  String get settings => 'Paramètres';

  @override
  String get todaysSchedule => 'Programme du jour';

  @override
  String get nextPrayer => 'Prochaine prière';

  @override
  String get locationNotSet => 'Localisation non définie';

  @override
  String get failedToLoadPrayerTimes =>
      'Échec du chargement des heures de prière';

  @override
  String get unableToCalculatePrayerTimes =>
      'Impossible de calculer les heures de prière';

  @override
  String get selectCity => 'Sélectionner une ville';

  @override
  String get searchCityHint => 'Rechercher une ville ou un pays';

  @override
  String get calculationMethod => 'Méthode de calcul';

  @override
  String get calculationMethodSubtitle =>
      'Correspondre à l\'autorité de votre mosquée locale';

  @override
  String get madhab => 'Madhab (heure de l\'Asr)';

  @override
  String get fineTune => 'Ajustement fin (minutes)';

  @override
  String get fineTuneSubtitle =>
      'Ajuster pour correspondre au calendrier de votre mosquée locale';

  @override
  String get use24Hour => 'Format horaire 24 heures';

  @override
  String get notifications => 'Notifications';

  @override
  String get refreshGps => 'Actualiser la position GPS';

  @override
  String get language => 'Langue';

  @override
  String get languageSubtitle =>
      'Choisir la langue d\'affichage de l\'application';

  @override
  String get methodMuslimWorldLeague => 'Ligue islamique mondiale';

  @override
  String get methodIsna => 'ISNA';

  @override
  String get methodUmmAlQura => 'Umm al-Qura';

  @override
  String get methodEgyptian => 'Autorité générale égyptienne';

  @override
  String get methodKarachi => 'Université de Karachi';

  @override
  String get madhabShafi => 'Shafi\'i';

  @override
  String get madhabHanafi => 'Hanafi';

  @override
  String get prayerFajr => 'Fajr';

  @override
  String get prayerSunrise => 'Lever du soleil';

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
  String get categoryMorning => 'Matin';

  @override
  String get categoryEvening => 'Soir';

  @override
  String get categoryPostPrayer => 'Après la prière';

  @override
  String get morningDescription =>
      'Invocations du matin après le Fajr — Hisn al-Muslim';

  @override
  String get eveningDescription =>
      'Invocations du soir après l\'Asr — Hisn al-Muslim';

  @override
  String get postPrayerDescription => 'Dhikr après chaque prière obligatoire';

  @override
  String get tapToCount => 'Appuyez sur la carte pour compter les répétitions';

  @override
  String get referenceQuran => 'Coran';

  @override
  String get referenceHadith => 'Hadith';

  @override
  String get referenceAthar => 'Athar';

  @override
  String get narrator => 'Narrateur';

  @override
  String get grade => 'Degré';

  @override
  String hisnNumber(int number) {
    return 'Hisn n°$number';
  }

  @override
  String get tasbihTitle => 'Compteur de Tasbih';

  @override
  String get tapToCountTasbih => 'Appuyez n\'importe où pour compter';

  @override
  String get tasbihMilestones => 'Jalons à 33 et 100';

  @override
  String get resetCounterTitle => 'Réinitialiser le compteur ?';

  @override
  String get resetCounterMessage =>
      'Cela effacera le nombre de votre session de Tasbih en cours.';

  @override
  String get notificationPrayerTitle => 'Heure de prière';

  @override
  String notificationPrayerBody(String prayer) {
    return 'Il est l\'heure de $prayer';
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
