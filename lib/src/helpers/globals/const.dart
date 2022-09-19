import 'package:flutter/material.dart';

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
  ThemeData darkTeam = ThemeData.dark().copyWith();
  ThemeData darkLight = ThemeData.light().copyWith();
}
