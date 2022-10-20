// ignore: unused_import
import 'dart:convert';
import 'package:lotto_music/src/cores/webDart/webcontroller.dart';
import 'package:lotto_music/src/models/buy/historial_compra.dart';
import 'package:lotto_music/src/models/buy/order_response.dart';

import '../../helpers/globals/routes_services.dart';
import '../../models/buy/payment_intent_response.dart';
import '../../models/buy/simplecard.dart';
import '../../models/resp/resp.dart';

class BuyService {
  //////////////////////////////////////////////////////////////////////////////
  ///////////////////////// Seccion de direciones //////////////////////////////
  //////////////////////////////////////////////////////////////////////////////
  // pagos individuales
  static const String _checkout = "${URL.buy}/orders/checkout";
  static const String _createOrden = "${URL.buy}/orders/order";
  static const String _createIntent = "${URL.buy}/orders/payment-intent";
  static const String _payIntent = "${URL.buy}/orders/checkout";
  // pago de suscribciones
  static const String _createOrdenSus = "${URL.buy}/orders/subscription/orden";
  static const String _comprarSus = "${URL.buy}/orders/subscription/checkout";
  static const String _deleteSus = "${URL.buy}/orders/subscription";
  static const String _proSus = "${URL.buy}/orders/subscription/proration";
  static const String _updateSus = "${URL.buy}/orders/subscription/now";
  static const String _changePaySus = "${URL.buy}/orders/subscription/payment";
  // history
  static const String _listar = "${URL.buy}/history";
  static const String _listRechazados = "${URL.buy}/orders/rejected";
  static const String _listWaiting = "${URL.buy}/orders/waiting";
  /*
  //////////////////////////////////////////////////////////////////////////////
  ///////////////////////// Seccion de Pagos unicos ////////////////////////////
  //////////////////////////////////////////////////////////////////////////////
  */
  /// funciones comprar
  static Future<String> checkout({
    required String token,
    required Map<String, dynamic> body,
  }) async {
    final urI = Uri.parse(_checkout);
    final resp = await DartWeb.post(
      url: urI,
      token: token,
      body: body,
    );
    if (resp == null) {
      return "No hay comunicacion con el servidor";
    }
    final parse = json.decode(resp);
    if (parse["mensaje"] != null) {
      return parse["mensaje"];
    }
    return parse["resp"] ?? "";
  }

  static Future<OrdenResponse> createOrden({
    required String token,
  }) async {
    final urI = Uri.parse(_createOrden);
    final resp = await DartWeb.post(
      url: urI,
      token: token,
    );
    if (resp == null) {
      return OrdenResponse(
        mensaje: "error de comunicacion con el servidor",
        itemsOrden: [],
      );
    }
    return OrdenResponse.fromJson(resp);
  }

  static Future<PaymentIntentResponse> crearIntento({
    required String token,
    required Map<String, dynamic> body,
  }) async {
    final urI = Uri.parse(_createIntent);
    final resp = await DartWeb.post(
      url: urI,
      token: token,
      body: body,
    );
    if (resp == null) {
      return PaymentIntentResponse(
        mensaje: "error de comunicacion con el servidor",
      );
    }
    return PaymentIntentResponse.fromJson(resp);
  }

  static Future<SimpleResponse> payIntento({
    required String token,
    required Map<String, dynamic> body,
  }) async {
    final urI = Uri.parse(_payIntent);
    final resp = await DartWeb.post(
      url: urI,
      token: token,
      body: body,
    );
    if (resp == null) {
      return SimpleResponse(
        mensaje: "error de comunicacion con el servidor",
      );
    }
    return SimpleResponse.fromJson(resp);
  }

  /*
  //////////////////////////////////////////////////////////////////////////////
  ///////////////////////// Seccion de Suscripciones ///////////////////////////
  //////////////////////////////////////////////////////////////////////////////
  */

  /// crear orden de suscripcion
  static Future<OrdenResponse> createOrdenSuscripcion({
    required String token,
    required Map<String, dynamic> body,
  }) async {
    final urI = Uri.parse(_createOrdenSus);
    final resp = await DartWeb.post(
      url: urI,
      token: token,
      body: body,
    );
    if (resp == null) {
      return OrdenResponse(
        mensaje: "error de comunicacion con el servidor",
        itemsOrden: [],
      );
    }
    return OrdenResponse.fromJson(resp);
  }

