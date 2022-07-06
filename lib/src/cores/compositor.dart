import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotto_music/src/bloc/shaderPreferences/shaderpreferences_bloc.dart';

import '../bloc/acount/acount_bloc.dart';
import '../helpers/variables_globales.dart';

class Compositor {
  //////////////////////////////////////////////
  ///
  static Future<bool> onChagengeTheme(BuildContext context) async {
    final blocShader = BlocProvider.of<ShaderpreferencesBloc>(context);
    ThemeData myTheme;
    if (blocShader.state.themeData.backgroundColor !=
        ThemeData.dark().backgroundColor) {
      myTheme = ThemeData.dark().copyWith(
        backgroundColor: ThemeData.dark().backgroundColor,
        appBarTheme: ThemeData.dark().appBarTheme.copyWith(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
      );
    } else {
      myTheme = ThemeData.light().copyWith(
          backgroundColor: Colores.background,
          appBarTheme: ThemeData.light().appBarTheme.copyWith(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ));
    }
    blocShader.add(OnChageTheme(themeData: myTheme));
    return true;
  }

  ///////////////////////////////////////////////
  ///Sistem Controller
  static Future<bool> onInitApp(BuildContext context) async {
    return true;
  }

  static Future<bool> onCloseApp(BuildContext context) async {
    return true;
  }

  static Future<bool> onSuspendApp(BuildContext context) async {
    return true;
  }

  ///////////////////////////////////////////////
  ///Acount Controller
  static Future<bool> onLogin(
      BuildContext context, String email, String password) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    await acountB.login(email, password, context);
    return true;
  }

  static void onRegister({
    required BuildContext context,
    required String email,
    required String password,
    required String phone,
    required String name,
  }) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    acountB.register(
      email: email,
      password: password,
      context: context,
      lastname: phone,
      name: name,
    );
  }

  static Future<bool> onLogOut(BuildContext context) async {
    return true;
  }

  static Future<bool> onRecovery(BuildContext context) async {
    return true;
  }

  static Future<bool> onChangePassword(BuildContext context) async {
    return true;
  }

  ///////////////////////////////////////////////
  ///Buy Controller
  static Future<bool> onRenuvaSecion(BuildContext context) async {
    return true;
  }

  static Future<bool> onBuy(BuildContext context) async {
    return true;
  }

  ///////////////////////////////////////////////
  ///music Controllers
  static Future<bool> loadVideosPrincipales(BuildContext context) async {
    return true;
  }

  static Future<bool> loadVideosPorCategoria(BuildContext context) async {
    return true;
  }

  static Future<bool> loadVideosEventos(BuildContext context) async {
    return true;
  }
}
