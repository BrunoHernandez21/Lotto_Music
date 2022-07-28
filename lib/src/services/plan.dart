// ignore: unused_import
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lotto_music/src/models/plan_response.dart';

import '../helpers/variables_globales.dart';
import '../models/login_response.dart';

class PlanService {
  static const String _one = URL.plan + "/planes/one";
  static const String _suscripcion = URL.plan + "/planes/suscripcion";
  static const String _byid = URL.plan + "/byid/";
  static const String _byname = URL.plan + "/byname/oci";

  static Future<PlanesResponse?> loadPlan() async {
    final urI = Uri.parse(_one);
    final resp = await http.get(urI);
    return PlanesResponse.fromJson(resp.body);
  }

  static Future<PlanesResponse?> loadSuscripcion() async {
    try {
      final urI = Uri.parse(_suscripcion);
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
      final urI = Uri.parse(_byid);
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
      final urI = Uri.parse(_byname);
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
