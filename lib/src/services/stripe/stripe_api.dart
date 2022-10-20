import 'dart:convert';
import 'package:flutter_stripe/flutter_stripe.dart';

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

  Future<String?> createApplePaymentToken({
    required Map<String, dynamic> paymentResult,
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
      return paymentmethod.id;
    } catch (e) {
      return null;
    }
  }

  Future<String?> createGooglePaymentToken({
    required Map<String, dynamic> paymentResult,
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
      return paymentmethod.id;
    } catch (e) {
      return null;
    }
  }

  Future<String?> createCreditCartToken({
    required CardEditController controller,
  }) async {
    if (!controller.complete) {
      return null;
    }
    const params = PaymentMethodParams.card(
      paymentMethodData: PaymentMethodData(),
    );
    final paymentmethod = await Stripe.instance.createPaymentMethod(params);
    return paymentmethod.id;
  }
}
