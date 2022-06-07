// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';

import '../models/videos.dart';

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

class Developer {
  static final List<Video_Model> videos = [
    Video_Model(
        image:
            "https://i1.sndcdn.com/artworks-000135289007-ddzvg9-t240x240.jpg",
        link: "https://i1.sndcdn.com/artworks-000135289007-ddzvg9-t240x240.jpg",
        name: "Maluma"),
    Video_Model(
        image:
            "https://www.mondosonoro.com/wp-content/uploads/2016/01/rihanna.jpg",
        link:
            "https://www.republica.com/wp-content/uploads/2014/11/Rihanna-ART4.jpg",
        name: "Rihanna"),
    Video_Model(
        image:
            "https://www.adweek.com/wp-content/uploads/files/gunsroses-hed-2016.png.webp",
        link:
            "https://static.posters.cz/image/750/tablou-inramat-cu-geam-guns-n-roses-bullet-logo-i72451.jpg",
        name: "Guns and Roses"),
    Video_Model(
        image: "https://m.media-amazon.com/images/I/51UtWpxbNYL._SX425_.jpg",
        link:
            "https://i.scdn.co/image/ab67616d0000b2735d48e2f56d691f9a4e4b0bdf",
        name: "Pink Floyd"),
    Video_Model(
        image:
            "https://i.discogs.com/foX0_9-AU_suD8mZd9lGnkFfPtQ4TvWxw7IRXDfSLtQ/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTE3OTk4/NDIzLTE2MTg2ODcy/OTYtMTgyOS5qcGVn.jpeg",
        link:
            "https://lastfm.freetls.fastly.net/i/u/770x0/95ee2cb59610158832735aeb11ea990c.jpg",
        name: "Dua Lipa"),
    Video_Model(
        image:
            "https://media.mutualart.com/Images/2022_02/10/00/004110475/c9b63e2d-2956-469f-99b6-996ed80ddcd2_338.Jpeg",
        link:
            "https://theregoesthefear.com/2015/12/album-review-coldplay-a-head-full-of-dreams.php",
        name: "Coldplay"),
    Video_Model(
        image:
            "https://www.elpais.com.co/files/article_main_small/uploads/2020/05/29/5ed12ceb113c8.jpeg",
        link:
            "https://www.elpais.com.co/files/article_main_small/uploads/2020/05/29/5ed12ceb113c8.jpeg",
        name: "Christian Nodal"),
    Video_Model(
        image:
            "https://enews.mx/foto/noticias/noticias_20220410011119_1247.jpg",
        link:
            "https://grupointocable.com/wp-content/uploads/ModusOperandiTour_CLT-scaled.jpg",
        name: "Intocable"),
  ];
}
