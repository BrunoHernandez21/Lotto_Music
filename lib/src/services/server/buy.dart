// ignore: unused_import
import 'dart:convert';
import 'package:lotto_music/src/cores/webDart/webcontroller.dart';
import 'package:lotto_music/src/models/buy/historial_compra.dart';

import '../../helpers/globals/ruts_services.dart';

class BuyService {
  static const String _checkout = "${URL.buy}/orders/checkout";
  static const String _cancel = "${URL.buy}/orders/cancel";
  static const String _retry = "${URL.buy}/orders/rentry";
  // history
  static const String _listar = "${URL.buy}/history";
  static const String _listRechazados = "${URL.buy}/orders/rejected";
  static const String _listWaiting = "${URL.buy}/orders/waiting";

  /// funciones comprar
  static Future<String> checkout({
    required String token,
    required Map<String, dynamic> body,
  }) async {
    final urI = Uri.parse(_checkout);
    final resp = await DartWeb.post(
      url: urI,
      token: token,
      body: body,
    );
    if (resp == null) {
      return "No hay comunicacion con el servidor";
    }
    final parse = json.decode(resp);
    if (parse["mensaje"] != null) {
      return parse["mensaje"];
    }
    return parse["resp"] ?? "";
  }

  static Future<String> cancelarCompra({
    required String token,
    required int tarjeta,
  }) async {
    final urI = Uri.parse(_cancel);
    final resp = await DartWeb.post(
      url: urI,
      token: token,
      body: {"card_id": tarjeta},
    );
    if (resp == null) {
      return "No hay comunicacion con el servidor";
    }
    final parse = json.decode(resp);
    return parse["resp"] ?? "";
  }

  static Future<String> reintentarCompra({
    required String token,
    required int tarjeta,
  }) async {
    final urI = Uri.parse(_retry);
    final resp = await DartWeb.post(
      url: urI,
      token: token,
      body: {"card_id": tarjeta},
    );
    if (resp == null) {
      return "No hay comunicacion con el servidor";
    }
    final parse = json.decode(resp);
    return parse["resp"] ?? "";
  }

  /// funciones historial de compra

  static Future<HistorialCompraModel> listarHistorial({
    required int pag,
    required String token,
  }) async {
    final urI = Uri.parse("$_listar/$pag/10");

    final resp = await DartWeb.get(
      url: urI,
      token: token,
    );
    if (resp == null) {
      return HistorialCompraModel(
        mensjae: "error de comunicacion con el servidor",
      );
    }
    return HistorialCompraModel.fromJson(resp);
  }

  static Future<HistorialCompraModel> historialCancelados({
    required int pag,
    required String token,
  }) async {
    final urI = Uri.parse("$_listRechazados/$pag/10");
    final resp = await DartWeb.get(
      url: urI,
      token: token,
    );
    if (resp == null) {
      return HistorialCompraModel(
        mensjae: "error de comunicacion con el servidor",
      );
    }
    return HistorialCompraModel.fromJson(resp);
  }

  static Future<HistorialCompraModel> historialRechazados({
    required int pag,
    required String token,
  }) async {
    final urI = Uri.parse("$_listWaiting/$pag/10");
    final resp = await DartWeb.get(
      url: urI,
      token: token,
    );
    if (resp == null) {
      return HistorialCompraModel(
        mensjae: "error de comunicacion con el servidor",
      );
    }
    return HistorialCompraModel.fromJson(resp);
  }
}
