// ignore: unused_import
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../helpers/variables_globales.dart';
import '../models/evento_video.dart';

class VideoService {
  static const String _eventosPage = URL.videos + "/eventos/";

  static Future<VideoEventModel?> listarEventos({required int pag}) async {
    final urI = Uri.parse(_eventosPage + pag.toString() + "/10");
    final resp = await http.get(
      urI,
    );
    final out = VideoEventModel.fromJson(resp.body);
    print(out.toJson());
    return out;
  }
}
