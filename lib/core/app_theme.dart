import 'package:flutter/material.dart';

class AppTheme {
  // --- Light palette ---
  static const _lightBg = Color(0xFFF5F0E8); // warm parchment
  static const _lightSurface = Color(0xFFFCF8F2); // soft cream
  static const _lightPrimary = Color(0xFF5C7A6B); // muted sage green
  static const _lightSecondary = Color(0xFF8B6F5C); // warm brown
  static const _lightOnBg = Color(0xFF2C2416); // dark walnut text
  static const _lightOnSurface = Color(0xFF3D3124); // slightly lighter
  static const _lightHint = Color(0xFF9A8E7E); // muted hint text

  // --- Dark palette ---
  static const _darkBg = Color(0xFF1A1A14); // deep warm black
  static const _darkSurface = Color(0xFF242318); // dark olive surface
  static const _darkPrimary = Color(
    0xFF7FA98F,
  ); // soft sage (brighter for dark)
  static const _darkSecondary = Color(0xFFB89A85); // warm tan
  static const _darkOnBg = Color(0xFFEDE4D4); // warm off-white text
  static const _darkOnSurface = Color(0xFFD4C9B5); // slightly dimmer
  static const _darkHint = Color(0xFF6B6555); // muted hint

  static ThemeData get light => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: _lightBg,
    colorScheme: const ColorScheme.light(
      surface: _lightSurface,
      primary: _lightPrimary,
      secondary: _lightSecondary,
      onSurface: _lightOnBg,
      surfaceContainerHighest: _lightBg, // for scaffold bg
    ),
    fontFamily: 'Lora', // add to pubspec + google_fonts
    appBarTheme: const AppBarTheme(
      backgroundColor: _lightBg,
      elevation: 0,
      foregroundColor: _lightOnBg,
    ),
    cardTheme: CardThemeData(
      color: _lightSurface,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _lightSurface,
      hintStyle: const TextStyle(color: _lightHint),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: _lightOnBg, fontWeight: FontWeight.w700),
      bodyLarge: TextStyle(color: _lightOnBg, fontSize: 16, height: 1.6),
      bodyMedium: TextStyle(color: _lightOnSurface, fontSize: 14, height: 1.5),
      labelSmall: TextStyle(color: _lightHint, fontSize: 12),
    ),
  );

  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: _darkBg,
    colorScheme: const ColorScheme.dark(
      surface: _darkSurface,
      primary: _darkPrimary,
      secondary: _darkSecondary,
      onSurface: _darkOnBg,
      surfaceContainerHighest: _darkBg,
    ),
    fontFamily: 'Lora',
    appBarTheme: const AppBarTheme(
      backgroundColor: _darkBg,
      elevation: 0,
      foregroundColor: _darkOnBg,
    ),
    cardTheme: CardThemeData(
      color: _darkSurface,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _darkSurface,
      hintStyle: const TextStyle(color: _darkHint),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: _darkOnBg, fontWeight: FontWeight.w700),
      bodyLarge: TextStyle(color: _darkOnBg, fontSize: 16, height: 1.6),
      bodyMedium: TextStyle(color: _darkOnSurface, fontSize: 14, height: 1.5),
      labelSmall: TextStyle(color: _darkHint, fontSize: 12),
    ),
  );
}
