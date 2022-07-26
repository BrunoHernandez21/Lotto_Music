// ignore: unused_import
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../helpers/variables_globales.dart';
import '../models/youtube.dart';

class YTService {
  static const String _tops = URL.searchYT +
      "&type=video&part=snippet&chart=mostPopular&regionCode=MX&safeSearch=none&maxResults=10&videoEmbeddable=true";
  static const String _relative =
      URL.searchYT + "&type=video&maxResults=10&part=snippet&relatedToVideoId=";
  static const String _search =
      URL.searchYT + "&type=video&maxResults=10&part=snippet&maxResults=10&q=";
/////////////////////////////
  /// separador
  static Future<YoutubeModel?> top() async {
    final urI = Uri.parse(_tops);
    final resp = await http.get(
      urI,
    );
    final out = YoutubeModel.fromJson(resp.body);
    return out;
  }

  static Future<YoutubeModel?> busqueda({required String query}) async {
    final urI = Uri.parse(_search + query.replaceAll(" ", "+"));
    final resp = await http.get(
      urI,
    );
    final out = YoutubeModel.fromJson(resp.body);
    return out;
  }

  static Future<YoutubeModel?> relative({required String ytID}) async {
    final urI = Uri.parse(_relative + ytID);
    final resp = await http.get(
      urI,
    );
    final out = YoutubeModel.fromJson(resp.body);
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
}