// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Kıble ve Namaz Rehberi';

  @override
  String get navQiblah => 'Kıble';

  @override
  String get navPrayerTimes => 'Namaz Vakitleri';

  @override
  String get navAzkar => 'Zikirler';

  @override
  String get close => 'Kapat';

  @override
  String get cancel => 'İptal';

  @override
  String get reset => 'Sıfırla';

  @override
  String get retry => 'Yeniden dene';

  @override
  String get done => 'Tamam';

  @override
  String get showMore => 'Daha fazla göster';

  @override
  String get showLess => 'Daha az göster';

  @override
  String get qiblahTitle => 'Kıble';

  @override
  String get useCurrentLocation => 'Mevcut konumu kullan';

  @override
  String get changeCity => 'Şehir değiştir';

  @override
  String get currentLocationSaved => 'Mevcut konum kaydedildi';

  @override
  String get unableToGetGps =>
      'GPS alınamadı. Bunun yerine bir şehir seçmeyi deneyin.';

  @override
  String get locationStatusUnavailable => 'Konum durumu okunamadı';

  @override
  String get locationEnableServices =>
      'Lütfen konum hizmetlerini etkinleştirin';

  @override
  String get locationEnableOrSelectCity =>
      'Lütfen konum hizmetlerini etkinleştirin veya bir şehir seçin';

  @override
  String get locationUnavailableSelectCity =>
      'Konum kullanılamıyor. Bir şehir seçin veya izin verin.';

  @override
  String get locationPermissionDenied =>
      'Konum izni reddedildi. Bir şehir seçin veya izin verin.';

  @override
  String get locationPermissionDeniedForever =>
      'Konum izni kalıcı olarak reddedildi. Ayarlardan bir şehir seçin.';

  @override
  String get locationUnavailable => 'Konum kullanılamıyor';

  @override
  String get sensorUnavailable =>
      'Bu cihazda pusula sensörü yok. Kıble yönü gösterilemiyor.';

  @override
  String get compassUnavailable =>
      'Pusula verileri kullanılamıyor. Fiziksel bir cihaz deneyin, emülatörde konum ayarlayın veya manuel olarak bir şehir seçin.';

  @override
  String get calibrationHint =>
      'Pusula doğruluğunu artırmak için telefonunuzu 8 şeklinde hareket ettirin.';

  @override
  String get facingQiblah => 'Kıbleye dönük';

  @override
  String rotateLeft(int degrees) {
    return 'Sola $degrees° döndür';
  }

  @override
  String rotateRight(int degrees) {
    return 'Sağa $degrees° döndür';
  }

  @override
  String get prayerTimesTitle => 'Namaz Vakitleri';

  @override
  String get settings => 'Ayarlar';

  @override
  String get todaysSchedule => 'Bugünün Programı';

  @override
  String get nextPrayer => 'Sonraki Namaz';

  @override
  String get locationNotSet => 'Konum ayarlanmadı';

  @override
  String get failedToLoadPrayerTimes => 'Namaz vakitleri yüklenemedi';

  @override
  String get unableToCalculatePrayerTimes => 'Namaz vakitleri hesaplanamadı';

  @override
  String get selectCity => 'Şehir Seç';

  @override
  String get searchCityHint => 'Şehir veya ülke ara';

  @override
  String get calculationMethod => 'Hesaplama Yöntemi';

  @override
  String get calculationMethodSubtitle =>
      'Yerel caminizin otoritesiyle eşleştirin';

  @override
  String get madhab => 'Mezhep (İkindi vakti)';

  @override
  String get fineTune => 'İnce ayar (dakika)';

  @override
  String get fineTuneSubtitle =>
      'Yerel caminizin vakit çizelgesine uydurmak için ayarlayın';

  @override
  String get use24Hour => '24 saatlik zaman formatı';

  @override
  String get notifications => 'Bildirimler';

  @override
  String get refreshGps => 'GPS konumunu yenile';

  @override
  String get language => 'Dil';

  @override
  String get languageSubtitle => 'Uygulama görüntüleme dilini seçin';

  @override
  String get methodMuslimWorldLeague => 'Dünya İslam Birliği';

  @override
  String get methodIsna => 'ISNA';

  @override
  String get methodUmmAlQura => 'Umm al-Qura';

  @override
  String get methodEgyptian => 'Mısır Genel Otoritesi';

  @override
  String get methodKarachi => 'Karachi Üniversitesi';

  @override
  String get madhabShafi => 'Şafii';

  @override
  String get madhabHanafi => 'Hanefi';

  @override
  String get prayerFajr => 'Sabah';

  @override
  String get prayerSunrise => 'Güneş';

  @override
  String get prayerDhuhr => 'Öğle';

  @override
  String get prayerAsr => 'İkindi';

  @override
  String get prayerMaghrib => 'Akşam';

  @override
  String get prayerIsha => 'Yatsı';

  @override
  String get azkarTitle => 'Zikirler';

  @override
  String get tasbih => 'Tesbih';

  @override
  String get categoryMorning => 'Sabah';

  @override
  String get categoryEvening => 'Akşam';

  @override
  String get categoryPostPrayer => 'Namaz Sonrası';

  @override
  String get morningDescription =>
      'Sabah namazından sonra sabah zikirleri — Hisn al-Muslim';

  @override
  String get eveningDescription =>
      'İkindi namazından sonra akşam zikirleri — Hisn al-Muslim';

  @override
  String get postPrayerDescription => 'Her farz namazdan sonra zikir';

  @override
  String get tapToCount => 'Tekrarları saymak için karta dokunun';

  @override
  String get referenceQuran => 'Kur\'an';

  @override
  String get referenceHadith => 'Hadis';

  @override
  String get referenceAthar => 'Athar';

  @override
  String get narrator => 'Ravi';

  @override
  String get grade => 'Derece';

  @override
  String hisnNumber(int number) {
    return 'Hisn #$number';
  }

  @override
  String get tasbihTitle => 'Tesbih Sayacı';

  @override
  String get tapToCountTasbih => 'Saymak için herhangi bir yere dokunun';

  @override
  String get tasbihMilestones => '33 ve 100\'de kilometre taşları';

  @override
  String get resetCounterTitle => 'Sayaç sıfırlansın mı?';

  @override
  String get resetCounterMessage =>
      'Bu, mevcut tesbih oturumunuzun sayısını temizleyecektir.';

  @override
  String get notificationPrayerTitle => 'Namaz Vakti';

  @override
  String notificationPrayerBody(String prayer) {
    return '$prayer vakti geldi';
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
