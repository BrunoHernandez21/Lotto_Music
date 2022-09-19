part of 'orquestador.dart';

class _Buy {
  Future<String> onBuyCarrito(
      {required BuildContext context, required int tarjeta}) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final resp = await BuyService.checkout(
      token: acountB.state.acount.accessToken,
      tarjeta: tarjeta,
    );
    return resp ?? "error";
  }

  /////// historial de compras
  Future<HistorialCompraModel?> onLoadHistorialCompra({
    required BuildContext context,
    required int pag,
  }) async {
    final vEB = BlocProvider.of<VideosEventBloc>(context);
    final acountB = BlocProvider.of<AcountBloc>(context);
    if (vEB.state.pag > vEB.state.pags) {
      return null;
    }
    final resp = await BuyService.listarHistorial(
      pag: pag,
      token: acountB.state.acount.accessToken,
    );
    return resp;
  }

  Future<HistorialCompraModel?> onIinitHistorialCompra(
      BuildContext context) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final resp = await BuyService.listarHistorial(
      pag: 1,
      token: acountB.state.acount.accessToken,
    );
    return resp;
  }
}
