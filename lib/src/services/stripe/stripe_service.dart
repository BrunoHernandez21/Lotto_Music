// import 'package:lotto_music/src/models/user/tarjetas.dart';
// import 'package:meta/meta.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';

// class StripeService {
//   // Singleton
//   StripeService._privateConstructor();
//   static final StripeService _intance = StripeService._privateConstructor();
//   factory StripeService() => _intance;

//   static const String _paymentApiUrl =
//       'https://api.stripe.com/v1/payment_intents';
//   static const String _secretKey =
//       'sk_test_51HIgBqKmrePqgf9DSVeUNw7GfLlNJBlwn2JWDBVdimhHCO7N2fW8vgQBWUBKYontobwkXSWXv3hTUPVtZ5PHVKXz007MjU1qPW';
//   static const String _apiKey =
//       'pk_test_51HIgBqKmrePqgf9DEW9flGs2Sy1ZKBnIYrCnw8DcMnSc5D0rvB13IETHc3mUZoPUePx4eZ50SvVFSn74RaK5WF1B00EcvZTSxb';

//   final headerOptions = Options(
//       contentType: Headers.formUrlEncodedContentType,
//       headers: {'Authorization': 'Bearer ${StripeService._secretKey}'});

//   void init() {
//     final a = Stripe.instance;
//     a.presentApplePay(ApplePayPresentParams(cartItems: [],country: "",currency: "MXN"));
//     a.createPaymentMethod(PaymentMethodParams.alipay(paymentMethodData: paymentMethodData));
//     a.createGooglePayPaymentMethod(params)
//     StripePayment.setOptions(StripeOptions(
//         publishableKey: StripeService._apiKey,
//         androidPayMode: 'test',
//         merchantId: 'test'));
//   }

//   Future<StripeCustomResponse> pagarConTarjetaExiste({
//     @required String amount,
//     @required String currency,
//     @required TarjetaModel card,
//   }) async {
//     try {
//       final paymentMethod = await StripePayment.createPaymentMethod(
//           PaymentMethodRequest(card: card));

//       final resp = await this._realizarPago(
//           amount: amount, currency: currency, paymentMethod: paymentMethod);

//       return resp;
//     } catch (e) {
//       return StripeCustomResponse(ok: false, msg: e.toString());
//     }
//   }

//   Future<StripeCustomResponse> pagarConNuevaTarjeta({
//     @required String amount,
//     @required String currency,
//   }) async {
//     try {
//       final paymentMethod = await StripePayment.paymentRequestWithCardForm(
//           CardFormPaymentRequest());

//       final resp = await this._realizarPago(
//           amount: amount, currency: currency, paymentMethod: paymentMethod);

//       return resp;
//     } catch (e) {
//       return StripeCustomResponse(ok: false, msg: e.toString());
//     }
//   }

//   Future<StripeCustomResponse> pagarApplePayGooglePay({
//     @required String amount,
//     @required String currency,
//   }) async {
//     try {
//       final newAmount = double.parse(amount) / 100;

//       final token = await Stripe.StripePayment.paymentRequestWithNativePay(
//           androidPayOptions: AndroidPayPaymentRequest(
//             totalPrice: amount,
//             currencyCode: currency,
//           ),
//           applePayOptions: ApplePayPaymentOptions(
//               countryCode: 'US',
//               currencyCode: currency,
//               items: [
//                 ApplePayItem(label: 'Super producto 1', amount: '$newAmount')
//               ]));

//       final paymentMethod = await StripePayment.createPaymentMethod(
//           PaymentMethodRequest(card: CreditCard(token: token.tokenId)));

//       final resp = await this._realizarPago(
//           amount: amount, currency: currency, paymentMethod: paymentMethod);

//       await StripePayment.completeNativePayRequest();

//       return resp;
//     } catch (e) {
//       print('Error en intento: ${e.toString()}');
//       return StripeCustomResponse(ok: false, msg: e.toString());
//     }
//   }

//   Future<PaymentIntentResponse> _crearPaymentIntent({
//     @required String amount,
//     @required String currency,
//   }) async {
//     try {
//       final dio = new Dio();
//       final data = {'amount': amount, 'currency': currency};

//       final resp =
//           await dio.post(_paymentApiUrl, data: data, options: headerOptions);

//       return PaymentIntentResponse.fromJson(resp.data);
//     } catch (e) {
//       print('Error en intento: ${e.toString()}');
//       return PaymentIntentResponse(status: '400');
//     }
//   }

//   Future<StripeCustomResponse> _realizarPago(
//       {@required String amount,
//       @required String currency,
//       @required PaymentMethod paymentMethod}) async {
//     try {
//       // Crear el intent
//       final paymentIntent =
//           await this._crearPaymentIntent(amount: amount, currency: currency);

//       final paymentResult = await StripePayment.confirmPaymentIntent(
//           PaymentIntent(
//               clientSecret: paymentIntent.clientSecret,
//               paymentMethodId: paymentMethod.id));

//       if (paymentResult.status == 'succeeded') {
//         return StripeCustomResponse(ok: true);
//       } else {
//         return StripeCustomResponse(
//             ok: false, msg: 'Fallo: ${paymentResult.status}');
//       }
//     } catch (e) {
//       print(e.toString());
//       return StripeCustomResponse(ok: false, msg: e.toString());
//     }
//   }
// }
