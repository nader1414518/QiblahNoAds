// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Al-Qiblah e Companheiro de Oração';

  @override
  String get navQiblah => 'Qiblah';

  @override
  String get navPrayerTimes => 'Horários de Oração';

  @override
  String get navAzkar => 'Azkar';

  @override
  String get close => 'Fechar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get reset => 'Repor';

  @override
  String get retry => 'Tentar novamente';

  @override
  String get done => 'Concluído';

  @override
  String get showMore => 'Mostrar mais';

  @override
  String get showLess => 'Mostrar menos';

  @override
  String get qiblahTitle => 'Qiblah';

  @override
  String get useCurrentLocation => 'Usar localização atual';

  @override
  String get changeCity => 'Alterar cidade';

  @override
  String get currentLocationSaved => 'Localização atual guardada';

  @override
  String get unableToGetGps =>
      'Não foi possível obter o GPS. Tente selecionar uma cidade.';

  @override
  String get locationStatusUnavailable =>
      'Não foi possível ler o estado da localização';

  @override
  String get locationEnableServices => 'Ative os serviços de localização';

  @override
  String get locationEnableOrSelectCity =>
      'Ative os serviços de localização ou selecione uma cidade';

  @override
  String get locationUnavailableSelectCity =>
      'Localização indisponível. Selecione uma cidade ou conceda permissão.';

  @override
  String get locationPermissionDenied =>
      'Permissão de localização negada. Selecione uma cidade ou conceda permissão.';

  @override
  String get locationPermissionDeniedForever =>
      'Permissão de localização negada permanentemente. Selecione uma cidade nas definições.';

  @override
  String get locationUnavailable => 'Localização indisponível';

  @override
  String get sensorUnavailable =>
      'Este dispositivo não tem sensor de bússola. A direção da Qiblah não pode ser mostrada.';

  @override
  String get compassUnavailable =>
      'Dados da bússola indisponíveis. Experimente um dispositivo físico, defina a localização do emulador ou selecione uma cidade manualmente.';

  @override
  String get calibrationHint =>
      'Mova o telemóvel em forma de 8 para melhorar a precisão da bússola.';

  @override
  String get qiblahAccuracyDisclaimer =>
      'Qiblah direction is approximate. Accuracy depends on your device compass, location, and magnetic interference. Calibrate your phone and verify with a physical compass when precision matters.';

  @override
  String get facingQiblah => 'Virado para a Qiblah';

  @override
  String rotateLeft(int degrees) {
    return 'Rodar para a esquerda $degrees°';
  }

  @override
  String rotateRight(int degrees) {
    return 'Rodar para a direita $degrees°';
  }

  @override
  String get prayerTimesTitle => 'Horários de Oração';

  @override
  String get settings => 'Definições';

  @override
  String get todaysSchedule => 'Horário de Hoje';

  @override
  String get nextPrayer => 'Próxima Oração';

  @override
  String get locationNotSet => 'Localização não definida';

  @override
  String get failedToLoadPrayerTimes =>
      'Falha ao carregar os horários de oração';

  @override
  String get unableToCalculatePrayerTimes =>
      'Não foi possível calcular os horários de oração';

  @override
  String get selectCity => 'Selecionar Cidade';

  @override
  String get searchCityHint => 'Pesquisar cidade ou país';

  @override
  String get calculationMethod => 'Método de Cálculo';

  @override
  String get calculationMethodSubtitle =>
      'Corresponda à autoridade da sua mesquita local';

  @override
  String get madhab => 'Madhab (hora do Asr)';

  @override
  String get fineTune => 'Ajuste fino (minutos)';

  @override
  String get fineTuneSubtitle =>
      'Ajuste para corresponder ao horário da sua mesquita local';

  @override
  String get use24Hour => 'Formato de 24 horas';

  @override
  String get notifications => 'Notificações';

  @override
  String get refreshGps => 'Atualizar localização GPS';

  @override
  String get language => 'Idioma';

  @override
  String get languageSubtitle => 'Escolha o idioma de exibição da aplicação';

  @override
  String get methodMuslimWorldLeague => 'Liga Muçulmana Mundial';

  @override
  String get methodIsna => 'ISNA';

  @override
  String get methodUmmAlQura => 'Umm al-Qura';

  @override
  String get methodEgyptian => 'Autoridade Geral Egípcia';

  @override
  String get methodKarachi => 'Universidade de Karachi';

  @override
  String get madhabShafi => 'Shafi\'i';

  @override
  String get madhabHanafi => 'Hanafi';

  @override
  String get prayerFajr => 'Fajr';

  @override
  String get prayerSunrise => 'Nascer do sol';

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
  String get categoryMorning => 'Manhã';

  @override
  String get categoryEvening => 'Tarde';

  @override
  String get categoryPostPrayer => 'Após a Oração';

  @override
  String get morningDescription =>
      'Remembrança matinal após o Fajr — Hisn al-Muslim';

  @override
  String get eveningDescription =>
      'Remembrança vespertina após o Asr — Hisn al-Muslim';

  @override
  String get postPrayerDescription => 'Dhikr após cada oração obrigatória';

  @override
  String get tapToCount => 'Toque no cartão para contar repetições';

  @override
  String get referenceQuran => 'Alcorão';

  @override
  String get referenceHadith => 'Hadith';

  @override
  String get referenceAthar => 'Athar';

  @override
  String get narrator => 'Narrador';

  @override
  String get grade => 'Grau';

  @override
  String hisnNumber(int number) {
    return 'Hisn n.º $number';
  }

  @override
  String get tasbihTitle => 'Contador de Tasbih';

  @override
  String get tapToCountTasbih => 'Toque em qualquer lugar para contar';

  @override
  String get tasbihMilestones => 'Marcos em 33 e 100';

  @override
  String get resetCounterTitle => 'Repor contador?';

  @override
  String get resetCounterMessage =>
      'Isto irá limpar a contagem da sua sessão atual de Tasbih.';

  @override
  String get notificationPrayerTitle => 'Hora de Oração';

  @override
  String notificationPrayerBody(String prayer) {
    return 'É hora de $prayer';
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
