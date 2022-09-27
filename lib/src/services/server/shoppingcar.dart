// ignore: unused_import
import 'dart:convert';
import 'package:lotto_music/src/cores/webDart/webcontroller.dart';

import '../../helpers/globals/ruts_services.dart';
import '../../models/carrito/carrito.dart';
import '../../models/carrito/carrito_response.dart';

class ShoppingcarService {
  static const String _carro = "${URL.shoppingcar}/shoppingcar";
  static const String _load = "${URL.shoppingcar}/shoppingcar/plan";

  static Future<CarritoResponse> load({
    required String token,
  }) async {
    final urI = Uri.parse(_load);

    final resp = await DartWeb.get(
      url: urI,
      token: token,
    );
    if (resp == null) {
      return CarritoResponse(mensaje: "error de comunicacion con el servidor");
    }
    return CarritoResponse.fromJson(resp);
  }

  static Future<CarritoModel> create({
    required String token,
    required Map<String, dynamic> body,
  }) async {
    final urI = Uri.parse(_carro);
    final resp = await DartWeb.post(
      url: urI,
      token: token,
      body: body,
    );
    if (resp == null) {
      return CarritoModel(mensaje: "error de comunicacion con el servidor");
    }
    final out = CarritoModel.fromJson(resp);
    return out;
  }

  static Future<String> eliminar({
    required String token,
    required int id,
  }) async {
    final urI = Uri.parse("$_carro/$id");
    final resp = await DartWeb.delete(
      url: urI,
      token: token,
    );
    if (resp == null) {
      return "error de comunicacion con el servidor";
    }
    final deco = json.decode(resp);
    if (deco["mensaje"].runtimeType == String) {
      return deco["mensaje"];
    }
    return "Removido Correctamente";
  }

  static Future<String?> eliminarAll(
      {required String token, required int id}) async {
    final urI = Uri.parse(_carro);
    final resp = await DartWeb.delete(
      url: urI,
      token: token,
    );
    if (resp == null) {
      return "error de comunicacion con el servidor";
    }
    final deco = json.decode(resp);
    if (deco["mensaje"].runtimeType == String) {
      return deco["mensaje"];
    }

    return "Carrito limpio";
  }
}
