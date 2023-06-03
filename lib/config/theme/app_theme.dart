import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
        useMaterial3: false,
        brightness: Brightness.light,
        colorSchemeSeed: const Color(0xFF2862F5),
      );
}
