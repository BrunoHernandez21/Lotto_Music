import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:lotto_music/src/cores/orquestador/orquestador.dart';

class StripeApi {
  // Singleton
  StripeApi._privateConstructor();
  static final StripeApi _intance = StripeApi._privateConstructor();
  factory StripeApi() => _intance;

  Future<void> initState() async {
    Stripe.publishableKey =
        "pk_test_51LhOYXA95JRQPIgUsOVOdMKCgGo5ZaqkvR3P7eYqkJQUBPes2vBaWZSzbR8WwKZQJYv5vh8f7gD3lgwrlFwSo1zL00vRbg0I3q";
    Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
    await Stripe.instance.applySettings();
  }

  Future<bool> onApplePayResult({
    required Map<String, dynamic> paymentResult,
    required int order,
    required BuildContext context,
  }) async {
    try {
      // Se crea un token reconocible para stripe
      final token = await Stripe.instance.createApplePayToken(paymentResult);

      // Se obtiene un intento de pago del servidor;
      final intento = await Orquestador.buy.createPaymentIntent(
        context: context,
        orden: order,
      );

      // se crea un metodo de pago con el anterior token
      final params = PaymentMethodParams.cardFromToken(
        paymentMethodData: PaymentMethodDataCardFromToken(
          token: token.id,
        ),
      );

      // Se compra (las compras llegan el webhook)
      await Stripe.instance.confirmPayment(intento.clientSecret, params);

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> onGooglePayResult({
    required Map<String, dynamic> paymentResult,
    required int order,
    required BuildContext context,
  }) async {
    try {
      // Se obtiene un intento de pago del servidor;
      final intento = await Orquestador.buy.createPaymentIntent(
        context: context,
        orden: order,
      );
      if (intento.mensaje != null) {
        return false;
      }
      // se obtiene un token reconozible para stripe
      final tokenJson = Map.castFrom(
        json.decode(
          paymentResult['paymentMethodData']['tokenizationData']['token'],
        ),
      );
      final token = tokenJson['id'];
      // se crea un metodo de pago con el anterior token
      final params = PaymentMethodParams.cardFromToken(
        paymentMethodData: PaymentMethodDataCardFromToken(
          token: token,
        ),
      );
      //Se compra (las compras llegan el webhook)
      await Stripe.instance.confirmPayment(
        intento.clientSecret,
        params,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> onCreditCartCreate(
      {required int order,
      required BuildContext context,
      required CardEditController controller}) async {
    if (controller.complete) {
      const params = PaymentMethodParams.card(
        paymentMethodData: PaymentMethodData(),
      );
      // Stripe.instance.createPaymentMethod(params);
      // Se obtiene un intento de pago del servidor;
      final intento = await Orquestador.buy.createPaymentIntent(
        context: context,
        orden: order,
      );
      Stripe.instance.confirmPayment(intento.clientSecret, params);

      return true;
    } else {
      return false;
    }
  }
}
