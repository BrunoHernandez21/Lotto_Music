// ignore: unused_import
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lotto_music/src/models/plan_response.dart';

import '../helpers/variables_globales.dart';
import '../models/login_response.dart';

class PlanService {
  static const String _listar = URL.plan + "/planes";

  static Future<PlanesResponse?> load() async {
    try {
      final urI = Uri.parse(_listar);
      final resp = await http.get(
        urI,
        headers: {
          "Content-Type": "application/json",
        },
      );

      return PlanesResponse.fromJson(resp.body);
    } catch (e) {
      return null;
    }
  }

  static Future<LoginResponse?> byid() async {
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

  static Future<LoginResponse?> search({
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
}
