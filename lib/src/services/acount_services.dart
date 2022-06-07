// ignore: unused_import
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../helpers/variables_globales.dart';
import '../models/acoun_response.dart';
import '../models/login_response.dart';

class AcountServices {
  static const String _register = URL.base + 'signup';
  static const String _login = URL.base + "login";
  static const String _userdata = URL.base + "userdata";
  static const String _uploadUserImage = URL.base + "upload_user_image";
  static const String _updateUserdata = URL.base + "update_userdata";
  static const String _updatePassword = URL.base + "update_password";
  static const String _forgotPassword = URL.base + "forgot_password";

  static Future<LoginResponse?> login({
    required String email,
    required String password,
  }) async {
    try {
      final urI = Uri.parse(_login);
      final resp = await http.get(
        urI,
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
          "email": email,
          "password": password,
        },
      );
      return LoginResponse.fromJson(resp.body);
    } catch (e) {
      return null;
    }
  }

  static Future<bool> register({
    required String email,
    required String password,
    required String name,
    required String lastname,
  }) async {
    try {
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future recovery({required String email}) async {
    return;
  }

  static Future<void> getUserInfo({required String token}) async {}

  static Future<void> userImageUpload(
      {required File image, required String token}) async {}

  static Future<void> logout() async {}

  static Future<void> updateUserData({
    required AcountResponse user,
    required String token,
  }) async {}

  static Future<void> updateUserPassword({
    required String currentPassword,
    required String newPassword,
    required String token,
  }) async {}
}
