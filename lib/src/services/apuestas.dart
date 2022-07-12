// ignore: unused_import
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../helpers/variables_globales.dart';
import '../models/historial_event_user.dart';
import '../models/login_response.dart';

class ApuestaService {
  static const String _listar = URL.apuesta + "listar";
  static const String _histoyry = URL.apuesta + "/apuesta";

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

  static Future<LoginResponse?> crear({
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
    final urI = Uri.parse(_histoyry + "/" + pag.toString() + "/10");
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
