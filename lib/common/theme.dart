import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        color: Color(0xFF4CAF50),
        titleTextStyle: TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: 20,
        ),
      ),
      primaryColorDark: const Color(0xFF080713),
      primaryColorLight: const Color(0xFF4CAF50),
      primaryColor: const Color(0xFF4CAF50),
      colorScheme: const ColorScheme.light(secondary: Color(0xFF4CAF50)),
      scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(color: Color(0xFF0F3D10)),
      primaryColorDark: const Color(0xFF080713),
      primaryColorLight: const Color(0xFF4CAF50),
      primaryColor: const Color(0xFF4CAF50),
      colorScheme: const ColorScheme.light(secondary: Color(0xFF4CAF50)),
      scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
