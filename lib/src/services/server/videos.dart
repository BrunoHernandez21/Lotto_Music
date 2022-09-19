// ignore: unused_import
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lotto_music/src/models/video/stadistics_response.dart';

import '../../helpers/variables_globales.dart';
import '../../models/video/evento_video.dart';
import '../../models/video/grupos.dart';

class VideoService {
  static const String _eventosPage = "${URL.videos}/events/";
  static const String _grupos = "${URL.videos}/groups";
  static const String _st = "${URL.videos}/statistics";

  static Future<VideoEventModel?> listarEventos({required int pag}) async {
    final urI = Uri.parse("$_eventosPage$pag/10");
    try {
      final resp = await http.get(
        urI,
        headers: {
          "Content-Type": "application/json; charset=utf-8",
        },
      );
      final out = VideoEventModel.fromJson(utf8.decode(resp.bodyBytes));
      return out;
    } catch (e) {
      return null;
    }
  }

  static Future<GruposModel?> listarGrupos() async {
    try {
      final urI = Uri.parse(_grupos);
      final resp = await http.get(
        urI,
      );
      final out = GruposModel.fromJson(resp.body);
      return out;
    } catch (e) {
      return null;
    }
  }

  static Future<StadisticsResponse?> estadisticas() async {
    try {
      final urI = Uri.parse(_st);
      final resp = await http.get(
        urI,
      );
      final out = StadisticsResponse.fromJson(resp.body);
      return out;
    } catch (e) {
      return null;
    }
  }

  static Future<VideoEventModel?> listarVideosCategoria(
      {required int pag, required String categoria}) async {
    final urI = Uri.parse("$_grupos/$pag/10/$categoria");
    try {
      final resp = await http.get(
        urI,
      );
      final out = VideoEventModel.fromJson(resp.body);
      return out;
    } catch (e) {
      return null;
    }
  }
}
