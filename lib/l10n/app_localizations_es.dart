// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Al-Qiblah y Compañero de Oración';

  @override
  String get navQiblah => 'Qiblah';

  @override
  String get navPrayerTimes => 'Horarios de oración';

  @override
  String get navAzkar => 'Azkar';

  @override
  String get close => 'Cerrar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get reset => 'Restablecer';

  @override
  String get retry => 'Reintentar';

  @override
  String get done => 'Listo';

  @override
  String get showMore => 'Mostrar más';

  @override
  String get showLess => 'Mostrar menos';

  @override
  String get qiblahTitle => 'Qiblah';

  @override
  String get useCurrentLocation => 'Usar ubicación actual';

  @override
  String get changeCity => 'Cambiar ciudad';

  @override
  String get currentLocationSaved => 'Ubicación actual guardada';

  @override
  String get unableToGetGps =>
      'No se pudo obtener el GPS. Intenta seleccionar una ciudad.';

  @override
  String get locationStatusUnavailable =>
      'No se pudo leer el estado de la ubicación';

  @override
  String get locationEnableServices => 'Activa los servicios de ubicación';

  @override
  String get locationEnableOrSelectCity =>
      'Activa los servicios de ubicación o selecciona una ciudad';

  @override
  String get locationUnavailableSelectCity =>
      'Ubicación no disponible. Selecciona una ciudad u otorga permiso.';

  @override
  String get locationPermissionDenied =>
      'Permiso de ubicación denegado. Selecciona una ciudad u otorga permiso.';

  @override
  String get locationPermissionDeniedForever =>
      'Permiso de ubicación denegado permanentemente. Selecciona una ciudad en ajustes.';

  @override
  String get locationUnavailable => 'Ubicación no disponible';

  @override
  String get sensorUnavailable =>
      'Este dispositivo no tiene sensor de brújula. No se puede mostrar la dirección de la Qiblah.';

  @override
  String get compassUnavailable =>
      'Datos de brújula no disponibles. Prueba un dispositivo físico, configura la ubicación del emulador o selecciona una ciudad manualmente.';

  @override
  String get calibrationHint =>
      'Mueve el teléfono en forma de 8 para mejorar la precisión de la brújula.';

  @override
  String get qiblahAccuracyDisclaimer =>
      'Qiblah direction is approximate. Accuracy depends on your device compass, location, and magnetic interference. Calibrate your phone and verify with a physical compass when precision matters.';

  @override
  String get facingQiblah => 'Orientado hacia la Qiblah';

  @override
  String rotateLeft(int degrees) {
    return 'Girar a la izquierda $degrees°';
  }

  @override
  String rotateRight(int degrees) {
    return 'Girar a la derecha $degrees°';
  }

  @override
  String get prayerTimesTitle => 'Horarios de oración';

  @override
  String get settings => 'Ajustes';

  @override
  String get todaysSchedule => 'Horario de hoy';

  @override
  String get nextPrayer => 'Próxima oración';

  @override
  String get locationNotSet => 'Ubicación no configurada';

  @override
  String get failedToLoadPrayerTimes =>
      'Error al cargar los horarios de oración';

  @override
  String get unableToCalculatePrayerTimes =>
      'No se pudieron calcular los horarios de oración';

  @override
  String get selectCity => 'Seleccionar ciudad';

  @override
  String get searchCityHint => 'Buscar ciudad o país';

  @override
  String get calculationMethod => 'Método de cálculo';

  @override
  String get calculationMethodSubtitle =>
      'Ajusta según la autoridad de tu mezquita local';

  @override
  String get madhab => 'Madhab (hora del Asr)';

  @override
  String get fineTune => 'Ajuste fino (minutos)';

  @override
  String get fineTuneSubtitle =>
      'Ajusta para coincidir con el horario de tu mezquita local';

  @override
  String get use24Hour => 'Formato de 24 horas';

  @override
  String get notifications => 'Notificaciones';

  @override
  String get refreshGps => 'Actualizar ubicación GPS';

  @override
  String get language => 'Idioma';

  @override
  String get languageSubtitle => 'Elige el idioma de la aplicación';

  @override
  String get methodMuslimWorldLeague => 'Liga Musulmana Mundial';

  @override
  String get methodIsna => 'ISNA';

  @override
  String get methodUmmAlQura => 'Umm al-Qura';

  @override
  String get methodEgyptian => 'Autoridad General Egipcia';

  @override
  String get methodKarachi => 'Universidad de Karachi';

  @override
  String get madhabShafi => 'Shafi\'i';

  @override
  String get madhabHanafi => 'Hanafi';

  @override
  String get prayerFajr => 'Fajr';

  @override
  String get prayerSunrise => 'Amanecer';

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
  String get categoryMorning => 'Mañana';

  @override
  String get categoryEvening => 'Tarde';

  @override
  String get categoryPostPrayer => 'Después de la oración';

  @override
  String get morningDescription =>
      'Recuerdos matutinos después del Fajr — Hisn al-Muslim';

  @override
  String get eveningDescription =>
      'Recuerdos vespertinos después del Asr — Hisn al-Muslim';

  @override
  String get postPrayerDescription =>
      'Dhikr después de cada oración obligatoria';

  @override
  String get tapToCount => 'Toca la tarjeta para contar repeticiones';

  @override
  String get referenceQuran => 'Corán';

  @override
  String get referenceHadith => 'Hadith';

  @override
  String get referenceAthar => 'Athar';

  @override
  String get narrator => 'Narrador';

  @override
  String get grade => 'Grado';

  @override
  String hisnNumber(int number) {
    return 'Hisn n.º $number';
  }

  @override
  String get tasbihTitle => 'Contador de Tasbih';

  @override
  String get tapToCountTasbih => 'Toca en cualquier lugar para contar';

  @override
  String get tasbihMilestones => 'Hitos en 33 y 100';

  @override
  String get resetCounterTitle => '¿Restablecer contador?';

  @override
  String get resetCounterMessage =>
      'Esto borrará el conteo de tu sesión actual de Tasbih.';

  @override
  String get notificationPrayerTitle => 'Hora de oración';

  @override
  String notificationPrayerBody(String prayer) {
    return 'Es hora de $prayer';
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
