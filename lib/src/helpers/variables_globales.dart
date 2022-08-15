// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';

class PKey {
  static const String ytKey = "key=AIzaSyDJGZnO3AZ2fkYOctsTClRVuShJWRMpCt8";
}

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

class Assets {
  static const String emptyCart = "assets/svg/imagenes/empty_card.svg";
  static const String refresh = "assets/svg/imagenes/refresh.svg";
  static const String login = "assets/svg/imagenes/authentication.svg";

  static const String rootpage = "assets/background/root_page.png";
  static const String logo = "assets/logo/logo.png";
  static const String logo2 = "assets/logo/logo2.png";

  static const String svgGoogle = 'assets/svg/logos/google.svg';
  static const String svgFacebook = 'assets/svg/logos/facebook.svg';
  static const String svgvideo = 'assets/svg/imagenes/video.svg';
}

class Medidas {
  static Size size = const Size(0, 0);
}

class URL {
  static const String _base = "http://187.213.68.250:25566/api/v3/";
  static const String _baseYT = "https://www.googleapis.com/youtube/v3";
  static const String searchYT = "$_baseYT/search?${PKey.ytKey}";
  static const String estYT = "$_baseYT/videos?${PKey.ytKey}";

  static const String auth = "${_base}auth";
  static const String videos = "${_base}videos";
  static const String compra = "${_base}compra";
  static const String carrito = "${_base}carrito";
  static const String evento = "${_base}evento";
  static const String plan = "${_base}plan";
  static const String apuesta = "${_base}usuario";
  static const String utility = "${_base}utils";
}

class LocalStorage {
  /*Direcciones internas de almacenamiento */
  static const String repoImage = "repoImage";
  static const loginResponse = "loginResponse";
}

class Colores {
  static const Color background = Color(0xFDFDFDFF);
}

class FontsFamily {
  static const String roboto = "Roboto";
  static const String montserrat = "Montserrat";
  static const String merriweather = "Merriweather";
}

class Developer {}
