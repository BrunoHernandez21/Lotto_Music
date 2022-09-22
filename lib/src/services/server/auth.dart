// ignore: unused_import
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lotto_music/src/models/user/users.dart';

import '../../helpers/globals/ruts_services.dart';
import '../../models/auth/login_response.dart';

class AcountServices {
  static const String _login = "${URL.auth}/login";
  static const String _singup = "${URL.auth}/user";
  static const String _token = "${URL.auth}/token";
  static const String _forgetpassword = "${URL.auth}/forgetpassword";

  static Future<LoginResponse?> login({
    required String email,
    required String password,
  }) async {
    try {
      final urI = Uri.parse(_login);
      final resp = await http.post(urI,
          headers: {
            "Content-Type": "application/json; charset=utf-8",
          },
          body: jsonEncode({
            "email": email,
            "password": password,
          }));

      final out = LoginResponse.fromJson(utf8.decode(resp.bodyBytes));
      return out;
    } catch (e) {
      return null;
    }
  }

  static Future<UserModel?> singup({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    final urI = Uri.parse(_singup);
    final resp = await http.post(
      urI,
      headers: {
        "Content-Type": "application/json; charset=utf-8",
      },
      body: json.encode(
        {
          "email": email,
          "password": password,
          "nombre": name,
          "telefono": phone,
        },
      ),
    );
    return UserModel.fromJson(utf8.decode(resp.bodyBytes));
  }

  static Future<String?> forguetpassword({
    required String email,
  }) async {
    final urI = Uri.parse(_forgetpassword);
    final resp = await http.put(urI,
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode({
          "email": email,
        }));
    final out = json.decode(resp.body);
    return out["mensaje"];
  }

  static Future<LoginResponse?> updateToken({required String token}) async {
    try {
      final urI = Uri.parse(_token);
      final resp = await http.get(
        urI,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      return LoginResponse.fromJson(resp.body);
    } catch (e) {
      return null;
    }
  }
}
