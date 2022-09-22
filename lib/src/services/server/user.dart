// ignore: unused_import
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../helpers/globals/ruts_services.dart';
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
  static Future<TarjetaModel?> tarjetaUpdate({
    required TarjetaModel tarjeta,
    required String token,
  }) async {
    try {
      final urI = Uri.parse(_method);
      final resp = await http.put(
        urI,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: tarjeta.toJson(),
      );
      return TarjetaModel.fromJson(resp.body);
    } catch (e) {
      return null;
    }
  }

  static Future<TarjetasResponse?> tarjetaLoad({
    required String token,
  }) async {
    try {
      final urI = Uri.parse(_method);
      final resp = await http.get(
        urI,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      return TarjetasResponse.fromJson(resp.body);
    } catch (e) {
      return null;
    }
  }

  static Future<TarjetaModel?> tarjetaCreate({
    required TarjetaModel tarjeta,
    required String token,
  }) async {
    try {
      final urI = Uri.parse(_method);
      final resp = await http.post(
        urI,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: tarjeta.toJson(),
      );
      return TarjetaModel.fromJson(resp.body);
    } catch (e) {
      return null;
    }
  }

  static Future<String?> tarjetaRemove({
    required int id,
    required String token,
  }) async {
    try {
      final urI = Uri.parse("$_method/$id");
      final resp = await http.delete(
        urI,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      return json.decode(resp.body)["resp"];
    } catch (e) {
      return null;
    }
  }

  /////////////// /////////////// /////////////// Direcciones
  static Future<DireccionesModel?> direccionesUpdate({
    required DireccionesModel direccion,
    required String token,
  }) async {
    try {
      final urI = Uri.parse(_direccion);
      final resp = await http.put(
        urI,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: direccion.toJson(),
      );

      return DireccionesModel.fromJson(resp.body);
    } catch (e) {
      return null;
    }
  }

  static Future<DireccionesResponse?> direccionesLoad({
    required String token,
  }) async {
    try {
      final urI = Uri.parse(_direccion);
      final resp = await http.get(
        urI,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      return DireccionesResponse.fromJson(resp.body);
    } catch (e) {
      return null;
    }
  }

  static Future<DireccionesModel?> direccionesCreate({
    required DireccionesModel direccion,
    required String token,
  }) async {
    try {
      final urI = Uri.parse(_direccion);
      final resp = await http.post(
        urI,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: direccion.toJson(),
      );

      return DireccionesModel.fromJson(resp.body);
    } catch (e) {
      return null;
    }
  }

  static Future<String?> direccionesDelete({
    required int id,
    required String token,
  }) async {
    try {
      final urI = Uri.parse("$_direccion/$id");
      final resp = await http.delete(
        urI,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      return json.decode(resp.body)["resp"];
    } catch (e) {
      return null;
    }
  }

  /////////////// /////////////// /////////////// User

  static Future<UserModel?> userUpdate({
    required UserModel user,
    required String token,
  }) async {
    try {
      final urI = Uri.parse(_user);
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

  static Future<UserModel?> userInfo({
    required String token,
  }) async {
    try {
      final urI = Uri.parse(_user);
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

  static Future<String> userDelete() async {
    try {
      final urI = Uri.parse(_user);
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
      final urI = Uri.parse(_userChangepassword);
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

  /////////////// /////////////// /////////////// Propiedades
  static Future<UserModel?> propiedades({
    required String password,
    required String token,
  }) async {
    try {
      final urI = Uri.parse(_userChangepassword);
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

  static Future<CarteraModel?> cartera({required String token}) async {
    try {
      final urI = Uri.parse(_cartera);
      final resp = await http.get(
        urI,
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      final out = CarteraModel.fromJson(resp.body);
      return out;
    } catch (e) {
      return null;
    }
  }

  static Future<UserModel?> suscribcion({
    required String password,
    required String token,
  }) async {
    try {
      final urI = Uri.parse(_userChangepassword);
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
}
