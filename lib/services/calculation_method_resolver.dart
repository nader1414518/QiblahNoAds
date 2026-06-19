import '../core/models/enums.dart';

class CalculationMethodResolver {
  static CalculationMethodId forCountry(String country) {
    switch (country) {
      case 'Saudi Arabia':
      case 'UAE':
      case 'Qatar':
      case 'Kuwait':
      case 'Bahrain':
      case 'Oman':
        return CalculationMethodId.ummAlQura;
      case 'Egypt':
        return CalculationMethodId.egyptian;
      case 'USA':
      case 'Canada':
        return CalculationMethodId.isna;
      case 'Pakistan':
        return CalculationMethodId.karachi;
      default:
        return CalculationMethodId.muslimWorldLeague;
    }
  }
}
