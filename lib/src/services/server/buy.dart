// ignore: unused_import
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
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
  static Future<String?> checkout({
    required String token,
    required int tarjeta,
  }) async {
    final urI = Uri.parse(_checkout);
    final resp = await http.post(
      urI,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: json.encode({"card_id": tarjeta}),
    );

    final parse = json.decode(resp.body);
    if (parse["mensaje"] != null) {
      return parse["mensaje"];
    }
    return parse["resp"];
  }

  static Future<String?> cancelarCompra({
    required String token,
    required int tarjeta,
  }) async {
    final urI = Uri.parse(_cancel);
    final resp = await http.post(
      urI,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: json.encode({"card_id": tarjeta}),
    );
    final parse = json.decode(resp.body);
    return parse;
  }

  static Future<String?> reintentarCompra({
    required String token,
    required int tarjeta,
  }) async {
    final urI = Uri.parse(_retry);
    final resp = await http.post(
      urI,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: json.encode({"card_id": tarjeta}),
    );
    final parse = json.decode(resp.body);
    return parse;
  }

  /// funciones historial de compra

  static Future<HistorialCompraModel?> listarHistorial({
    required int pag,
    required String token,
  }) async {
    Response resp;
    final urI = Uri.parse("$_listar/$pag/10");
    try {
      resp = await http.get(
        urI,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
    } catch (e) {
      return HistorialCompraModel(
        mensjae: "error de comunicacion con el servidor",
      );
    }

    try {
      return HistorialCompraModel.fromJson(resp.body);
    } catch (e) {
      return HistorialCompraModel(mensjae: "error de interpretacion");
    }
  }

  static Future<HistorialCompraModel?> historialCancelados({
    required int pag,
    required String token,
  }) async {
    final urI = Uri.parse("$_listRechazados/$pag/10");
    final resp = await http.get(
      urI,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    return HistorialCompraModel.fromJson(resp.body);
  }

  static Future<HistorialCompraModel?> historialRechazados({
    required int pag,
    required String token,
  }) async {
    final urI = Uri.parse("$_listWaiting/$pag/10");
    final resp = await http.get(
      urI,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    return HistorialCompraModel.fromJson(resp.body);
  }
}
