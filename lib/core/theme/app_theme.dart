import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color emeraldPrimary = Color(0xFF0D4A3A);
  static const Color emeraldLight = Color(0xFF1A6B55);
  static const Color goldAccent = Color(0xFFC9A227);
  static const Color goldMuted = Color(0xFFE8D5A3);
  static const Color darkBackground = Color(0xFF0F1419);
  static const Color darkSurface = Color(0xFF171D24);
  static const Color lightBackground = Color(0xFFF8F6F1);
  static const Color lightSurface = Color(0xFFFFFFFF);
}

class AppTheme {
  static const Color primaryGreen = AppColors.emeraldPrimary;
  static const Color accentGreen = AppColors.emeraldLight;
  static const Color darkBackground = AppColors.darkBackground;
  static const Color darkSurface = AppColors.darkSurface;

  static TextTheme _interTextTheme(TextTheme base) {
    return GoogleFonts.interTextTheme(base);
  }

  static TextStyle amiri({double? fontSize, FontWeight? fontWeight, Color? color}) {
    return GoogleFonts.amiri(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: 1.9,
    );
  }

  static ThemeData light() {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightBackground,
      colorScheme: const ColorScheme.light(
        primary: AppColors.emeraldPrimary,
        onPrimary: Colors.white,
        secondary: AppColors.goldAccent,
        onSecondary: AppColors.emeraldPrimary,
        surface: AppColors.lightSurface,
        onSurface: Color(0xFF1C1C1C),
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.lightBackground,
        foregroundColor: AppColors.emeraldPrimary,
        titleTextStyle: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.emeraldPrimary,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: AppColors.lightSurface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: AppColors.goldMuted.withValues(alpha: 0.6)),
        ),
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: AppColors.emeraldPrimary,
        unselectedLabelColor: Colors.grey.shade600,
        indicatorColor: AppColors.goldAccent,
        labelStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.lightSurface,
        indicatorColor: AppColors.goldMuted.withValues(alpha: 0.55),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              color: AppColors.emeraldPrimary,
            );
          }
          return GoogleFonts.inter(color: Colors.grey.shade600);
        }),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.emeraldPrimary,
        foregroundColor: AppColors.goldMuted,
      ),
    );
    return base.copyWith(textTheme: _interTextTheme(base.textTheme));
  }

  static ThemeData dark() {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBackground,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.emeraldLight,
        onPrimary: Colors.white,
        secondary: AppColors.goldAccent,
        onSecondary: AppColors.darkBackground,
        surface: AppColors.darkSurface,
        onSurface: Color(0xFFECECEC),
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.darkBackground,
        foregroundColor: AppColors.goldMuted,
        titleTextStyle: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.goldMuted,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: AppColors.darkSurface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: AppColors.emeraldLight.withValues(alpha: 0.35)),
        ),
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: AppColors.goldAccent,
        unselectedLabelColor: Colors.grey.shade500,
        indicatorColor: AppColors.goldAccent,
        labelStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.darkSurface,
        indicatorColor: AppColors.emeraldLight.withValues(alpha: 0.35),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              color: AppColors.goldAccent,
            );
          }
          return GoogleFonts.inter(color: Colors.grey.shade500);
        }),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.emeraldLight,
        foregroundColor: AppColors.goldMuted,
      ),
    );
    return base.copyWith(textTheme: _interTextTheme(base.textTheme));
  }
}
