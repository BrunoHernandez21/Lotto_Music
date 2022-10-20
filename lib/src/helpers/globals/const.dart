import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Variables {
  static const List<String> estadosDireccion = [
    "default",
    "Casa",
    "Cobrar recompensa",
    "Otros",
  ];

  static const List<String> estadosTarjeta = [
    "Credito",
    "Debito",
  ];
}

class AppThemeData {
  static ThemeData dark = ThemeData.dark().copyWith(
    appBarTheme: ThemeData.dark().appBarTheme.copyWith(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.black,
            systemNavigationBarColor: Colors.black,
            statusBarBrightness: Brightness.dark,
            systemNavigationBarIconBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,
          ),
        ),
  );
  static ThemeData light = ThemeData.light().copyWith(
    appBarTheme: ThemeData.dark().appBarTheme.copyWith(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            systemNavigationBarColor: Colors.white,
            statusBarBrightness: Brightness.light,
            systemNavigationBarIconBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
  );
  static ThemeData getTheme(bool isDark) {
    if (isDark) {
      return dark;
    }
    return light;
  }
}
