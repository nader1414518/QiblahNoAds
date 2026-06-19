enum CalculationMethodId {
  muslimWorldLeague,
  isna,
  ummAlQura,
}

extension CalculationMethodIdExt on CalculationMethodId {
  String get label {
    switch (this) {
      case CalculationMethodId.muslimWorldLeague:
        return 'Muslim World League';
      case CalculationMethodId.isna:
        return 'ISNA';
      case CalculationMethodId.ummAlQura:
        return 'Umm al-Qura';
    }
  }

  String get storageKey => name;
}

enum MadhabId {
  shafi,
  hanafi,
}

extension MadhabIdExt on MadhabId {
  String get label {
    switch (this) {
      case MadhabId.shafi:
        return 'Shafi';
      case MadhabId.hanafi:
        return 'Hanafi';
    }
  }

  String get storageKey => name;
}

enum PrayerName {
  fajr,
  sunrise,
  dhuhr,
  asr,
  maghrib,
  isha,
}

extension PrayerNameExt on PrayerName {
  String get label {
    switch (this) {
      case PrayerName.fajr:
        return 'Fajr';
      case PrayerName.sunrise:
        return 'Sunrise';
      case PrayerName.dhuhr:
        return 'Dhuhr';
      case PrayerName.asr:
        return 'Asr';
      case PrayerName.maghrib:
        return 'Maghrib';
      case PrayerName.isha:
        return 'Isha';
    }
  }

  String get storageKey => name;

  bool get isNotifiable {
    return this != PrayerName.sunrise;
  }
}

enum LocationSource {
  gps,
  manual,
}

enum AzkarCategory {
  morning,
  evening,
  postPrayer,
}

extension AzkarCategoryExt on AzkarCategory {
  String get label {
    switch (this) {
      case AzkarCategory.morning:
        return 'Morning';
      case AzkarCategory.evening:
        return 'Evening';
      case AzkarCategory.postPrayer:
        return 'Post-Prayer';
    }
  }

  String get jsonKey {
    switch (this) {
      case AzkarCategory.morning:
        return 'morning';
      case AzkarCategory.evening:
        return 'evening';
      case AzkarCategory.postPrayer:
        return 'post_prayer';
    }
  }
}
