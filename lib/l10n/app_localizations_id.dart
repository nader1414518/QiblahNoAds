// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'Al-Qiblah & Pendamping Shalat';

  @override
  String get navQiblah => 'Kiblat';

  @override
  String get navPrayerTimes => 'Waktu Shalat';

  @override
  String get navAzkar => 'Dzikir';

  @override
  String get close => 'Tutup';

  @override
  String get cancel => 'Batal';

  @override
  String get reset => 'Atur ulang';

  @override
  String get retry => 'Coba lagi';

  @override
  String get done => 'Selesai';

  @override
  String get showMore => 'Tampilkan lebih banyak';

  @override
  String get showLess => 'Tampilkan lebih sedikit';

  @override
  String get qiblahTitle => 'Kiblat';

  @override
  String get useCurrentLocation => 'Gunakan lokasi saat ini';

  @override
  String get changeCity => 'Ganti kota';

  @override
  String get currentLocationSaved => 'Lokasi saat ini disimpan';

  @override
  String get unableToGetGps =>
      'Tidak dapat mendapatkan GPS. Coba pilih kota sebagai gantinya.';

  @override
  String get locationStatusUnavailable => 'Tidak dapat membaca status lokasi';

  @override
  String get locationEnableServices => 'Harap aktifkan layanan lokasi';

  @override
  String get locationEnableOrSelectCity =>
      'Harap aktifkan layanan lokasi atau pilih kota';

  @override
  String get locationUnavailableSelectCity =>
      'Lokasi tidak tersedia. Pilih kota atau berikan izin.';

  @override
  String get locationPermissionDenied =>
      'Izin lokasi ditolak. Pilih kota atau berikan izin.';

  @override
  String get locationPermissionDeniedForever =>
      'Izin lokasi ditolak permanen. Pilih kota di pengaturan.';

  @override
  String get locationUnavailable => 'Lokasi tidak tersedia';

  @override
  String get sensorUnavailable =>
      'Perangkat ini tidak memiliki sensor kompas. Arah kiblat tidak dapat ditampilkan.';

  @override
  String get compassUnavailable =>
      'Data kompas tidak tersedia. Coba perangkat fisik, atur lokasi emulator, atau pilih kota secara manual.';

  @override
  String get calibrationHint =>
      'Gerakkan ponsel Anda membentuk angka 8 untuk meningkatkan akurasi kompas.';

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
  String get prayerTimesTitle => 'Waktu Shalat';

  @override
  String get settings => 'Pengaturan';

  @override
  String get todaysSchedule => 'Jadwal Hari Ini';

  @override
  String get nextPrayer => 'Shalat Berikutnya';

  @override
  String get locationNotSet => 'Lokasi belum diatur';

  @override
  String get failedToLoadPrayerTimes => 'Gagal memuat waktu shalat';

  @override
  String get unableToCalculatePrayerTimes =>
      'Tidak dapat menghitung waktu shalat';

  @override
  String get selectCity => 'Pilih Kota';

  @override
  String get searchCityHint => 'Cari kota atau negara';

  @override
  String get calculationMethod => 'Metode Perhitungan';

  @override
  String get calculationMethodSubtitle =>
      'Sesuaikan dengan otoritas masjid lokal Anda';

  @override
  String get madhab => 'Mazhab (waktu Ashar)';

  @override
  String get fineTune => 'Penyesuaian halus (menit)';

  @override
  String get fineTuneSubtitle =>
      'Sesuaikan agar cocok dengan jadwal masjid lokal Anda';

  @override
  String get use24Hour => 'Format waktu 24 jam';

  @override
  String get notifications => 'Notifikasi';

  @override
  String get refreshGps => 'Segarkan lokasi GPS';

  @override
  String get language => 'Bahasa';

  @override
  String get languageSubtitle => 'Pilih bahasa tampilan aplikasi';

  @override
  String get methodMuslimWorldLeague => 'Liga Muslim Dunia';

  @override
  String get methodIsna => 'ISNA';

  @override
  String get methodUmmAlQura => 'Umm al-Qura';

  @override
  String get methodEgyptian => 'Otoritas Umum Mesir';

  @override
  String get methodKarachi => 'Universitas Karachi';

  @override
  String get madhabShafi => 'Syafi\'i';

  @override
  String get madhabHanafi => 'Hanafi';

  @override
  String get prayerFajr => 'Subuh';

  @override
  String get prayerSunrise => 'Terbit';

  @override
  String get prayerDhuhr => 'Dzuhur';

  @override
  String get prayerAsr => 'Ashar';

  @override
  String get prayerMaghrib => 'Maghrib';

  @override
  String get prayerIsha => 'Isya';

  @override
  String get azkarTitle => 'Dzikir';

  @override
  String get tasbih => 'Tasbih';

  @override
  String get categoryMorning => 'Pagi';

  @override
  String get categoryEvening => 'Petang';

  @override
  String get categoryPostPrayer => 'Setelah Shalat';

  @override
  String get morningDescription => 'Dzikir pagi setelah Subuh — Hisn al-Muslim';

  @override
  String get eveningDescription =>
      'Dzikir petang setelah Ashar — Hisn al-Muslim';

  @override
  String get postPrayerDescription => 'Dzikir setelah setiap shalat wajib';

  @override
  String get tapToCount => 'Ketuk kartu untuk menghitung pengulangan';

  @override
  String get referenceQuran => 'Al-Qur\'an';

  @override
  String get referenceHadith => 'Hadis';

  @override
  String get referenceAthar => 'Athar';

  @override
  String get narrator => 'Perawi';

  @override
  String get grade => 'Derajat';

  @override
  String hisnNumber(int number) {
    return 'Hisn #$number';
  }

  @override
  String get tasbihTitle => 'Penghitung Tasbih';

  @override
  String get tapToCountTasbih => 'Ketuk di mana saja untuk menghitung';

  @override
  String get tasbihMilestones => 'Tonggak pada 33 dan 100';

  @override
  String get resetCounterTitle => 'Atur ulang penghitung?';

  @override
  String get resetCounterMessage =>
      'Ini akan menghapus jumlah sesi tasbih Anda saat ini.';

  @override
  String get notificationPrayerTitle => 'Waktu Shalat';

  @override
  String notificationPrayerBody(String prayer) {
    return 'Waktunya $prayer';
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
