import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:lotto_music/src/cores/orquestador/orquestador.dart';

import '../../helpers/globals/enviroments.dart';

class StripeApi {
  // Singleton
  StripeApi._privateConstructor();
  static final StripeApi _intance = StripeApi._privateConstructor();
  factory StripeApi() => _intance;

  Future<void> initState() async {
    Stripe.publishableKey = ENV.stripeKey;
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
      // se crea un metodo de pago con el anterior token
      final params = PaymentMethodParams.cardFromToken(
        paymentMethodData: PaymentMethodDataCardFromToken(
          token: token.id,
        ),
      );
      final paymentmethod = await Stripe.instance.createPaymentMethod(params);
      // se paga
      final resp = await Orquestador.buy.payIntent(
        context: context,
        orden: order,
        paymentId: paymentmethod.id,
      );
      if (resp.mensaje != null) {
        return false;
      }
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
      // se obtiene un token(google) reconozible para stripe
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
      final paymentmethod = await Stripe.instance.createPaymentMethod(params);
      // se paga
      final resp = await Orquestador.buy.payIntent(
        context: context,
        orden: order,
        paymentId: paymentmethod.id,
      );
      if (resp.mensaje != null) {
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> onCreditCartCreate({
    required int order,
    required BuildContext context,
    required CardEditController controller,
  }) async {
    if (!controller.complete) {
      return false;
    }
    const params = PaymentMethodParams.card(
      paymentMethodData: PaymentMethodData(),
    );
    final paymentmethod = await Stripe.instance.createPaymentMethod(params);
    // Se obtiene un intento de pago del servidor;
    final resp = await Orquestador.buy.payIntent(
      context: context,
      orden: order,
      paymentId: paymentmethod.id,
    );
    if (resp.mensaje != null) {
      return false;
    }
    return true;
  }
}
