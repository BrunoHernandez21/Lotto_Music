// ignore: unused_import
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lotto_music/src/models/apuesta.dart';

import '../helpers/variables_globales.dart';
import '../models/historial_event_user.dart';
import '../models/login_response.dart';

class ApuestaService {
  static const String _listar = URL.apuesta + "listar";
  static const String _apuesta = URL.apuesta + "/apuesta";

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

  static Future<ApuestaModel?> crear({
    required String token,
    required ApuestaModel apuesta,
  }) async {
    try {
      final urI = Uri.parse(_apuesta);
      final resp = await http.post(
        urI,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer " + token,
        },
        body: apuesta.toJson(),
      );

      return ApuestaModel.fromJson(resp.body);
    } catch (e) {
      return null;
    }
  }

  static Future<LoginResponse?> activo({
    required String email,
    required String password,
  }) async {
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

  static Future<LoginResponse?> activoPage({
    required String email,
    required String password,
  }) async {
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

  static Future<HistorialEventosUsuario?> listarHistory({
    required int pag,
    required String token,
  }) async {
    final urI = Uri.parse(_apuesta + "/" + pag.toString() + "/10");
    final resp = await http.get(
      urI,
      headers: {
        "Authorization": "Bearer " + token,
      },
    );
    final out = HistorialEventosUsuario.fromJson(resp.body);
    return out;
  }
}
