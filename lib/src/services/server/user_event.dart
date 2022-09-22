// ignore: unused_import
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lotto_music/src/models/event/userevent.dart';

import '../../helpers/globals/ruts_services.dart';
import '../../models/event/ganador_response.dart';
import '../../models/event/historial_event_user.dart';

class UserEventService {
  static const String _crear = "${URL.userEvent}/event";
  static const String _listar = "${URL.userEvent}/active";
  static const String _apuesta = "${URL.userEvent}/history";
  static const String _wins = "${URL.userEvent}/wins";

  static Future<UserEventModel?> crear({
    required String token,
    required UserEventModel apuesta,
  }) async {
    try {
      final urI = Uri.parse(_crear);
      final resp = await http.post(
        urI,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: apuesta.toJson(),
      );
      return UserEventModel.fromJson(resp.body);
    } catch (e) {
      return null;
    }
  }

  static Future<HistorialEventoUsuario?> listarHistory({
    required int pag,
    required String token,
  }) async {
    try {
      final urI = Uri.parse("$_apuesta/$pag/10");
      final resp = await http.get(
        urI,
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      final out = HistorialEventoUsuario.fromJson(resp.body);
      return out;
    } catch (e) {
      return null;
    }
  }

  static Future<HistorialEventoUsuario?> listarHistoryActive({
    required int pag,
    required String token,
  }) async {
    try {
      final urI = Uri.parse("$_listar/$pag/10");
      final resp = await http.get(
        urI,
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      final out = HistorialEventoUsuario.fromJson(resp.body);
      return out;
    } catch (e) {
      return null;
    }
  }

  static Future<GanadorResponse?> wins({
    required int pag,
    required String token,
  }) async {
    try {
      final urI = Uri.parse('$_wins/${pag.toString()}/10');
      final resp = await http.get(
        urI,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      final out = GanadorResponse.fromJson(resp.body);
      return out;
    } catch (e) {
      return null;
    }
  }
}
