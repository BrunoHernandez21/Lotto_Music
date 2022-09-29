// ignore: unused_import
import 'dart:convert';
import 'package:lotto_music/src/models/event/userevent.dart';

import '../../cores/webDart/webcontroller.dart';
import '../../helpers/globals/routes_services.dart';
import '../../models/event/ganador_response.dart';
import '../../models/event/historial_event_user.dart';

class UserEventService {
  static const String _crear = "${URL.userEvent}/event";
  static const String _activos = "${URL.userEvent}/active";
  static const String _inactivos = "${URL.userEvent}/history";
  static const String _wins = "${URL.userEvent}/wins";

  static Future<UserEventModel> crear({
    required String token,
    required UserEventModel apuesta,
  }) async {
    final urI = Uri.parse(_crear);
    final resp = await DartWeb.post(
      url: urI,
      token: token,
      body: apuesta.toMap(),
    );
    if (resp == null) {
      return UserEventModel(mensaje: "error de comunicacion con el servidor");
    }
    return UserEventModel.fromJson(resp);
  }

  static Future<HistorialEventoUsuario> listarActivos({
    required int pag,
    required String token,
  }) async {
    final urI = Uri.parse("$_activos/$pag/10");
    final resp = await DartWeb.get(
      url: urI,
      token: token,
    );
    if (resp == null) {
      return HistorialEventoUsuario(
        mensaje: "error de comunicacion con el servidor",
      );
    }
    final out = HistorialEventoUsuario.fromJson(resp);
    return out;
  }

  static Future<HistorialEventoUsuario> listarInactivos({
    required int pag,
    required String token,
  }) async {
    final urI = Uri.parse("$_inactivos/$pag/10");
    final resp = await DartWeb.get(
      url: urI,
      token: token,
    );
    if (resp == null) {
      return HistorialEventoUsuario(
        mensaje: "error de comunicacion con el servidor",
      );
    }
    final out = HistorialEventoUsuario.fromJson(resp);
    return out;
  }

  static Future<GanadorResponse> wins({
    required int pag,
    required String token,
  }) async {
    final urI = Uri.parse('$_wins/${pag.toString()}/10');
    final resp = await DartWeb.get(
      url: urI,
      token: token,
    );
    if (resp == null) {
      return GanadorResponse(mensaje: "error de comunicacion con el servidor");
    }
    final out = GanadorResponse.fromJson(resp);
    return out;
  }
}
