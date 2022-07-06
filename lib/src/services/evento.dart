// ignore: unused_import
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../helpers/variables_globales.dart';
import '../models/login_response.dart';

class ServiceAuth {
  static const String _listar = URL.evento + "listar";

  static Future<LoginResponse?> activos() async {
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

  static Future<LoginResponse?> activosPage() async {
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
