// ignore: unused_import
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lotto_music/src/models/historial_compra.dart';

import '../helpers/variables_globales.dart';

class CompraService {
  static const String _checkout = "${URL.compra}/checkout";
  static const String _listar = "${URL.compra}/compra";

  static Future<String?> checkout({required String token}) async {
    try {
      final urI = Uri.parse(_checkout);
      final resp = await http.post(
        urI,
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      final parse = json.decode(resp.body);
      if (parse["mensaje"].runtimeType == String) {
        return parse["mensaje"];
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  static Future<HistorialCompraModel?> listarHistorial({
    required int pag,
    required String token,
  }) async {
    final urI = Uri.parse("$_listar/$pag/10");
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
