// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malay (`ms`).
class AppLocalizationsMs extends AppLocalizations {
  AppLocalizationsMs([String locale = 'ms']) : super(locale);

  @override
  String get appTitle => 'Al-Qiblah & Teman Solat';

  @override
  String get navQiblah => 'Kiblat';

  @override
  String get navPrayerTimes => 'Waktu Solat';

  @override
  String get navAzkar => 'Zikir';

  @override
  String get close => 'Tutup';

  @override
  String get cancel => 'Batal';

  @override
  String get reset => 'Set semula';

  @override
  String get retry => 'Cuba lagi';

  @override
  String get done => 'Selesai';

  @override
  String get showMore => 'Tunjuk lebih';

  @override
  String get showLess => 'Tunjuk kurang';

  @override
  String get qiblahTitle => 'Kiblat';

  @override
  String get useCurrentLocation => 'Guna lokasi semasa';

  @override
  String get changeCity => 'Tukar bandar';

  @override
  String get currentLocationSaved => 'Lokasi semasa disimpan';

  @override
  String get unableToGetGps =>
      'Tidak dapat mendapatkan GPS. Cuba pilih bandar.';

  @override
  String get locationStatusUnavailable => 'Tidak dapat membaca status lokasi';

  @override
  String get locationEnableServices => 'Sila aktifkan perkhidmatan lokasi';

  @override
  String get locationEnableOrSelectCity =>
      'Sila aktifkan perkhidmatan lokasi atau pilih bandar';

  @override
  String get locationUnavailableSelectCity =>
      'Lokasi tidak tersedia. Pilih bandar atau berikan kebenaran.';

  @override
  String get locationPermissionDenied =>
      'Kebenaran lokasi ditolak. Pilih bandar atau berikan kebenaran.';

  @override
  String get locationPermissionDeniedForever =>
      'Kebenaran lokasi ditolak secara kekal. Pilih bandar dalam tetapan.';

  @override
  String get locationUnavailable => 'Lokasi tidak tersedia';

  @override
  String get sensorUnavailable =>
      'Peranti ini tiada sensor kompas. Arah kiblat tidak dapat dipaparkan.';

  @override
  String get compassUnavailable =>
      'Data kompas tidak tersedia. Cuba peranti fizikal, tetapkan lokasi emulater, atau pilih bandar secara manual.';

  @override
  String get calibrationHint =>
      'Gerakkan telefon anda membentuk angka 8 untuk meningkatkan ketepatan kompas.';

  @override
  String get qiblahAccuracyDisclaimer =>
      'Qiblah direction is approximate. Accuracy depends on your device compass, location, and magnetic interference. Calibrate your phone and verify with a physical compass when precision matters.';

  @override
  String get facingQiblah => 'Menghadap Kiblat';

  @override
  String rotateLeft(int degrees) {
    return 'Putar kiri $degrees°';
  }

  @override
  String rotateRight(int degrees) {
    return 'Putar kanan $degrees°';
  }

  @override
  String get prayerTimesTitle => 'Waktu Solat';

  @override
  String get settings => 'Tetapan';

  @override
  String get todaysSchedule => 'Jadual Hari Ini';

  @override
  String get nextPrayer => 'Solat Seterusnya';

  @override
  String get locationNotSet => 'Lokasi belum ditetapkan';

  @override
  String get failedToLoadPrayerTimes => 'Gagal memuatkan waktu solat';

  @override
  String get unableToCalculatePrayerTimes => 'Tidak dapat mengira waktu solat';

  @override
  String get selectCity => 'Pilih Bandar';

  @override
  String get searchCityHint => 'Cari bandar atau negara';

  @override
  String get calculationMethod => 'Kaedah Pengiraan';

  @override
  String get calculationMethodSubtitle =>
      'Selaraskan dengan pihak berkuasa masjid tempatan anda';

  @override
  String get madhab => 'Mazhab (waktu Asar)';

  @override
  String get fineTune => 'Penalaan halus (minit)';

  @override
  String get fineTuneSubtitle =>
      'Laraskan agar sepadan dengan jadual masjid tempatan anda';

  @override
  String get use24Hour => 'Format masa 24 jam';

  @override
  String get notifications => 'Pemberitahuan';

  @override
  String get refreshGps => 'Muat semula lokasi GPS';

  @override
  String get language => 'Bahasa';

  @override
  String get languageSubtitle => 'Pilih bahasa paparan aplikasi';

  @override
  String get methodMuslimWorldLeague => 'Liga Muslim Dunia';

  @override
  String get methodIsna => 'ISNA';

  @override
  String get methodUmmAlQura => 'Umm al-Qura';

  @override
  String get methodEgyptian => 'Pihak Berkuasa Am Mesir';

  @override
  String get methodKarachi => 'Universiti Karachi';

  @override
  String get madhabShafi => 'Syafi\'i';

  @override
  String get madhabHanafi => 'Hanafi';

  @override
  String get prayerFajr => 'Subuh';

  @override
  String get prayerSunrise => 'Syuruk';

  @override
  String get prayerDhuhr => 'Zohor';

  @override
  String get prayerAsr => 'Asar';

  @override
  String get prayerMaghrib => 'Maghrib';

  @override
  String get prayerIsha => 'Isyak';

  @override
  String get azkarTitle => 'Zikir';

  @override
  String get tasbih => 'Tasbih';

  @override
  String get categoryMorning => 'Pagi';

  @override
  String get categoryEvening => 'Petang';

  @override
  String get categoryPostPrayer => 'Selepas Solat';

  @override
  String get morningDescription => 'Zikir pagi selepas Subuh — Hisn al-Muslim';

  @override
  String get eveningDescription => 'Zikir petang selepas Asar — Hisn al-Muslim';

  @override
  String get postPrayerDescription => 'Zikir selepas setiap solat fardhu';

  @override
  String get tapToCount => 'Ketik kad untuk kira ulangan';

  @override
  String get referenceQuran => 'Al-Quran';

  @override
  String get referenceHadith => 'Hadis';

  @override
  String get referenceAthar => 'Athar';

  @override
  String get narrator => 'Perawi';

  @override
  String get grade => 'Darjah';

  @override
  String hisnNumber(int number) {
    return 'Hisn #$number';
  }

  @override
  String get tasbihTitle => 'Penghitung Tasbih';

  @override
  String get tapToCountTasbih => 'Ketik di mana-mana untuk kira';

  @override
  String get tasbihMilestones => 'Pencapaian pada 33 dan 100';

  @override
  String get resetCounterTitle => 'Set semula penghitung?';

  @override
  String get resetCounterMessage =>
      'Ini akan memadamkan kiraan sesi tasbih semasa anda.';

  @override
  String get notificationPrayerTitle => 'Waktu Solat';

  @override
  String notificationPrayerBody(String prayer) {
    return 'Sudah tiba waktu $prayer';
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
