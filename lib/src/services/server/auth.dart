// ignore: unused_import
import 'dart:convert';
import 'package:lotto_music/src/models/user/users.dart';

import '../../cores/webDart/webcontroller.dart';
import '../../helpers/globals/routes_services.dart';
import '../../models/auth/login_response.dart';

class AcountServices {
  static const String _login = "${URL.auth}/login";
  static const String _singup = "${URL.auth}/user";
  static const String _token = "${URL.auth}/token";
  static const String _forgetpassword = "${URL.auth}/forgetpassword";

  static Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    final urI = Uri.parse(_login);
    final resp = await DartWeb.post(
      url: urI,
      body: {
        "email": email,
        "password": password,
      },
    );
    if (resp == null) {
      return LoginResponse(mensaje: "Error de coneccion");
    }
    return LoginResponse.fromJson(resp);
  }

  static Future<UserModel> singup({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    final urI = Uri.parse(_singup);
    final resp = await DartWeb.post(
      url: urI,
      body: {
        "email": email,
        "password": password,
        "nombre": name,
        "telefono": phone,
      },
    );
    if (resp == null) {
      return UserModel(mensaje: "No hay comunicacion con el servidor");
    }
    return UserModel.fromJson(resp);
  }

  static Future<String> forguetpassword({
    required String email,
  }) async {
    final urI = Uri.parse(_forgetpassword);
    final resp = await DartWeb.put(
      url: urI,
      body: {
        "email": email,
      },
    );
    if (resp == null) {
      return "No hay comunicacion con el servidor";
    }
    final out = json.decode(resp);
    return out["mensaje"];
  }

  static Future<LoginResponse> updateToken({required String token}) async {
    final urI = Uri.parse(_token);
    final resp = await DartWeb.get(
      url: urI,
      token: token,
    );
    if (resp == null) {
      return LoginResponse(mensaje: "No hay comunicacion con el servidor");
    }
    return LoginResponse.fromJson(resp);
  }
}
