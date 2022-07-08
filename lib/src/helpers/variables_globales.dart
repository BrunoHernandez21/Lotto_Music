// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:lotto_music/src/models/carrito.dart';

import '../models/plan.dart';
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
  static const _baseUrl = "http://187.213.79.204:25565";

  static const googleKey = "AIzaSyC8JmD8bqNROOddjeIlWX0uOYCnqNPC_0o";

  static const String apuestas = _baseUrl + "/api/apuesta";
  static const String usuario = _baseUrl + "/api/auth";
  static const String carrito = _baseUrl + "/api/carrito";
  static const String compra = _baseUrl + "/api/compra";
  static const String evento = _baseUrl + "/api/evento";
  static const String plan = _baseUrl + "/api/plan";
  static const String suscribcion = _baseUrl + "/api/suscripcion";
  static const String videos = _baseUrl + "/api/videos";
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
  static const String _base = "http://187.213.77.165:25565/api/";
  static const String auth = _base + "auth";
  static const String videos = _base + "videos";
  static const String compra = _base + "compra";
  static const String carrito = _base + "carrito";
  static const String evento = _base + "evento";
  static const String plan = _base + "plan";
  static const String apuesta = _base + "apuesta";
}

class BaseDeDatos {
  static const loginResponse = "loginResponse";
}

class Developer {
  static final List<VideoModel> videos = [
    VideoModel(
        thumblary:
            "https://i1.sndcdn.com/artworks-000135289007-ddzvg9-t240x240.jpg",
        urlVideo:
            "https://i1.sndcdn.com/artworks-000135289007-ddzvg9-t240x240.jpg",
        artista: "Maluma",
        titulo: "Felices los 4"),
    VideoModel(
        thumblary:
            "https://www.mondosonoro.com/wp-content/uploads/2016/01/rihanna.jpg",
        urlVideo:
            "https://www.republica.com/wp-content/uploads/2014/11/Rihanna-ART4.jpg",
        titulo: "Rihanna"),
    VideoModel(
        thumblary:
            "https://www.adweek.com/wp-content/uploads/files/gunsroses-hed-2016.png.webp",
        urlVideo:
            "https://static.posters.cz/image/750/tablou-inramat-cu-geam-guns-n-roses-bullet-logo-i72451.jpg",
        titulo: "Guns and Roses"),
    VideoModel(
        thumblary:
            "https://m.media-amazon.com/images/I/51UtWpxbNYL._SX425_.jpg",
        urlVideo:
            "https://i.scdn.co/image/ab67616d0000b2735d48e2f56d691f9a4e4b0bdf",
        titulo: "Pink Floyd"),
    VideoModel(
        thumblary:
            "https://i.discogs.com/foX0_9-AU_suD8mZd9lGnkFfPtQ4TvWxw7IRXDfSLtQ/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTE3OTk4/NDIzLTE2MTg2ODcy/OTYtMTgyOS5qcGVn.jpeg",
        urlVideo:
            "https://lastfm.freetls.fastly.net/i/u/770x0/95ee2cb59610158832735aeb11ea990c.jpg",
        titulo: "Dua Lipa"),
    VideoModel(
        thumblary:
            "https://media.mutualart.com/Images/2022_02/10/00/004110475/c9b63e2d-2956-469f-99b6-996ed80ddcd2_338.Jpeg",
        urlVideo:
            "https://theregoesthefear.com/2015/12/album-review-coldplay-a-head-full-of-dreams.php",
        titulo: "Coldplay"),
    VideoModel(
        thumblary:
            "https://www.elpais.com.co/files/article_main_small/uploads/2020/05/29/5ed12ceb113c8.jpeg",
        urlVideo:
            "https://www.elpais.com.co/files/article_main_small/uploads/2020/05/29/5ed12ceb113c8.jpeg",
        titulo: "Christian Nodal"),
    VideoModel(
        thumblary:
            "https://enews.mx/foto/noticias/noticias_20220410011119_1247.jpg",
        urlVideo:
            "https://grupointocable.com/wp-content/uploads/ModusOperandiTour_CLT-scaled.jpg",
        titulo: "Intocable"),
  ];

  static final List<PlanModel> planes = [
    PlanModel(
      nombre: "Inicial",
      acumuladoAlto8Am: 1,
      acumuladoBajo8Pm: 1,
      aproximacionAlta00Am: 1,
      aproximacionBaja: 1,
      oportunidades: 4,
      precio: 50,
      activo: true,
      id: 0,
    ),
    PlanModel(
      nombre: "Medio",
      acumuladoAlto8Am: 1,
      acumuladoBajo8Pm: 1,
      aproximacionAlta00Am: 1,
      aproximacionBaja: 1,
      oportunidades: 4,
      precio: 250,
      activo: true,
      id: 0,
    ),
    PlanModel(
      nombre: "Alto",
      acumuladoAlto8Am: 1,
      acumuladoBajo8Pm: 1,
      aproximacionAlta00Am: 1,
      aproximacionBaja: 1,
      oportunidades: 4,
      precio: 1000,
      activo: true,
      id: 0,
    )
  ];

  static final List<CarritoModel> carrito = [
    CarritoModel(
      id: 1,
      activa: true,
      amount: 150,
      cantidad: 3,
      idCharges: null,
      idPlan: 1,
      ordenStatus: "proceso",
      usuarioId: 2,
    ),
    CarritoModel(
      id: 2,
      activa: true,
      amount: 500,
      cantidad: 2,
      idCharges: null,
      idPlan: 2,
      ordenStatus: "proceso",
      usuarioId: 2,
    ),
    CarritoModel(
      id: 3,
      activa: true,
      amount: 2000,
      cantidad: 2,
      idCharges: null,
      idPlan: 3,
      ordenStatus: "proceso",
      usuarioId: 2,
    ),
  ];
}
