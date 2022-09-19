part of 'orquestador.dart';

class _UserEvent {
  Future<UserEventModel?> onUserEventCreate({
    required BuildContext context,
    required UserEventModel apuesta,
  }) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final resp = await UserEventService.crear(
      apuesta: apuesta,
      token: acountB.state.acount.accessToken,
    );
    return resp;
  }

  /////// historial de Apuestas
  Future<HistorialEventoUsuario?> onLoadHistorialEventos({
    required BuildContext context,
    required int pag,
  }) async {
    final vEB = BlocProvider.of<VideosEventBloc>(context);
    final acountB = BlocProvider.of<AcountBloc>(context);
    if (vEB.state.pag > vEB.state.pags) {
      return null;
    }
    final resp = await UserEventService.listarHistory(
      pag: pag,
      token: acountB.state.acount.accessToken,
    );
    return resp;
  }

  Future<HistorialEventoUsuario?> onIinitHistorialEventos(
      BuildContext context) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final resp = await UserEventService.listarHistory(
      pag: 1,
      token: acountB.state.acount.accessToken,
    );

    return resp;
  }

  // Ganador

  /////// winer
  Future<GanadorResponse?> onLoadWiner({
    required BuildContext context,
    required int pag,
  }) async {
    final vEB = BlocProvider.of<VideosEventBloc>(context);
    final acountB = BlocProvider.of<AcountBloc>(context);
    if (vEB.state.pag > vEB.state.pags) {
      return null;
    }
    final resp = await UserEventService.wins(
      pag: pag,
      token: acountB.state.acount.accessToken,
    );
    return resp;
  }

  Future<GanadorResponse?> onIinitWiner(BuildContext context) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final resp = await UserEventService.wins(
      pag: 1,
      token: acountB.state.acount.accessToken,
    );
    return resp;
  }
}
