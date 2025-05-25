import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF6200EE);
  static const Color secondaryColor = Color(0xFF03DAC6);
  static const Color errorColor = Color(0xFFB00020);
  static const Color backgroundColor = Color(0xFFF5F5F5);
  static const Color surfaceColor = Colors.white;
  static const Color onPrimaryColor = Colors.white;
  static const Color onSecondaryColor = Colors.black;
  static const Color onBackgroundColor = Colors.black;
  static const Color onSurfaceColor = Colors.black;
  static const Color onErrorColor = Colors.white;

  static final TextTheme textTheme = TextTheme(
    displayLarge: GoogleFonts.tajawal(fontSize: 32, fontWeight: FontWeight.bold),
    displayMedium: GoogleFonts.tajawal(fontSize: 28, fontWeight: FontWeight.bold),
    displaySmall: GoogleFonts.tajawal(fontSize: 24, fontWeight: FontWeight.bold),
    headlineMedium: GoogleFonts.tajawal(fontSize: 20, fontWeight: FontWeight.w600),
    headlineSmall: GoogleFonts.tajawal(fontSize: 18, fontWeight: FontWeight.w600),
    titleLarge: GoogleFonts.tajawal(fontSize: 16, fontWeight: FontWeight.w600),
    bodyLarge: GoogleFonts.tajawal(fontSize: 16, fontWeight: FontWeight.normal),
    bodyMedium: GoogleFonts.tajawal(fontSize: 14, fontWeight: FontWeight.normal),
    bodySmall: GoogleFonts.tajawal(fontSize: 12, fontWeight: FontWeight.normal),
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      error: errorColor,
      background: backgroundColor,
      surface: surfaceColor,
      onPrimary: onPrimaryColor,
      onSecondary: onSecondaryColor,
      onBackground: onBackgroundColor,
      onSurface: onSurfaceColor,
      onError: onErrorColor,
    ),
    textTheme: textTheme,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: primaryColor,
      foregroundColor: onPrimaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: onPrimaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: primaryColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: errorColor),
      ),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    ),
  );
}
