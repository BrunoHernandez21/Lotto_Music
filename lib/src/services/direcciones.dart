// ignore: unused_import
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../helpers/variables_globales.dart';
import '../models/direcciones.dart';
import '../models/direcciones_response.dart';

class DireccionesServices {
  static const String _direccion = URL.auth + "/direccion";

  static Future<DireccionesModel?> update({
    required DireccionesModel direccion,
    required String token,
  }) async {
    try {
      final urI = Uri.parse(_direccion);
      final resp = await http.put(
        urI,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer " + token,
        },
        body: direccion.toJson(),
      );

      return DireccionesModel.fromJson(resp.body);
    } catch (e) {
      return null;
    }
  }

  static Future<DireccionesResponse?> load({
    required String token,
  }) async {
    try {
      final urI = Uri.parse(_direccion);
      final resp = await http.get(
        urI,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer " + token,
        },
      );

      return DireccionesResponse.fromJson(resp.body);
    } catch (e) {
      return null;
    }
  }

  static Future<DireccionesModel?> create({
    required DireccionesModel direccion,
    required String token,
  }) async {
    try {
      final urI = Uri.parse(_direccion);
      final resp = await http.post(
        urI,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer " + token,
        },
        body: direccion.toJson(),
      );

      return DireccionesModel.fromJson(resp.body);
    } catch (e) {
      return null;
    }
  }

  static Future<String?> remove({
    required int id,
    required String token,
  }) async {
    try {
      final urI = Uri.parse(_direccion + "/" + id.toString());
      final resp = await http.delete(
        urI,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer " + token,
        },
      );

      return json.decode(resp.body)["resp"];
    } catch (e) {
      return null;
    }
  }
}
