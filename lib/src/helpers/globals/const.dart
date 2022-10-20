import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotto_music/src/bloc/shaderPreferences/shaderpreferences_bloc.dart';

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
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light,
          ),
        ),
  );
  static ThemeData light = ThemeData.light().copyWith(
    appBarTheme: ThemeData.dark().appBarTheme.copyWith(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark,
          ),
        ),
  );
  static ThemeData getTheme(bool isDark) {
    if (isDark) {
      return dark;
    }
    return light;
  }

  static ThemeData getThemes(
    BuildContext context,
  ) {
    if (BlocProvider.of<ShaderpreferencesBloc>(context).state.isDarkTheme) {
      return dark;
    }
    return light;
  }
}
