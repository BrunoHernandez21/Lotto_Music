// ignore: unused_import
import 'dart:convert';
import 'package:lotto_music/src/models/video/stadistics_response.dart';

import '../../cores/webDart/webcontroller.dart';
import '../../helpers/globals/ruts_services.dart';
import '../../models/video/evento_video.dart';
import '../../models/video/grupos.dart';

class VideoService {
  static const String _eventosPage = "${URL.videos}/events/";
  static const String _grupos = "${URL.videos}/groups";
  static const String _st = "${URL.videos}/statistics";

  static Future<VideoEventModel> listarEventos({required int pag}) async {
    final urI = Uri.parse("$_eventosPage$pag/10");
    final resp = await DartWeb.get(url: urI);
    if (resp == null) {
      return VideoEventModel(mensaje: "error de comunicacion con el servidor");
    }
    final out = VideoEventModel.fromJson(resp);
    return out;
  }

  static Future<GruposModel> listarGrupos() async {
    final urI = Uri.parse(_grupos);
    final resp = await DartWeb.get(url: urI);
    if (resp == null) {
      return GruposModel(mensaje: "error de comunicacion con el servidor");
    }
    final out = GruposModel.fromJson(resp);
    return out;
  }

  static Future<StadisticsResponse> estadisticas() async {
    final urI = Uri.parse(_st);
    final resp = await DartWeb.get(
      url: urI,
    );
    if (resp == null) {
      return StadisticsResponse(
          mensaje: "error de comunicacion con el servidor");
    }
    final out = StadisticsResponse.fromJson(resp);
    return out;
  }

  static Future<VideoEventModel> listarVideosCategoria(
      {required int pag, required String categoria}) async {
    final urI = Uri.parse("$_grupos/$pag/10/$categoria");

    final resp = await DartWeb.get(url: urI);
    if (resp == null) {
      return VideoEventModel(mensaje: "error de comunicacion con el servidor");
    }
    final out = VideoEventModel.fromJson(resp);
    return out;
  }
}
