// ignore: unused_import
import 'dart:convert';
import 'package:lotto_music/src/cores/webDart/webcontroller.dart';

import '../../helpers/globals/routes_services.dart';
import '../../models/user/cartera.dart';
import '../../models/user/direcciones.dart';
import '../../models/user/direcciones_response.dart';
import '../../models/user/tarjetas.dart';
import '../../models/user/tarjetas_response.dart';
import '../../models/user/users.dart';

class UserServices {
  // user
  static const String _user = "${URL.user}/user";
  static const String _userChangepassword = "${URL.user}/changepassword";
  // propiedades
  static const String _cartera = "${URL.user}/purse";
  // paymentMethod
  static const String _method = "${URL.user}/payment/method";
  // Direcciones
  static const String _direccion = "${URL.user}/direction";

  /////////////// /////////////// /////////////// Payment method
  static Future<TarjetaModel> tarjetaUpdate({
    required TarjetaModel tarjeta,
    required String token,
  }) async {
    final urI = Uri.parse(_method);
    final resp = await DartWeb.put(
      url: urI,
      token: token,
      body: tarjeta.toMap(),
    );
    if (resp == null) {
      return TarjetaModel(mensaje: "error de comunicacion con el servidor");
    }
    return TarjetaModel.fromJson(resp);
  }

  static Future<TarjetasResponse> tarjetaLoad({
    required String token,
  }) async {
    final urI = Uri.parse(_method);
    final resp = await DartWeb.get(
      url: urI,
      token: token,
    );
    if (resp == null) {
      return TarjetasResponse(mensaje: "error de comunicacion con el servidor");
    }
    return TarjetasResponse.fromJson(resp);
  }

  static Future<TarjetaModel> tarjetaCreate({
    required TarjetaModel tarjeta,
    required String token,
  }) async {
    final urI = Uri.parse(_method);
    final resp = await DartWeb.post(
      url: urI,
      token: token,
      body: tarjeta.toMap(),
    );
    if (resp == null) {
      return TarjetaModel(mensaje: "error de comunicacion con el servidor");
    }
    return TarjetaModel.fromJson(resp);
  }

  static Future<String> tarjetaRemove({
    required int id,
    required String token,
  }) async {
    final urI = Uri.parse("$_method/$id");
    final resp = await DartWeb.delete(
      url: urI,
      token: token,
    );
    if (resp == null) {
      return "error de comunicacion con el servidor";
    }
    return json.decode(resp)["resp"] ?? "";
  }

  /////////////// /////////////// /////////////// Direcciones
  static Future<DireccionesModel> direccionesUpdate({
    required DireccionesModel direccion,
    required String token,
  }) async {
    final urI = Uri.parse(_direccion);
    final resp = await DartWeb.put(
      url: urI,
      token: token,
      body: direccion.toMap(),
    );
    if (resp == null) {
      return DireccionesModel(mensaje: "error de comunicacion con el servidor");
    }
    return DireccionesModel.fromJson(resp);
  }

  static Future<DireccionesResponse> direccionesLoad({
    required String token,
  }) async {
    final urI = Uri.parse(_direccion);
    final resp = await DartWeb.get(
      url: urI,
      token: token,
    );
    if (resp == null) {
      return DireccionesResponse(
        mensaje: "error de comunicacion con el servidor",
      );
    }
    return DireccionesResponse.fromJson(resp);
  }

  static Future<DireccionesModel> direccionesCreate({
    required DireccionesModel direccion,
    required String token,
  }) async {
    final urI = Uri.parse(_direccion);
    final resp = await DartWeb.post(
      url: urI,
      token: token,
      body: direccion.toMap(),
    );
    if (resp == null) {
      return DireccionesModel(mensaje: "error de comunicacion con el servidor");
    }
    return DireccionesModel.fromJson(resp);
  }

  static Future<String> direccionesDelete({
    required int id,
    required String token,
  }) async {
    final urI = Uri.parse("$_direccion/$id");
    final resp = await DartWeb.delete(
      url: urI,
      token: token,
    );
    if (resp == null) {
      return "error de comunicacion con el servidor";
    }
    return json.decode(resp)["resp"] ?? "";
  }

  /////////////// /////////////// /////////////// User

  static Future<UserModel> userUpdate({
    required UserModel user,
    required String token,
  }) async {
    final urI = Uri.parse(_user);
    final resp = await DartWeb.put(
      url: urI,
      token: token,
      body: user.toMap(),
    );
    if (resp == null) {
      return UserModel(mensaje: "error de comunicacion con el servidor");
    }
    return UserModel.fromJson(resp);
  }

  static Future<UserModel> userInfo({
    required String token,
  }) async {
    final urI = Uri.parse(_user);
    final resp = await DartWeb.get(
      url: urI,
      token: token,
    );
    if (resp == null) {
      return UserModel(mensaje: "error de comunicacion con el servidor");
    }
    return UserModel.fromJson(resp);
  }

  static Future<String> userDelete() async {
    final urI = Uri.parse(_user);
    final resp = await DartWeb.get(
      url: urI,
    );
    if (resp == null) {
      return "error de comunicacion con el servidor";
    }
    return json.decode(resp)["resp"] ?? "";
  }

  static Future<UserModel> changepassword({
    required String password,
    required String token,
  }) async {
    final urI = Uri.parse(_userChangepassword);
    final resp = await DartWeb.put(url: urI, token: token, body: {
      "password": password,
    });
    if (resp == null) {
      return UserModel(mensaje: "error de comunicacion con el servidor");
    }
    return UserModel.fromJson(resp);
  }

  /////////////// /////////////// /////////////// Propiedades
  static Future<UserModel> propiedades({
    required String password,
    required String token,
  }) async {
    final urI = Uri.parse(_userChangepassword);
    final resp = await DartWeb.put(
      url: urI,
      token: token,
      body: {
        "password": password,
      },
    );
    if (resp == null) {
      return UserModel(mensaje: "error de comunicacion con el servidor");
    }
    return UserModel.fromJson(resp);
  }

  static Future<CarteraModel> cartera({required String token}) async {
    final urI = Uri.parse(_cartera);
    final resp = await DartWeb.get(
      url: urI,
      token: token,
    );
    if (resp == null) {
      return CarteraModel(mensaje: "error de comunicacion con el servidor");
    }
    final out = CarteraModel.fromJson(resp);
    return out;
  }

  static Future<UserModel> suscribcion({
    required String password,
    required String token,
  }) async {
    final urI = Uri.parse(_userChangepassword);
    final resp = await DartWeb.put(url: urI, token: token, body: {
      "password": password,
    });
    if (resp == null) {
      return UserModel(mensaje: "error de comunicacion con el servidor");
    }
    return UserModel.fromJson(resp);
  }
}
