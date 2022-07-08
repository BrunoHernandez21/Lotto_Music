// ignore: unused_import
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../helpers/variables_globales.dart';
import '../models/carrito.dart';
import '../models/carrito_plan.dart';
import '../models/login_response.dart';

class CarritoService {
  static const String _listar = URL.carrito + "/carrito";
  static const String _crear = URL.carrito + "/carrito";
  static const String _load = URL.carrito + "/carrito/plan";
  static Future<CarritoResponse?> load({
    required String token,
  }) async {
    try {
      final urI = Uri.parse(_load);
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
    final urI = Uri.parse(_crear);
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

  static Future<LoginResponse?> listar({
    required String email,
    required String password,
  }) async {
    try {
      final urI = Uri.parse(_listar);
      final resp = await http.get(
        urI,
        headers: {
          "Content-Type": "application/json",
        },
      );

      return LoginResponse.fromJson(resp.body);
    } catch (e) {
      return null;
    }
  }

  static Future<LoginResponse?> eliminar({required String token}) async {
    try {
      final urI = Uri.parse(_listar);
      final resp = await http.get(
        urI,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer " + token,
        },
      );

      return LoginResponse.fromJson(resp.body);
    } catch (e) {
      return null;
    }
  }

  static Future<LoginResponse?> editar({
    required String email,
    required String password,
  }) async {
    try {
      final urI = Uri.parse(_listar);
      final resp = await http.get(
        urI,
        headers: {
          "Content-Type": "application/json",
        },
      );

      return LoginResponse.fromJson(resp.body);
    } catch (e) {
      return null;
    }
  }
}
