// ignore: unused_import
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lotto_music/src/models/event/userevent.dart';

import '../../helpers/variables_globales.dart';
import '../../models/event/ganador_response.dart';
import '../../models/event/historial_event_user.dart';
import '../../models/auth/login_response.dart';

class UserEventService {
  static const String _listar = "${URL.userEvent}listar";
  static const String _apuesta = "${URL.userEvent}/evento";
  static const String _wins = "${URL.userEvent}/wins";

  static Future<LoginResponse?> listar() async {
    try {
      final urI = Uri.parse(_listar);
      final resp = await http.get(
        urI,
        headers: {
          "Content-Type": "application/json",
        },
      );

      return LoginResponse.fromJson(resp.body);
    } catch (e) {
      return null;
    }
  }

  static Future<UserEventModel?> crear({
    required String token,
    required UserEventModel apuesta,
  }) async {
    try {
      final urI = Uri.parse(_apuesta);
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
    final urI = Uri.parse("$_apuesta/$pag/10");
    final resp = await http.get(
      urI,
      headers: {
        "Authorization": "Bearer $token",
      },
    );
    final out = HistorialEventoUsuario.fromJson(resp.body);
    return out;
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
