import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lotto_music/src/models/tarjetas.dart';
import 'package:lotto_music/src/models/tarjetas_response.dart';

import '../helpers/variables_globales.dart';

class TarjetaServices {
  static const String _method = URL.compra + "/payment/method";

  static Future<TarjetaModel?> update({
    required TarjetaModel tarjeta,
    required String token,
  }) async {
    try {
      final urI = Uri.parse(_method);
      final resp = await http.put(
        urI,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer " + token,
        },
        body: tarjeta.toJson(),
      );
      return TarjetaModel.fromJson(resp.body);
    } catch (e) {
      return null;
    }
  }

  static Future<TarjetasResponse?> load({
    required String token,
  }) async {
    try {
      final urI = Uri.parse(_method);
      final resp = await http.get(
        urI,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer " + token,
        },
      );

      return TarjetasResponse.fromJson(resp.body);
    } catch (e) {
      return null;
    }
  }

  static Future<TarjetaModel?> create({
    required TarjetaModel tarjeta,
    required String token,
  }) async {
    try {
      final urI = Uri.parse(_method);
      final resp = await http.post(
        urI,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer " + token,
        },
        body: tarjeta.toJson(),
      );
      return TarjetaModel.fromJson(resp.body);
    } catch (e) {
      return null;
    }
  }

  static Future<String?> remove({
    required int id,
    required String token,
  }) async {
    try {
      final urI = Uri.parse(_method + "/" + id.toString());
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
