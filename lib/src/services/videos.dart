// ignore: unused_import
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lotto_music/src/models/videos.dart';

import '../helpers/variables_globales.dart';

class ServiceAuth {
  static const String _listar = URL.videos + "listar";

  static Future<VideosModel?> listar() async {
    try {
      final urI = Uri.parse(_listar);
      final resp = await http.get(
        urI,
        headers: {
          "Content-Type": "application/json",
        },
      );

      return VideosModel.fromJson(resp.body);
    } catch (e) {
      return null;
    }
  }
}
