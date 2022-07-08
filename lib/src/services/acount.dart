// ignore: unused_import
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lotto_music/src/models/users.dart';

import '../helpers/variables_globales.dart';
import '../models/login_response.dart';

class AcountServices {
  static const String _login = URL.auth + "/login";
  static const String _singup = URL.auth + "/user";
  static const String _token = URL.auth + "/token";
  static const String _update = URL.auth + "/user";
  static const String _delete = URL.auth + "/user";
  static const String _info = URL.auth + "/user";
  static const String _changepassword = URL.auth + "/changepassword";
  static const String _forgetpassword = URL.auth + "/forgetpassword";

  static Future<LoginResponse?> login({
    required String email,
    required String password,
  }) async {
    try {
      final urI = Uri.parse(_login);
      final resp = await http.post(urI,
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            "username": email,
            "password": password,
          }));

      final out = LoginResponse.fromJson(resp.body);
      return out;
    } catch (e) {
      return null;
    }
  }

  static Future<User?> singup({
    required String email,
    required String password,
    required String name,
    required String lastname,
  }) async {
    try {
      final urI = Uri.parse(_singup);
      final resp = await http.get(
        urI,
        headers: {
          "Content-Type": "application/json",
          "email": email,
          "password": password,
        },
      );

      return userFromJson(resp.body);
    } catch (e) {
      return null;
    }
  }

  static Future<String> update({
    required String email,
    required String password,
    required String name,
    required String lastname,
  }) async {
    try {
      final urI = Uri.parse(_update);
      final resp = await http.get(
        urI,
        headers: {
          "Content-Type": "application/json",
          "email": email,
          "password": password,
        },
      );

      return resp.body;
    } catch (e) {
      return "";
    }
  }

  static Future<String> delete() async {
    try {
      final urI = Uri.parse(_delete);
      final resp = await http.get(
        urI,
        headers: {
          "Content-Type": "application/json",
        },
      );

      return resp.body;
    } catch (e) {
      return "";
    }
  }

  static Future<String> info({
    required String token,
  }) async {
    try {
      final urI = Uri.parse(_info);
      final resp = await http.get(
        urI,
        headers: {
          "Content-Type": "application/json",
          "email": token,
        },
      );

      return resp.body;
    } catch (e) {
      return "";
    }
  }

  static Future<String> changepassword({
    required String password,
  }) async {
    try {
      final urI = Uri.parse(_changepassword);
      final resp = await http.get(
        urI,
        headers: {
          "Content-Type": "application/json",
          "password": password,
        },
      );

      return resp.body;
    } catch (e) {
      return "";
    }
  }

  static Future<String> forguetpassword({
    required String email,
  }) async {
    try {
      final urI = Uri.parse(_forgetpassword);
      final resp = await http.get(
        urI,
        headers: {
          "Content-Type": "application/json",
          "email": email,
        },
      );

      return resp.body;
    } catch (e) {
      return "";
    }
  }

  static Future<LoginResponse?> updateToken({required String token}) async {
    try {
      final urI = Uri.parse(_token);
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
}
