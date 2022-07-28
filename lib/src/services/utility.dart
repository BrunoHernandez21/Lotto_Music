// ignore: unused_import
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../helpers/variables_globales.dart';
import '../models/cartera.dart';
import '../models/evento_video.dart';
import '../models/ganador.dart';

class UtilityService {
  static const String _clock = URL.utility + "/oclock";
  static const String _cartera = URL.utility + "/cartera";
  static const String _wins = URL.utility + "/wins";

  static Future<VideoEventModel?> hora({required int pag}) async {
    final urI = Uri.parse(_clock + "/" + pag.toString() + "/10");
    final resp = await http.get(
      urI,
    );
    final out = VideoEventModel.fromJson(resp.body);
    return out;
  }

  static Future<Cartera?> cartera({required String token}) async {
    final urI = Uri.parse(_cartera);
    final resp = await http.get(urI, headers: {
      "Authorization": "Bearer " + token,
    });
    final out = Cartera.fromJson(resp.body);
    return out;
  }

  static Future<GanadorModel?> wins({
    required int pag,
    required String token,
  }) async {
    final urI = Uri.parse(_wins + "/" + pag.toString() + '/10');
    final resp = await http.get(urI, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + token,
    });

    final out = GanadorModel.fromJson(resp.body);
    return out;
  }
}
