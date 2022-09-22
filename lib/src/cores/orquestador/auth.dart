part of 'orquestador.dart';

class _Auth {
  Future<bool> onLogin(
    BuildContext context,
    String email,
    String password,
  ) async {
    final acountB = BlocProvider.of<AcountBloc>(context);

    final response = await AcountServices.login(
      email: email.trim(),
      password: password.trim(),
    );

    if (response == null) {
      DialogAlert.ok(
        context: context,
        text: "Error de comunicacion con el servidor",
      );
      return false;
    }
    if (response.mensaje == null) {
      acountB.add(OnLogin(response: response));
      Orquestador.sistem.saveAuthLocale(AcountState(
        acount: response,
        isLogin: true,
      ));
      return true;
    } else {
      DialogAlert.ok(
        context: context,
        text: response.mensaje ?? "Contraseña o Correo Invalido",
      );
      return false;
    }
  }

  Future<bool> onRegister({
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

  Future<bool> onLogOut(BuildContext context) async {
    final userB = BlocProvider.of<UserBloc>(context);
    final acountB = BlocProvider.of<AcountBloc>(context);
    final carB = BlocProvider.of<CarritoBloc>(context);
    final carteraB = BlocProvider.of<CarteraBloc>(context);
    final tarjetasB = BlocProvider.of<TarjetasBloc>(context);
    final direccionesB = BlocProvider.of<DireccionesBloc>(context);
    acountB.add(OnLogout());
    carB.add(OnLoadCarrito(itemsCarrito: const []));
    userB.add(OnLoadUser(user: UserModel()));
    carteraB.add(OnLoadCartera(cartera: CarteraModel()));
    tarjetasB.add(OnLoadTarjetas(tarjetas: TarjetasResponse()));
    direccionesB.add(OnLoadDirecciones(direcciones: DireccionesResponse()));

    Orquestador.sistem.saveAuthLocale(AcountState(
      acount: LoginResponse(),
      isLogin: false,
    ));
    return true;
  }

  Future<bool> onRecovery(BuildContext context, String email) async {
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

  Future<bool> checkToken(BuildContext context) async {
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
    acountB.add(OnLogin(
      response: resp,
    ));

    return true;
  }
}