  /// comprar suscribcion
  static Future<SimpleResponse> checkoutSusc({
    required String token,
    required Map<String, dynamic> body,
  }) async {
    final urI = Uri.parse(_comprarSus);
    final resp = await DartWeb.post(
      url: urI,
      token: token,
      body: body,
    );
    if (resp == null) {
      return SimpleResponse(mensaje: "No hay comunicacion con el servidor");
    }

    return SimpleResponse.fromJson(resp);
  }

  /// finalizar la suscripcion
  static Future<SimpleResponse> deleteSus({
    required String token,
  }) async {
    final urI = Uri.parse(_deleteSus);
    final resp = await DartWeb.delete(
      url: urI,
      token: token,
    );
    if (resp == null) {
      return SimpleResponse(mensaje: "No hay comunicacion con el servidor");
    }

    return SimpleResponse.fromJson(resp);
  }

  /// Actualizar suscribcion para el proximo cobro
  static Future<SimpleResponse> prorationSusc({
    required String token,
    required Map<String, dynamic> body,
  }) async {
    final urI = Uri.parse(_proSus);
    final resp = await DartWeb.put(
      url: urI,
      token: token,
      body: body,
    );
    if (resp == null) {
      return SimpleResponse(mensaje: "No hay comunicacion con el servidor");
    }

    return SimpleResponse.fromJson(resp);
  }

  /// Actualizar suscribcion eliminando la anterior
  static Future<SimpleResponse> updateSuscNow({
    required String token,
    required Map<String, dynamic> body,
  }) async {
    final urI = Uri.parse(_updateSus);
    final resp = await DartWeb.put(
      url: urI,
      token: token,
      body: body,
    );
    if (resp == null) {
      return SimpleResponse(mensaje: "No hay comunicacion con el servidor");
    }

    return SimpleResponse.fromJson(resp);
  }

  /// Cambiar metodo de pago
  static Future<SimpleResponse> changePaymentSus({
    required String token,
    required Map<String, dynamic> body,
  }) async {
    final urI = Uri.parse(_changePaySus);
    final resp = await DartWeb.put(
      url: urI,
      token: token,
      body: body,
    );
    if (resp == null) {
      return SimpleResponse(mensaje: "No hay comunicacion con el servidor");
    }

    return SimpleResponse.fromJson(resp);
  }

  /// Cambiar metodo de pago
  static Future<MyPaymentResponse> getPaymentSus({
    required String token,
  }) async {
    final urI = Uri.parse(_changePaySus);
    final resp = await DartWeb.get(
      url: urI,
      token: token,
    );
    if (resp == null) {
      return MyPaymentResponse(mensaje: "No hay comunicacion con el servidor");
    }

    return MyPaymentResponse.fromJson(resp);
  }
  /*
  //////////////////////////////////////////////////////////////////////////////
  ///////////////////////// Seccion de Historial ///////////////////////////////
  //////////////////////////////////////////////////////////////////////////////
  */

  static Future<HistorialCompraModel> listarHistorial({
    required int pag,
    required String token,
  }) async {
    final urI = Uri.parse("$_listar/$pag/10");

    final resp = await DartWeb.get(
      url: urI,
      token: token,
    );
    if (resp == null) {
      return HistorialCompraModel(
        mensjae: "error de comunicacion con el servidor",
      );
    }
    return HistorialCompraModel.fromJson(resp);
  }

  static Future<HistorialCompraModel> historialCancelados({
    required int pag,
    required String token,
  }) async {
    final urI = Uri.parse("$_listRechazados/$pag/10");
    final resp = await DartWeb.get(
      url: urI,
      token: token,
    );
    if (resp == null) {
      return HistorialCompraModel(
        mensjae: "error de comunicacion con el servidor",
      );
    }
    return HistorialCompraModel.fromJson(resp);
  }

  static Future<HistorialCompraModel> historialRechazados({
    required int pag,
    required String token,
  }) async {
    final urI = Uri.parse("$_listWaiting/$pag/10");
    final resp = await DartWeb.get(
      url: urI,
      token: token,
    );
    if (resp == null) {
      return HistorialCompraModel(
        mensjae: "error de comunicacion con el servidor",
      );
    }
    return HistorialCompraModel.fromJson(resp);
  }
}
