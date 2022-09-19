// ignore: unused_import
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../helpers/variables_globales.dart';
import '../../models/carrito/carrito.dart';
import '../../models/carrito/carrito_response.dart';

class ShoppingcarService {
  static const String _carro = "${URL.shoppingcar}/shoppingcar";
  static const String _load = "${URL.shoppingcar}/shoppingcar/plan";

  static Future<CarritoResponse?> load({
    required String token,
  }) async {
    final urI = Uri.parse(_load);
    try {
      final resp = await http.get(
        urI,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
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
    try {
      final urI = Uri.parse(_carro);
      final resp = await http.post(
        urI,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: body,
      );
      final out = CarritoModel.fromJson(resp.body);

      return out;
    } catch (e) {
      return null;
    }
  }

  static Future<String?> eliminar(
      {required String token, required int id}) async {
    try {
      final urI = Uri.parse("$_carro/$id");
      final resp = await http.delete(
        urI,
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      final deco = json.decode(resp.body);
      if (deco["mensaje"] == null) {
        return "Error de conexion";
      }
      if (deco["mensaje"].runtimeType == String) {
        return deco["mensaje"];
      }

      return "Removido Correctamente";
    } catch (e) {
      return null;
    }
  }

  static Future<String?> eliminarAll(
      {required String token, required int id}) async {
    try {
      final urI = Uri.parse(_carro);
      final resp = await http.delete(
        urI,
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      final deco = json.decode(resp.body);
      if (deco["mensaje"] == null) {
        return "Error de conexion";
      }
      if (deco["mensaje"].runtimeType == String) {
        return deco["mensaje"];
      }

      return "Carrito limpio";
    } catch (e) {
      return null;
    }
  }
}
