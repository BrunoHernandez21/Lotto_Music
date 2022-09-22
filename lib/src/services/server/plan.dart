// ignore: unused_import
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lotto_music/src/models/plan/plan_response.dart';

import '../../helpers/globals/ruts_services.dart';

class PlanService {
  static const String _one = "${URL.plan}/plans/single-payment";
  static const String _suscripcion = "${URL.plan}/plans/suscripcion";
  static const String _byid = "${URL.plan}/byid/";
  static const String _byname = "${URL.plan}/byname/";

  static Future<PlanesResponse?> loadPlan() async {
    try {
      final urI = Uri.parse(_one);
      final resp = await http.get(urI);
      return PlanesResponse.fromJson(resp.body);
    } catch (e) {
      return null;
    }
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

  static Future<PlanesResponse?> byid() async {
    try {
      final urI = Uri.parse(_byid);
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

  static Future<PlanesResponse?> search({
    required String name,
  }) async {
    try {
      final urI = Uri.parse(_byname + name);
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
}
