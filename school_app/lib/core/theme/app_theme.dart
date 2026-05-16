import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.surfLight,
      background: AppColors.bgLight,
      error: AppColors.danger,
    ),
    scaffoldBackgroundColor: AppColors.bgLight,
    textTheme: GoogleFonts.baloo2TextTheme().copyWith(
      bodyLarge: GoogleFonts.baloo2(
        color: AppColors.textLight, fontSize: 16),
      bodyMedium: GoogleFonts.baloo2(
        color: AppColors.textLight, fontSize: 14),
      titleLarge: GoogleFonts.baloo2(
        color: AppColors.textLight, fontSize: 20, fontWeight: FontWeight.w800),
    ),
    cardTheme: CardTheme(
      color: AppColors.surfLight,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: const BorderSide(color: AppColors.borderLight, width: 1),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.surfLight,
      foregroundColor: AppColors.textLight,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: GoogleFonts.baloo2(
        color: AppColors.primary, fontSize: 16, fontWeight: FontWeight.w800),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.surfLight,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.text3Light,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surf2Light,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: const BorderSide(color: AppColors.borderLight),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: const BorderSide(color: AppColors.borderLight),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        textStyle: GoogleFonts.baloo2(fontWeight: FontWeight.w700, fontSize: 15),
      ),
    ),
  );

  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF7986CB),
      secondary: Color(0xFF9575CD),
      surface: AppColors.surfDark,
      background: AppColors.bgDark,
      error: Color(0xFFEF5350),
    ),
    scaffoldBackgroundColor: AppColors.bgDark,
    textTheme: GoogleFonts.baloo2TextTheme().copyWith(
      bodyLarge: GoogleFonts.baloo2(
        color: AppColors.textDark, fontSize: 16),
      bodyMedium: GoogleFonts.baloo2(
        color: AppColors.textDark, fontSize: 14),
      titleLarge: GoogleFonts.baloo2(
        color: AppColors.textDark, fontSize: 20, fontWeight: FontWeight.w800),
    ),
    cardTheme: CardTheme(
      color: AppColors.surfDark,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: const BorderSide(color: AppColors.borderDark, width: 1),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.surfDark,
      foregroundColor: AppColors.textDark,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: GoogleFonts.baloo2(
        color: const Color(0xFF7986CB), fontSize: 16, fontWeight: FontWeight.w800),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.surfDark,
      selectedItemColor: Color(0xFF7986CB),
      unselectedItemColor: AppColors.text3Dark,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surf2Dark,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: const BorderSide(color: AppColors.borderDark),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: const BorderSide(color: AppColors.borderDark),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: const BorderSide(color: Color(0xFF7986CB), width: 1.5),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF7986CB),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        textStyle: GoogleFonts.baloo2(fontWeight: FontWeight.w700, fontSize: 15),
      ),
    ),
  );
}
