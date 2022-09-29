// ignore: unused_import
import 'dart:convert';
import 'package:lotto_music/src/cores/webDart/webcontroller.dart';
import 'package:lotto_music/src/models/youtube/tops_yt.dart';

import '../../helpers/globals/routes_services.dart';
import '../../models/youtube/estadisticvas_yt.dart';
import '../../models/youtube/search_yt.dart';
import '../../models/youtube/youtube.dart';

class YTService {
  static const String _tops =
      "${URL.listItems}&part=snippet&playlistId=PLfk71Rp386qg1iKVVrU_A3xnRfHIoV_Im&maxResults=10";
  static const String _relative =
      "${URL.searchYT}&type=video&maxResults=5&part=snippet&relatedToVideoId=";
  static const String _search =
      "${URL.searchYT}&type=video&maxResults=5&part=snippet&maxResults=10&q=";
  static const String _estadisticas = "${URL.estYT}&part=statistics&id=";
/////////////////////////////
  /// separador
  static Future<YoutubeModel> top() async {
    final urI = Uri.parse(_tops);
    final resp = await DartWeb.get(
      url: urI,
    );

    if (resp == null) {
      return YoutubeModel();
    }
    final out = TopYoutube.fromJson(resp);
    return out.toYouModel();
  }

  static Future<YoutubeModel> busqueda({required String query}) async {
    final urI = Uri.parse(_search + query.replaceAll(" ", "+"));
    final resp = await DartWeb.get(url: urI);
    if (resp == null) {
      return YoutubeModel();
    }
    final out = SearchYoutube.fromJson(resp);
    return out.toYouModel();
  }

  static Future<YoutubeModel> relative({required String ytID}) async {
    final urI = Uri.parse(_relative + ytID);
    final resp = await DartWeb.get(url: urI);
    if (resp == null) {
      return YoutubeModel();
    }
    final out = SearchYoutube.fromJson(resp);
    return out.toYouModel();
  }

  static Future<EstadisticasYt?> estadisticas({required String ytID}) async {
    final urI = Uri.parse(_estadisticas + ytID);
    final resp = await DartWeb.get(url: urI);
    if (resp == null) {
      return EstadisticasYt();
    }
    final out = EstadisticasYt.fromJson(resp);
    return out;
  }
}
