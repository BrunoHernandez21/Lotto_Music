// ignore: unused_import
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../helpers/variables_globales.dart';
import '../models/carrito.dart';
import '../models/carrito_response.dart';

class CarritoService {
  static const String _carro = URL.carrito + "/carrito";
  static const String _load = URL.carrito + "/carrito/plan";

  static Future<CarritoResponse?> load({
    required String token,
  }) async {
    final urI = Uri.parse(_load);
    try {
      final resp = await http.get(
        urI,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer " + token,
        },
      );

      return CarritoResponse.fromJson(resp.body);
    } catch (e) {
      return null;
    }
  }

  static Future<CarritoModel?> create({
    required String token,
    required String body,
  }) async {
    final urI = Uri.parse(_carro);
    final resp = await http.post(
      urI,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer " + token,
      },
      body: body,
    );
    final out = CarritoModel.fromJson(resp.body);

    return out;
  }

  static Future<String?> eliminar(
      {required String token, required int id}) async {
    try {
      final urI = Uri.parse(_carro + "/" + id.toString());
      final resp = await http.delete(
        urI,
        headers: {
          "Authorization": "Bearer " + token,
        },
      );
      final deco = json.decode(resp.body);
      if (deco["mensaje"] == null) {
        return "Error de conexion";
      }
      if (deco["mensaje"].runtimeType == String) {
        return deco["mensaje"];
      }

      return null;
    } catch (e) {
      return null;
    }
  }
}
