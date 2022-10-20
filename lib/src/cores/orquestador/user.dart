part of 'orquestador.dart';

class _User {
  // User
  Future<bool> onLoadUser(BuildContext context) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final userB = BlocProvider.of<UserBloc>(context);
    final resp = await UserServices.userInfo(
      token: acountB.state.acount.accessToken,
    );

    if (resp.mensaje == null) {
      userB.add(OnLoadUser(
        user: resp,
      ));
      return false;
    }
    return true;
  }

  Future<bool> onChangePassword(
      {required BuildContext context, required String password}) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final userB = BlocProvider.of<UserBloc>(context);
    final resp = await UserServices.changepassword(
      token: acountB.state.acount.accessToken,
      password: password,
    );

    if (resp.mensaje == null) {
      userB.add(OnLoadUser(
        user: resp,
      ));
      return false;
    }
    return true;
  }

  Future<bool> onUpdateUser(
      {required BuildContext context, required UserModel user}) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final userB = BlocProvider.of<UserBloc>(context);
    final resp = await UserServices.userUpdate(
      user: user,
      token: acountB.state.acount.accessToken,
    );

    if (resp.mensaje == null) {
      userB.add(OnLoadUser(
        user: resp,
      ));
      return false;
    }
    return true;
  }

  // Direcciones

  Future<bool?> onLoadDirecciones(BuildContext context) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final direccionesB = BlocProvider.of<DireccionesBloc>(context);

    final resp = await UserServices.direccionesLoad(
      token: acountB.state.acount.accessToken,
    );

    if (resp.mensaje != null) {
      direccionesB.add(
        OnLoadDirecciones(
          direcciones: DireccionesResponse(
            direcciones: [],
          ),
        ),
      );
      return false;
    } else {
      direccionesB.add(
        OnLoadDirecciones(direcciones: resp),
      );
      return true;
    }
  }

  Future<bool> onDeleteDirecciones({
    required BuildContext context,
    required int id,
  }) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final direccionesB = BlocProvider.of<DireccionesBloc>(context);
    final crea = await UserServices.direccionesDelete(
        token: acountB.state.acount.accessToken, id: id);
    if (crea != "eliminado correctamente") {
      return false;
    }

    final resp = await UserServices.direccionesLoad(
      token: acountB.state.acount.accessToken,
    );

    if (resp.mensaje != null) {
      direccionesB.add(
        OnLoadDirecciones(
          direcciones: DireccionesResponse(
            direcciones: [],
          ),
        ),
      );
      return false;
    } else {
      direccionesB.add(
        OnLoadDirecciones(direcciones: resp),
      );
      return true;
    }
  }

  Future<bool> onUpdateDirecciones({
    required BuildContext context,
    required DireccionesModel direccion,
  }) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final direccionesB = BlocProvider.of<DireccionesBloc>(context);
    final crea = await UserServices.direccionesUpdate(
      token: acountB.state.acount.accessToken,
      direccion: direccion,
    );
    if (crea.mensaje != null) {
      return false;
    }

    final resp = await UserServices.direccionesLoad(
      token: acountB.state.acount.accessToken,
    );

    if (resp.mensaje != null) {
      direccionesB.add(
        OnLoadDirecciones(
          direcciones: DireccionesResponse(
            direcciones: [],
          ),
        ),
      );
      return false;
    } else {
      direccionesB.add(
        OnLoadDirecciones(direcciones: resp),
      );
      return true;
    }
  }

  Future<bool> onCreateDirecciones({
    required BuildContext context,
    required DireccionesModel direccion,
  }) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final direccionesB = BlocProvider.of<DireccionesBloc>(context);
    final crea = await UserServices.direccionesCreate(
      token: acountB.state.acount.accessToken,
      direccion: direccion,
    );
    if (crea.mensaje != null) {
      return false;
    }

    final resp = await UserServices.direccionesLoad(
      token: acountB.state.acount.accessToken,
    );

    if (resp.mensaje != null) {
      direccionesB.add(
        OnLoadDirecciones(
          direcciones: DireccionesResponse(
            direcciones: [],
          ),
        ),
      );
      return false;
    } else {
      direccionesB.add(
        OnLoadDirecciones(direcciones: resp),
      );
      return true;
    }
  }

  /// Tarjetas

  Future<bool> onLoadTarjetas(BuildContext context) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final tarjetasB = BlocProvider.of<TarjetasBloc>(context);

    final resp = await UserServices.tarjetaLoad(
      token: acountB.state.acount.accessToken,
    );

    if (resp.mensaje != null) {
      tarjetasB.add(
        OnLoadTarjetas(
          tarjetas: TarjetasResponse(
            tarjetas: [],
          ),
        ),
      );
      return false;
    } else {
      tarjetasB.add(
        OnLoadTarjetas(tarjetas: resp),
      );
      return true;
    }
  }

  Future<bool> onDeleteTarjetas({
    required BuildContext context,
    required int id,
  }) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final tarjetasB = BlocProvider.of<TarjetasBloc>(context);
    await UserServices.tarjetaRemove(
        token: acountB.state.acount.accessToken, id: id);

    final resp = await UserServices.tarjetaLoad(
      token: acountB.state.acount.accessToken,
    );

    if (resp.mensaje != null) {
      tarjetasB.add(
        OnLoadTarjetas(
          tarjetas: TarjetasResponse(
            tarjetas: [],
          ),
        ),
      );
      return false;
    } else {
      tarjetasB.add(
        OnLoadTarjetas(tarjetas: resp),
      );
      return true;
    }
  }

  Future<bool> onUpdateTarjetas({
    required BuildContext context,
    required TarjetaModel tarjeta,
  }) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final tarjetasB = BlocProvider.of<TarjetasBloc>(context);
    final crea = await UserServices.tarjetaUpdate(
      token: acountB.state.acount.accessToken,
      tarjeta: tarjeta,
    );
    if (crea.mensaje != null) {
      return false;
    }

    final resp = await UserServices.tarjetaLoad(
      token: acountB.state.acount.accessToken,
    );

    if (resp.mensaje != null) {
      tarjetasB.add(
        OnLoadTarjetas(
          tarjetas: TarjetasResponse(
            tarjetas: [],
          ),
        ),
      );
      return false;
    } else {
      tarjetasB.add(
        OnLoadTarjetas(tarjetas: resp),
      );
      return true;
    }
  }

  Future<bool> onCreateTarjetas({
    required BuildContext context,
    required TarjetaModel tarjeta,
  }) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final tarjetasB = BlocProvider.of<TarjetasBloc>(context);
    final crea = await UserServices.tarjetaCreate(
      token: acountB.state.acount.accessToken,
      tarjeta: tarjeta,
    );
    if (crea.mensaje != null) {
      return false;
    }

    final resp = await UserServices.tarjetaLoad(
      token: acountB.state.acount.accessToken,
    );

    if (resp.mensaje != null) {
      tarjetasB.add(
        OnLoadTarjetas(
          tarjetas: TarjetasResponse(
            tarjetas: [],
          ),
        ),
      );
      return false;
    } else {
      tarjetasB.add(
        OnLoadTarjetas(tarjetas: resp),
      );
      return true;
    }
  }

  ///////////////////////////////////////////////
////      Cartera
  Future<bool?> onLoadCartera({
    required BuildContext context,
  }) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final resp = await UserServices.cartera(
      token: acountB.state.acount.accessToken,
    );
    if (resp.mensaje != null) {
      return false;
    }
    // ignore: use_build_context_synchronously
    BlocProvider.of<CarteraBloc>(context).add(OnLoadCartera(cartera: resp));
    return true;
  }

  ///////////////////////////////////////////////
////      suscribcion
  Future<bool?> onLoadSuscribcion({
    required BuildContext context,
  }) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final resp = await UserServices.suscribcion(
      token: acountB.state.acount.accessToken,
    );

    // ignore: use_build_context_synchronously
    BlocProvider.of<UsersusBloc>(context).add(OnLoadSuscribcion(
      suscribcion: resp.suscripcion ??
          Suscripcion(
            montoMensual: 0,
            usuarioId: 0,
          ),
    ));
    return true;
  }
}
