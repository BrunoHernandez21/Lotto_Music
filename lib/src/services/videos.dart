// ignore: unused_import
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../helpers/variables_globales.dart';
import '../models/evento_video.dart';
import '../models/grupos.dart';

class VideoService {
  static const String _eventosPage = URL.videos + "/eventos";
  static const String _grupos = URL.videos + "/grupos";
  static Future<VideoEventModel?> listarEventos({required int pag}) async {
    final urI = Uri.parse(_eventosPage + "/" + pag.toString() + "/10");
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

  static Future<GruposModel?> listarGrupos() async {
    final urI = Uri.parse(_grupos);
    final resp = await http.get(
      urI,
    );
    final out = GruposModel.fromJson(resp.body);
    return out;
  }

  static Future<VideoEventModel?> listarVideosCategoria(
      {required int pag, required String categoria}) async {
    final urI = Uri.parse(_grupos + "/" + pag.toString() + "/10/" + categoria);
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
