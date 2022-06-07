// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';

class Colores {
  static const Color background = Color(0xFDFDFDFF);
}

class FontsFamily {
  static const String roboto = "Roboto";
  static const String montserrat = "Montserrat";
  static const String merriweather = "Merriweather";
}

class Variables {
  /*Direcciones internas de almacenamiento */
  static const String repoImage = "repoImage";
  /*Direccion de la app*/
  static const baseUrl = "https://srv.grupodime.com.mx/api/";

  static const googleKey = "AIzaSyC8JmD8bqNROOddjeIlWX0uOYCnqNPC_0o";

  static const String baseTarea = baseUrl + "tarea/";
  static const String baseClud = baseUrl + "archives/";
  static const String baseImage = baseUrl + "archives/usuarios/";
  static const String baseSearch = baseUrl + "tarea/list/1/10";
  static const String baseTipos = baseUrl + "tareas/types";
  static const String baseTypeName = baseUrl + "tareas/typenamed/";
}

class Assets {
  static const String rootpage = "assets/background/root_page.png";
  static const String bubbles = "assets/background/bubbles.png";

  static const String logo = "assets/logo/logo.png";
  static const String logo2 = "assets/logo/logo2.png";

  static const String svgGoogle = 'assets/svg/logos/google.svg';
  static const String svgFacebook = 'assets/svg/logos/facebook.svg';
}

class Medidas {
  static Size size = const Size(0, 0);
}

class URL {
  static const String base = "https://cursos.grupodime.com.mx/api/";
}

class BaseDeDatos {
  static const loginResponse = "loginResponse";
}
