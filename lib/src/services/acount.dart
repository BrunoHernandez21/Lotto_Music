// ignore: unused_import
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lotto_music/src/models/users.dart';

import '../helpers/variables_globales.dart';
import '../models/login_response.dart';

class AcountServices {
  static const String _login = "${URL.auth}/login";
  static const String _singup = "${URL.auth}/user";
  static const String _token = "${URL.auth}/token";
  static const String _update = "${URL.auth}/user";
  static const String _delete = "${URL.auth}/user";
  static const String _info = "${URL.auth}/user";
  static const String _changepassword = "${URL.auth}/changepassword";
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

  static Future<UserModel?> update({
    required UserModel user,
    required String token,
  }) async {
    try {
      final urI = Uri.parse(_update);
      final resp = await http.put(
        urI,
        headers: {
          "Content-Type": "application/json; charset=utf-8",
          "Authorization": "Bearer $token",
        },
        body: user.toJson(),
      );

      return UserModel.fromJson(utf8.decode(resp.bodyBytes));
    } catch (e) {
      return null;
    }
  }

  static Future<UserModel?> info({
    required String token,
  }) async {
    try {
      final urI = Uri.parse(_info);
      final resp = await http.get(
        urI,
        headers: {
          "Content-Type": "application/json; charset=utf-8",
          "Authorization": "Bearer $token",
        },
      );

      return UserModel.fromJson(utf8.decode(resp.bodyBytes));
    } catch (e) {
      return null;
    }
  }

  static Future<String> delete() async {
    try {
      final urI = Uri.parse(_delete);
      final resp = await http.get(
        urI,
        headers: {
          "Content-Type": "application/json; charset=utf-8",
        },
      );

      return utf8.decode(resp.bodyBytes);
    } catch (e) {
      return "";
    }
  }

  static Future<UserModel?> changepassword({
    required String password,
    required String token,
  }) async {
    try {
      final urI = Uri.parse(_changepassword);
      final resp = await http.put(urI,
          headers: {
            "Content-Type": "application/json; charset=utf-8",
            "Authorization": "Bearer $token",
          },
          body: json.encode({
            "password": password,
          }));

      return UserModel.fromJson(utf8.decode(resp.bodyBytes));
    } catch (e) {
      return null;
    }
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
