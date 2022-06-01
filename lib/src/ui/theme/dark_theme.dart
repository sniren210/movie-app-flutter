import 'package:flutter/material.dart';

ThemeData get darkTheme => ThemeData.from(
      colorScheme: ColorScheme.dark(
        brightness: Brightness.dark,
        primary: Colors.black,
        primaryContainer: Colors.black,
        onPrimary: Colors.white,
        secondary: Colors.green,
        secondaryContainer: Colors.green.shade700,
        onSecondary: Colors.white,
        surface: const Color(0xFF141414),
        onSurface: Colors.white,
        background: Colors.black,
        onBackground: Colors.white,
        error: Colors.red,
        onError: Colors.white,
      ),
      useMaterial3: true,
    );
