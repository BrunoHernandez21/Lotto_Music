import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotto_music/src/bloc/carrito/carrito_bloc.dart';
import 'package:lotto_music/src/bloc/shaderPreferences/shaderpreferences_bloc.dart';
import 'package:lotto_music/src/models/login_response.dart';
import 'package:lotto_music/src/services/acount.dart';
import 'package:lotto_music/src/services/carrito.dart';
import 'package:lotto_music/src/services/plan.dart';

import '../bloc/acount/acount_bloc.dart';
import '../bloc/planes/planes_bloc.dart';
import '../bloc/videos_event/videos_event_bloc.dart';
import '../helpers/variables_globales.dart';
import '../models/carrito.dart';
import '../services/videos.dart';
import '../widgets/dialogs_alert.dart';
import 'acount.dart';

class Compositor {
  //////////////////////////////////////////////
  /// App state shader preferences
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
    BuildContext context,
    String email,
    String password,
  ) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    showDialog(
      context: context,
      builder: (context) {
        return DialogAlert.loading(context);
      },
      barrierDismissible: false,
    );
    final response = await AcountServices.login(
      email: email.trim(),
      password: password.trim(),
    );
    Navigator.of(context).pop();

    if (response == null) {
      DialogAlert.ok(
        context: context,
        text: "Error de comunicacion con el servidor",
      );
      return false;
    }
    if (response.mensaje == null) {
      acountB.add(OnLogin(response: response));
      AcountLocalSave.saveisLogin(true);
      AcountLocalSave.saveLoginResponse(acount: response);
      Navigator.of(context).pop();
      return true;
    } else {
      DialogAlert.ok(
        context: context,
        text: response.mensaje ?? "Contraseña o Correo Invalido",
      );
      return false;
    }
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
    final acountB = BlocProvider.of<AcountBloc>(context);
    acountB.add(OnLogout());
    AcountLocalSave.saveisLogin(true);
    AcountLocalSave.saveLoginResponse(acount: LoginResponse());
    return true;
  }

  static Future<bool> onRecovery(BuildContext context) async {
    return true;
  }

  static Future<bool> onChangePassword(BuildContext context) async {
    return true;
  }

  static Future<bool> checkToken(BuildContext context) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final resp = await AcountServices.updateToken(
      token: acountB.state.acount.accessToken,
    );
    if (resp == null) {
      return false;
    }
    if (resp.mensaje != null) {
      acountB.add(OnLogout());
      return false;
    }
    return true;
  }

  ///////////////////////////////////////////////
  ///Buy Controller
  static Future<bool> onloadCarrito(BuildContext context) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final planB = BlocProvider.of<CarritoBloc>(context);
    final response =
        await CarritoService.load(token: acountB.state.acount.accessToken);

    if (response == null) {
      return false;
    }
    if (response.mensaje == null) {
      planB.add(OnLoadCarrito(ordenes: response.ordenes));
      return true;
    }

    return true;
  }

  static Future<String?> onAddCarrito({
    required BuildContext context,
    required CarritoModel orden,
  }) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final resp = await CarritoService.create(
      token: acountB.state.acount.accessToken,
      body: orden.toJson(),
    );
    if (resp == null) {
      return "error de coneccion";
    }
    if (resp.mensaje == null) {
      return null;
    }
    return resp.mensaje;
  }

  static Future<bool> onBuy(BuildContext context) async {
    return true;
  }

  static Future<bool> onLoadPlanes(BuildContext context) async {
    final planB = BlocProvider.of<PlanesBloc>(context);
    final response = await PlanService.load();
    if (response == null) {
      return false;
    }
    if (response.mensaje == null) {
      planB.add(OnLoadPlanes(planes: response.planes));
      return true;
    }

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

  static Future<bool> onLoadVideosEventos(
      {required BuildContext context, required int pag}) async {
    final vEB = BlocProvider.of<VideosEventBloc>(context);
    final resp = await VideoService.listarEventos(pag: pag + 1);
    if (resp == null) {
      return false;
    }
    if (resp.mensaje == null) {
      vEB.add(OnLoadVideosEvent(listado: resp.items ?? [], pag: resp.pag));
      return true;
    }
    return true;
  }

  static Future<bool> onLoadInitVideosEventos(BuildContext context) async {
    final vEB = BlocProvider.of<VideosEventBloc>(context);
    final resp = await VideoService.listarEventos(pag: 1);
    if (resp == null) {
      return false;
    }
    if (resp.mensaje == null) {
      vEB.add(OnInitVideosEvent(
        listado: resp.items ?? [],
        pag: resp.pag,
        count: resp.totals,
        pags: resp.pags,
        sizePage: resp.sizePage,
      ));
      return true;
    }
    return true;
  }
}
