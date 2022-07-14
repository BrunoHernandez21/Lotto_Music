import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotto_music/src/bloc/carrito/carrito_bloc.dart';
import 'package:lotto_music/src/bloc/shaderPreferences/shaderpreferences_bloc.dart';
import 'package:lotto_music/src/bloc/user/user_bloc.dart';
import 'package:lotto_music/src/bloc/video_event/video_event_bloc.dart';
import 'package:lotto_music/src/bloc/videos/videos_bloc.dart';
import 'package:lotto_music/src/bloc/videos_categoria/videos_categoria_bloc.dart';
import 'package:lotto_music/src/models/login_response.dart';
import 'package:lotto_music/src/models/youtube.dart';
import 'package:lotto_music/src/services/acount.dart';
import 'package:lotto_music/src/services/carrito.dart';
import 'package:lotto_music/src/services/compra.dart';
import 'package:lotto_music/src/services/plan.dart';
import 'package:lotto_music/src/services/yt.dart';

import '../bloc/acount/acount_bloc.dart';
import '../bloc/planes/planes_bloc.dart';
import '../bloc/video/video_bloc.dart';
import '../bloc/videos_event/videos_event_bloc.dart';
import '../helpers/variables_globales.dart';
import '../models/carrito.dart';
import '../models/carrito_plan.dart';
import '../models/cartera.dart';
import '../models/evento_video.dart';
import '../models/ganador.dart';
import '../models/grupos.dart';
import '../models/historial_compra.dart';
import '../models/historial_event_user.dart';
import '../models/users.dart';
import '../services/apuestas.dart';
import '../services/utility.dart';
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
  /////////     ////// Acount Controller
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

  static Future<bool> onRegister({
    required BuildContext context,
    required String email,
    required String password,
    required String phone,
    required String name,
  }) async {
    final UserModel? user = await AcountServices.singup(
      email: email.trim(),
      password: password.trim(),
      name: name.trim(),
      phone: phone.trim(),
    );
    if (user == null) {
      await DialogAlert.ok(
        context: context,
        text: "No hay conexión con el servidor",
      );
      return false;
    }
    if (user.mensaje != null) {
      DialogAlert.ok(
        context: context,
        text: user.mensaje ?? "",
      );
      return false;
    }

    return true;
  }

  static Future<bool> onLogOut(BuildContext context) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    acountB.add(OnLogout());
    AcountLocalSave.saveisLogin(true);
    AcountLocalSave.saveLoginResponse(acount: LoginResponse());
    return true;
  }

  static Future<bool> onRecovery(BuildContext context, String email) async {
    final String? resp = await AcountServices.forguetpassword(
      email: email.trim(),
    );
    if (resp == null) {
      await DialogAlert.ok(
        context: context,
        text: "No hay conexión con el servidor",
      );
      return false;
    }
    if (resp == "Se a enviado un correo a su cuenta") {
      await DialogAlert.ok(
        context: context,
        text: resp,
      );
      return true;
    }
    await DialogAlert.ok(
      context: context,
      text: resp,
    );
    return false;
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

  static Future<bool> onLoadUser(BuildContext context) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final userB = BlocProvider.of<UserBloc>(context);
    final resp = await AcountServices.info(
      token: acountB.state.acount.accessToken,
    );
    if (resp == null) {
      return false;
    }
    if (resp.mensaje == null) {
      userB.add(OnLoadUser(
        user: resp,
      ));
      return false;
    }
    return true;
  }

  static Future<bool> onChangePassword(
      {required BuildContext context, required String password}) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final userB = BlocProvider.of<UserBloc>(context);
    final resp = await AcountServices.changepassword(
      token: acountB.state.acount.accessToken,
      password: password,
    );
    if (resp == null) {
      return false;
    }
    if (resp.mensaje == null) {
      userB.add(OnLoadUser(
        user: resp,
      ));
      return false;
    }
    return true;
  }

  static Future<bool> onUpdateUser(
      {required BuildContext context, required UserModel user}) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final userB = BlocProvider.of<UserBloc>(context);
    final resp = await AcountServices.update(
      user: user,
      token: acountB.state.acount.accessToken,
    );
    if (resp == null) {
      return false;
    }
    if (resp.mensaje == null) {
      userB.add(OnLoadUser(
        user: resp,
      ));
      return false;
    }
    return true;
  }

  ///////////////////////////////////////////////
  //////    /////////Buy Controller
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

  /// Categorias
  static Future<bool> onDeleteCarrito(
      BuildContext context, Ordenes orden) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final planB = BlocProvider.of<CarritoBloc>(context);
    final resp = await CarritoService.eliminar(
        token: acountB.state.acount.accessToken, id: orden.orden.id);
    if (resp == null) {
      DialogAlert.ok(
        context: context,
        text: "Error de conexion",
      );
      return false;
    }
    if (resp == "Eliminado Satisfactoriamente") {
      try {
        final newOrden = planB.state.ordenes;
        newOrden!.remove(orden);
        planB.add(OnLoadCarrito(ordenes: newOrden));
        return true;
      } catch (e) {
        return false;
      }
    }

    return true;
  }

  /// compra
  static Future<bool> onBuy(BuildContext context) async {
    return true;
  }

  /// Categorias
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
  /// /////// Peticiones Relacionadas a Videos

  ///////
  /// Categorias
  static Future<List<String>?> onLoadCategorias(
      {required BuildContext context}) async {
    final GruposModel? grupos = await VideoService.listarGrupos();
    if (grupos == null) {
      return null;
    }
    if (grupos.mensaje == null) {
      return grupos.grupos;
    }
    return [];
  }

  static Future<bool> onLoadVideosCategoria(
      {required BuildContext context}) async {
    final vEB = BlocProvider.of<VideosCategoriaBloc>(context);
    final resp = await VideoService.listarVideosCategoria(
      pag: vEB.state.pag + 1,
      categoria: vEB.state.categoria,
    );
    if (resp == null) {
      return false;
    }
    if (resp.mensaje == null) {
      if (vEB.state.pag >= resp.pag) {
        return true;
      }
      vEB.add(OnLoadVideosCategoria(listado: resp.items ?? [], pag: resp.pag));
      return true;
    }
    return false;
  }

  static Future<bool> onLoadInitVideosCategoria(BuildContext context) async {
    final vEB = BlocProvider.of<VideosCategoriaBloc>(context);

    final resp = await VideoService.listarVideosCategoria(
        pag: 1, categoria: vEB.state.categoria);
    if (resp == null) {
      return false;
    }
    if (resp.mensaje == null) {
      vEB.add(OnInitVideosCategoria(
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

/////// Seleccion de la caegoria de videos de evento ///////
  static Future<bool> onCategoriaS({
    required BuildContext context,
    required String categoria,
  }) async {
    final vEB = BlocProvider.of<VideosCategoriaBloc>(context);
    vEB.add(OnSelectCategoria(categoria: categoria));
    return true;
  }

/////// videos de evento
  static Future<bool> onLoadVideosEventos({
    required BuildContext context,
  }) async {
    final vEB = BlocProvider.of<VideosEventBloc>(context);
    final resp = await VideoService.listarEventos(pag: vEB.state.pag + 1);
    if (resp == null) {
      return false;
    }
    if (resp.mensaje == null) {
      if (vEB.state.pag >= resp.pag) {
        return true;
      }
      vEB.add(OnLoadVideosEvent(listado: resp.items ?? [], pag: resp.pag));
      return true;
    }
    return false;
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

  static Future<List<ItemEvent>?> onLoadEventosTemp(
      {required BuildContext context}) async {
    final resp = await VideoService.listarEventos(pag: 1);
    return resp?.items;
  }

////////////// seleccionar video para reprocir (evento) ///////
  static Future<bool> onSlectVideoEvento({
    required BuildContext context,
    required ItemEvent item,
  }) async {
    final vB = BlocProvider.of<VideoEventBloc>(context);
    vB.add(OnSelectVideoEvent(eventoVideo: item));
    return true;
  }

  /////// historial de eventos
  static Future<HistorialEventosUsuario?> onLoadHistorialEventos({
    required BuildContext context,
    required int pag,
  }) async {
    final vEB = BlocProvider.of<VideosEventBloc>(context);
    final acountB = BlocProvider.of<AcountBloc>(context);
    if (vEB.state.pag > vEB.state.pags) {
      return null;
    }
    final resp = await ApuestaService.listarHistory(
      pag: pag,
      token: acountB.state.acount.accessToken,
    );
    return resp;
  }

  static Future<HistorialEventosUsuario?> onIinitHistorialEventos(
      BuildContext context) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final resp = await ApuestaService.listarHistory(
      pag: 1,
      token: acountB.state.acount.accessToken,
    );
    return resp;
  }

  /////// historial de compras
  static Future<HistorialCompraModel?> onLoadHistorialCompra({
    required BuildContext context,
    required int pag,
  }) async {
    final vEB = BlocProvider.of<VideosEventBloc>(context);
    final acountB = BlocProvider.of<AcountBloc>(context);
    if (vEB.state.pag > vEB.state.pags) {
      return null;
    }
    final resp = await CompraService.listarHistorial(
      pag: pag,
      token: acountB.state.acount.accessToken,
    );
    return resp;
  }

  static Future<HistorialCompraModel?> onIinitHistorialCompra(
      BuildContext context) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final resp = await CompraService.listarHistorial(
      pag: 1,
      token: acountB.state.acount.accessToken,
    );
    return resp;
  }

  /////// winer
  static Future<GanadorModel?> onLoadWiner({
    required BuildContext context,
    required int pag,
  }) async {
    final vEB = BlocProvider.of<VideosEventBloc>(context);
    final acountB = BlocProvider.of<AcountBloc>(context);
    if (vEB.state.pag > vEB.state.pags) {
      return null;
    }
    final resp = await UtilityService.wins(
      pag: pag,
      token: acountB.state.acount.accessToken,
    );
    return resp;
  }

  static Future<GanadorModel?> onIinitWiner(BuildContext context) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final resp = await UtilityService.wins(
      pag: 1,
      token: acountB.state.acount.accessToken,
    );
    return resp;
  }

  ////////////////////////////////////////////
  ///////////////   youtube
  static Future<void> onLoadPrincipalYT({
    required BuildContext context,
  }) async {
    final ytB = BlocProvider.of<VideosBloc>(context);
    final resp = await YTService.top();
    if (resp != null) {
      ytB.add(OnInitVideosYT(yt: resp));
    }
    return;
  }

  static Future<List<ItemYT>?> onLoadRelacionadosYT({
    required BuildContext context,
    required String? relaionado,
  }) async {
    if (relaionado == null) {
      final resp = await YTService.top();
      return resp?.itemsyt;
    }
    final resp = await YTService.relative(
      ytID: relaionado,
    );
    return resp?.itemsyt;
  }

  static Future<List<ItemYT>?> onSearchYT(
      {required BuildContext context, required String busqueda}) async {
    final resp = await YTService.busqueda(
      query: busqueda,
    );
    return resp?.itemsyt;
  }

  static Future<bool> onSelectYT({
    required BuildContext context,
    required ItemYT item,
  }) async {
    final ytB = BlocProvider.of<VideoBloc>(context);
    ytB.add(OnSelectVideoYT(item: item));
    return true;
  }

///////////////////////////////////////////////
////      Cartera
  static Future<Cartera?> onLoadCartera({
    required BuildContext context,
  }) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final resp = await UtilityService.cartera(
      token: acountB.state.acount.accessToken,
    );

    return resp?.cartera;
  }
}
