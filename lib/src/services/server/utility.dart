// ignore: unused_import
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../helpers/variables_globales.dart';
import '../../models/video/evento_video.dart';

class UtilityService {
  static const String _clock = "${URL.utility}/oclock";

  static Future<VideoEventModel?> hora({required int pag}) async {
    try {
      final urI = Uri.parse("$_clock/$pag/10");
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
