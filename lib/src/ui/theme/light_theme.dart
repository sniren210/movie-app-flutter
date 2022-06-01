import 'package:flutter/material.dart';

ThemeData get lightTheme => ThemeData.from(
      colorScheme: ColorScheme.light(
        brightness: Brightness.light,
        primary: Colors.pink,
        primaryContainer: Colors.pink,
        onPrimary: Colors.white,
        secondary: Colors.green,
        secondaryContainer: Colors.green.shade700,
        onSecondary: Colors.white,
        surface: const Color(0xFFF8F8F8),
        onSurface: Colors.black,
        background: Colors.white,
        onBackground: Colors.black,
        error: Colors.red,
        onError: Colors.white,
      ),
      useMaterial3: true,
    );
