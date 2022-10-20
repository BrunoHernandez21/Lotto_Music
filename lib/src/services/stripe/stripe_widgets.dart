import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart' as str;
import 'package:lotto_music/src/helpers/globals/screen_size.dart';
import 'package:lotto_music/src/services/stripe/stripe_api.dart';
import 'package:pay/pay.dart';

import '../../widgets/text.dart';

class MyPayButton extends StatefulWidget {
  final String amount;
  final Future<void> Function(String?) onPayIDResult;
  const MyPayButton({
    Key? key,
    required this.amount,
    required this.onPayIDResult,
  }) : super(key: key);

  @override
  State<MyPayButton> createState() => PayButtonState();
}

class PayButtonState extends State<MyPayButton> {
  final exito = const SnackBar(content: Text('Terminado de manera exitosa'));
  final exitont = const SnackBar(content: Text('Error al generar compra'));
  @override
  Widget build(BuildContext context) {
    return Theme.of(context).platform == TargetPlatform.iOS
        ? ApplePayButton(
            paymentConfigurationAsset: 'apple_pay_payment_profile.json',
            paymentItems: <PaymentItem>[
              PaymentItem(
                amount: widget.amount,
                label: "Lotto Music Buy",
                status: PaymentItemStatus.final_price,
              ),
            ],
            margin: const EdgeInsets.only(top: 15),
            onPaymentResult: (a) async {
              final payID = await StripeApi().createApplePaymentToken(
                paymentResult: a,
              );
              widget.onPayIDResult(payID);
            },
            loadingIndicator: const Center(
              child: CircularProgressIndicator(),
            ),
            childOnError: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Textos.parrafoMIN(
                  texto: 'Apple Pay is not suport',
                  color: Colors.white,
                )),
            onError: (e) {
              if (e.toString().contains("paymentCanceled")) {
                return;
              }
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  action: SnackBarAction(
                    label: "Done",
                    onPressed: (() {}),
                  ),
                  content: const Text('No se pudo finalizar la compra'),
                ),
              );
            },
          )
        : GooglePayButton(
            paymentConfigurationAsset: 'google_pay_payment_profile.json',
            paymentItems: <PaymentItem>[
              PaymentItem(
                amount: widget.amount,
                label: "Lotto Music Buy",
                status: PaymentItemStatus.final_price,
              ),
            ],
            margin: const EdgeInsets.only(top: 15),
            onPaymentResult: (a) async {
              final payID = await StripeApi().createGooglePaymentToken(
                paymentResult: a,
              );
              widget.onPayIDResult(payID);
            },
            loadingIndicator: const Center(
              child: CircularProgressIndicator(),
            ),
            onPressed: () async {},
            childOnError: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Textos.parrafoMIN(
                  texto: 'Google Pay is not suport',
                  color: Colors.white,
                )),
            onError: (e) {
              if (e.toString().contains("paymentCanceled")) {
                return;
              }
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  action: SnackBarAction(
                    label: "Done",
                    onPressed: () {},
                  ),
                  content: const Text('No se pudo finalizar la compra'),
                ),
              );
            },
          );
  }
}

class RequestCard extends StatefulWidget {
  final Future<void> Function(String?) onPayIDResult;
  final String amount;
  final void Function() onBack;
  const RequestCard({
    Key? key,
    required this.amount,
    required this.onBack,
    required this.onPayIDResult,
  }) : super(key: key);

  @override
  State<RequestCard> createState() => RequestCardState();
}

class RequestCardState extends State<RequestCard> {
  final exito = const SnackBar(content: Text('Terminado de manera exitosa'));
  final exitont = const SnackBar(content: Text('Error al generar compra'));
  final controller = str.CardEditController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      height: Medidas.size.height * .3,
      child: Column(
        children: [
          const SizedBox(width: double.infinity),
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: widget.onBack,
            ),
          ),
          // ignore: avoid_unnecessary_containers
          Container(
            child: str.CardField(
              controller: controller,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 200,
            child: LoadingButton(
              text: 'Pay',
              onPressed: () async {
                if (!controller.complete) {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(exitont);
                  return;
                }
                final payID = await StripeApi().createCreditCartToken(
                  controller: controller,
                );
                widget.onPayIDResult(payID);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LoadingButton extends StatefulWidget {
  final Future Function()? onPressed;
  final String text;

  const LoadingButton({Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  LoadingButtonState createState() => LoadingButtonState();
}

class LoadingButtonState extends State<LoadingButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12)),
            onPressed:
                (_isLoading || widget.onPressed == null) ? null : _loadFuture,
            child: _isLoading
                ? const SizedBox(
                    height: 22,
                    width: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ))
                : Text(widget.text),
          ),
        ),
      ],
    );
  }

  Future<void> _loadFuture() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await widget.onPressed!();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error $e')));
      rethrow;
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
