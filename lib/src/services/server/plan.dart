// ignore: unused_import
import 'dart:convert';
import 'package:lotto_music/src/models/plan/plan_response.dart';

import '../../cores/webDart/webcontroller.dart';
import '../../helpers/globals/routes_services.dart';

class PlanService {
  static const String _one = "${URL.plan}/plans/single-payment";
  static const String _suscripcion = "${URL.plan}/plans/suscripcion";
  static const String _byid = "${URL.plan}/byid/";
  static const String _byname = "${URL.plan}/byname/";

  static Future<PlanesResponse> loadPlan() async {
    final urI = Uri.parse(_one);
    final resp = await DartWeb.get(url: urI);
    if (resp == null) {
      return PlanesResponse(mensaje: "error de comunicacion con el servidor");
    }
    return PlanesResponse.fromJson(resp);
  }

  static Future<PlanesResponse> loadSuscripcion() async {
    final urI = Uri.parse(_suscripcion);
    final resp = await DartWeb.get(url: urI);
    if (resp == null) {
      return PlanesResponse(mensaje: "error de comunicacion con el servidor");
    }
    return PlanesResponse.fromJson(resp);
  }

  static Future<PlanesResponse> byid() async {
    final urI = Uri.parse(_byid);
    final resp = await DartWeb.get(url: urI);
    if (resp == null) {
      return PlanesResponse(mensaje: "error de comunicacion con el servidor");
    }
    return PlanesResponse.fromJson(resp);
  }

  static Future<PlanesResponse> search({
    required String name,
  }) async {
    final urI = Uri.parse(_byname + name);
    final resp = await DartWeb.get(url: urI);
    if (resp == null) {
      return PlanesResponse(mensaje: "error de comunicacion con el servidor");
    }
    return PlanesResponse.fromJson(resp);
  }
}
