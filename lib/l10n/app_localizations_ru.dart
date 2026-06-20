// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Аль-Кибла и спутник молитвы';

  @override
  String get navQiblah => 'Кибла';

  @override
  String get navPrayerTimes => 'Время молитв';

  @override
  String get navAzkar => 'Азкары';

  @override
  String get close => 'Закрыть';

  @override
  String get cancel => 'Отмена';

  @override
  String get reset => 'Сбросить';

  @override
  String get retry => 'Повторить';

  @override
  String get done => 'Готово';

  @override
  String get showMore => 'Показать больше';

  @override
  String get showLess => 'Показать меньше';

  @override
  String get qiblahTitle => 'Кибла';

  @override
  String get useCurrentLocation => 'Использовать текущее местоположение';

  @override
  String get changeCity => 'Сменить город';

  @override
  String get currentLocationSaved => 'Текущее местоположение сохранено';

  @override
  String get unableToGetGps =>
      'Не удалось получить GPS. Попробуйте выбрать город.';

  @override
  String get locationStatusUnavailable =>
      'Не удалось прочитать статус местоположения';

  @override
  String get locationEnableServices => 'Пожалуйста, включите службы геолокации';

  @override
  String get locationEnableOrSelectCity =>
      'Пожалуйста, включите службы геолокации или выберите город';

  @override
  String get locationUnavailableSelectCity =>
      'Местоположение недоступно. Выберите город или предоставьте разрешение.';

  @override
  String get locationPermissionDenied =>
      'Разрешение на геолокацию отклонено. Выберите город или предоставьте разрешение.';

  @override
  String get locationPermissionDeniedForever =>
      'Разрешение на геолокацию отклонено навсегда. Выберите город в настройках.';

  @override
  String get locationUnavailable => 'Местоположение недоступно';

  @override
  String get sensorUnavailable =>
      'На этом устройстве нет датчика компаса. Направление киблы не может быть показано.';

  @override
  String get compassUnavailable =>
      'Данные компаса недоступны. Попробуйте физическое устройство, установите местоположение в эмуляторе или выберите город вручную.';

  @override
  String get calibrationHint =>
      'Двигайте телефон в форме восьмёрки для повышения точности компаса.';

  @override
  String get qiblahAccuracyDisclaimer =>
      'Qiblah direction is approximate. Accuracy depends on your device compass, location, and magnetic interference. Calibrate your phone and verify with a physical compass when precision matters.';

  @override
  String get facingQiblah => 'Лицом к кибле';

  @override
  String rotateLeft(int degrees) {
    return 'Поверните влево на $degrees°';
  }

  @override
  String rotateRight(int degrees) {
    return 'Поверните вправо на $degrees°';
  }

  @override
  String get prayerTimesTitle => 'Время молитв';

  @override
  String get settings => 'Настройки';

  @override
  String get todaysSchedule => 'Расписание на сегодня';

  @override
  String get nextPrayer => 'Следующая молитва';

  @override
  String get locationNotSet => 'Местоположение не задано';

  @override
  String get failedToLoadPrayerTimes => 'Не удалось загрузить время молитв';

  @override
  String get unableToCalculatePrayerTimes =>
      'Не удалось рассчитать время молитв';

  @override
  String get selectCity => 'Выбрать город';

  @override
  String get searchCityHint => 'Поиск города или страны';

  @override
  String get calculationMethod => 'Метод расчёта';

  @override
  String get calculationMethodSubtitle => 'Согласуйте с вашей местной мечетью';

  @override
  String get madhab => 'Мазхаб (время Аср)';

  @override
  String get fineTune => 'Точная настройка (минуты)';

  @override
  String get fineTuneSubtitle =>
      'Настройте под расписание вашей местной мечети';

  @override
  String get use24Hour => '24-часовой формат времени';

  @override
  String get notifications => 'Уведомления';

  @override
  String get refreshGps => 'Обновить GPS-местоположение';

  @override
  String get language => 'Язык';

  @override
  String get languageSubtitle => 'Выберите язык приложения';

  @override
  String get methodMuslimWorldLeague => 'Всемирная мусульманская лига';

  @override
  String get methodIsna => 'ISNA';

  @override
  String get methodUmmAlQura => 'Умм аль-Кура';

  @override
  String get methodEgyptian => 'Египетское генеральное управление';

  @override
  String get methodKarachi => 'Университет Карачи';

  @override
  String get madhabShafi => 'Шафиитский';

  @override
  String get madhabHanafi => 'Ханафитский';

  @override
  String get prayerFajr => 'Фаджр';

  @override
  String get prayerSunrise => 'Восход';

  @override
  String get prayerDhuhr => 'Зухр';

  @override
  String get prayerAsr => 'Аср';

  @override
  String get prayerMaghrib => 'Магриб';

  @override
  String get prayerIsha => 'Иша';

  @override
  String get azkarTitle => 'Азкары';

  @override
  String get tasbih => 'Тасбих';

  @override
  String get categoryMorning => 'Утро';

  @override
  String get categoryEvening => 'Вечер';

  @override
  String get categoryPostPrayer => 'После молитвы';

  @override
  String get morningDescription =>
      'Утреннее поминание после Фаджра — Хисн аль-Муслим';

  @override
  String get eveningDescription =>
      'Вечернее поминание после Асра — Хисн аль-Муслим';

  @override
  String get postPrayerDescription => 'Зикр после каждой обязательной молитвы';

  @override
  String get tapToCount => 'Нажмите на карточку, чтобы считать повторения';

  @override
  String get referenceQuran => 'Коран';

  @override
  String get referenceHadith => 'Хадис';

  @override
  String get referenceAthar => 'Атар';

  @override
  String get narrator => 'Передатчик';

  @override
  String get grade => 'Степень';

  @override
  String hisnNumber(int number) {
    return 'Хисн №$number';
  }

  @override
  String get tasbihTitle => 'Счётчик тасбих';

  @override
  String get tapToCountTasbih => 'Нажмите в любом месте для подсчёта';

  @override
  String get tasbihMilestones => 'Отметки на 33 и 100';

  @override
  String get resetCounterTitle => 'Сбросить счётчик?';

  @override
  String get resetCounterMessage => 'Это очистит текущий счёт сессии тасбих.';

  @override
  String get notificationPrayerTitle => 'Время молитвы';

  @override
  String notificationPrayerBody(String prayer) {
    return 'Настало время $prayer';
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
