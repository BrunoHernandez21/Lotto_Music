part of 'orquestador.dart';

class _Buy {
  ////////////////////////////////////////////////////////////////////////////
  /////////////////////////// Pagos unicos ///////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////
  Future<String?> craeteOrden({
    required BuildContext context,
  }) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final resp = await BuyService.createOrden(
      token: acountB.state.acount.accessToken,
    );
    // ignore: use_build_context_synchronously
    BlocProvider.of<BuyBloc>(context).add(OnloadOrden(orden: resp));
    return resp.mensaje;
  }

  Future<PaymentIntentResponse> createPaymentIntent({
    required BuildContext context,
    required int orden,
  }) async {
    final acountB = BlocProvider.of<AcountBloc>(context);

    final body = {
      "orden_id": orden,
    };
    final resp = await BuyService.crearIntento(
      token: acountB.state.acount.accessToken,
      body: body,
    );
    return resp;
  }

  Future<SimpleResponse> payIntent({
    required BuildContext context,
    required int orden,
    required String paymentId,
  }) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final body = {
      "orden_id": orden,
      "stripe_payment": paymentId,
    };
    final resp = await BuyService.payIntento(
      token: acountB.state.acount.accessToken,
      body: body,
    );
    return resp;
  }

  ////////////////////////////////////////////////////////////////////////////
  /////////////////////////// Suscribciones ///////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////
  Future<String?> craeteOrdenSuscripcion({
    required BuildContext context,
    required int planID,
  }) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final resp = await BuyService.createOrdenSuscripcion(
      token: acountB.state.acount.accessToken,
      body: {"plan_id": planID},
    );
    // ignore: use_build_context_synchronously
    BlocProvider.of<BuyBloc>(context).add(OnloadOrden(orden: resp));
    return resp.mensaje;
  }

  Future<SimpleResponse> paySuscripcion({
    required BuildContext context,
    required int orden,
    required String paymentId,
  }) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final resp = await BuyService.checkoutSusc(
      token: acountB.state.acount.accessToken,
      body: {
        "orden_id": orden,
        "stripe_payment": paymentId,
      },
    );
    return resp;
  }

  Future<SimpleResponse> finishSuscripcion({
    required BuildContext context,
  }) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final resp = await BuyService.deleteSus(
      token: acountB.state.acount.accessToken,
    );
    return resp;
  }

  Future<SimpleResponse> changeSuscripcionNow({
    required BuildContext context,
    required int orden,
  }) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final resp = await BuyService.updateSuscNow(
      token: acountB.state.acount.accessToken,
      body: {"orden_id": orden},
    );
    return resp;
  }

  Future<SimpleResponse> changeSuscripcionProration({
    required BuildContext context,
    required int orden,
  }) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final resp = await BuyService.prorationSusc(
      token: acountB.state.acount.accessToken,
      body: {"orden_id": orden},
    );
    return resp;
  }

  Future<SimpleResponse> changeSuscripcionPayment({
    required BuildContext context,
    required String paymentID,
  }) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final resp = await BuyService.changePaymentSus(
      token: acountB.state.acount.accessToken,
      body: {"stripe_payment": paymentID},
    );
    return resp;
  }

  Future<MyPaymentResponse> getSuscripcionPayment({
    required BuildContext context,
  }) async {
    final acountB = BlocProvider.of<AcountBloc>(context);
    final resp = await BuyService.getPaymentSus(
      token: acountB.state.acount.accessToken,
    );
    return resp;
  }

  ////////////////////////////////////////////////////////////////////////////
  /////////////////////////// Historial de compra ////////////////////////////
  ////////////////////////////////////////////////////////////////////////////
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
    try {
      final acountB = BlocProvider.of<AcountBloc>(context);
      final resp = await BuyService.listarHistorial(
        pag: 1,
        token: acountB.state.acount.accessToken,
      );
      return resp;
    } catch (e) {
      return null;
    }
  }
}
