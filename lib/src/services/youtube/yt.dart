// ignore: unused_import
import 'dart:convert';
import 'package:lotto_music/src/cores/webDart/webcontroller.dart';

import '../../helpers/globals/ruts_services.dart';
import '../../models/youtube/estadisticvas_yt.dart';
import '../../models/youtube/youtube.dart';

class YTService {
  static const String _tops =
      "${URL.searchYT}&type=video&part=snippet&chart=mostPopular&regionCode=MX&safeSearch=none&maxResults=10&videoEmbeddable=true";
  static const String _relative =
      "${URL.searchYT}&type=video&maxResults=10&part=snippet&relatedToVideoId=";
  static const String _search =
      "${URL.searchYT}&type=video&maxResults=10&part=snippet&maxResults=10&q=";
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
    final out = YoutubeModel.fromJson(resp);
    return out;
  }

  static Future<YoutubeModel?> busqueda({required String query}) async {
    final urI = Uri.parse(_search + query.replaceAll(" ", "+"));
    final resp = await DartWeb.get(url: urI);
    if (resp == null) {
      return YoutubeModel();
    }
    final out = YoutubeModel.fromJson(resp);
    return out;
  }

  static Future<YoutubeModel> relative({required String ytID}) async {
    final urI = Uri.parse(_relative + ytID);
    final resp = await DartWeb.get(url: urI);
    if (resp == null) {
      return YoutubeModel();
    }
    final out = YoutubeModel.fromJson(resp);
    if (out.itemsyt?.isNotEmpty ?? false) {
      List<ItemYT> corrector = [];
      out.itemsyt?.forEach((element) {
        if (element.snippet != null) {
          corrector.add(element);
        }
      });
      out.itemsyt = corrector;
      return out;
    }
    return out;
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
