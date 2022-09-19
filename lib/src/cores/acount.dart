import 'package:lotto_music/src/cores/repository.dart';

import '../helpers/variables_globales.dart';
import '../models/auth/login_response.dart';

class AcountLocalSave {
  /////////////////user/////////////////////////////////////////////////

  static Future<void> saveLoginResponse({required LoginResponse acount}) async {
    Repository.saveString(LocalStorage.loginResponse, acount.toJson());
  }

  static Future<LoginResponse> loadLoginResponse() async =>
      LoginResponse.fromJson(
        await Repository.loadString(LocalStorage.loginResponse) ?? "{}",
      );

  /////////////////LOGIN/////////////////////////////////////////////////

  static Future<void> saveisLogin(bool isLogin) async {
    Repository.saveBool('isLogin', isLogin);
  }

  static Future<bool> get isLogin async {
    final bool isLogin = await Repository.loadBool('isLogin') ?? false;

    return isLogin;
  }
}
