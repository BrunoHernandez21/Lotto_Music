import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:lotto_music/src/models/resp/resp.dart';

import '../../../bloc/usersus/usersus_bloc.dart';
import '../../../cores/orquestador/orquestador.dart';
import '../../../models/buy/simplecard.dart';
import '../../../models/user/suscripcion.dart';
import '../../../services/stripe/stripe_widgets.dart';
import '../../../widgets/dialogs_alert.dart';
import '../../../widgets/text.dart';

class ChangePaymentSus extends StatefulWidget {
  static const String routeName = 'changepaymentSus';
  const ChangePaymentSus({Key? key}) : super(key: key);

  @override
  State<ChangePaymentSus> createState() => _ChangePaymentSusState();
}

class _ChangePaymentSusState extends State<ChangePaymentSus> {
  @override
  void initState() {
    super.initState();
  }

  final TextEditingController controller = TextEditingController();
  bool alertDialog = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<UsersusBloc, UsersusState>(
          builder: (context, state) {
            if (state.suscribcion == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final susc = (state.suscribcion ??
                Suscripcion(montoMensual: 0, usuarioId: 0));
            return Stack(
              children: [
                bodyBuy(susc),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Visibility(
                    visible: alertDialog,
                    child: RequestCard(
                      amount: susc.montoMensual.toString(),
                      onBack: () {
                        alertDialog = false;
                        setState(() {});
                      },
                      onPayIDResult: (payID) async {
                        myPay(payID, susc);
                      },
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }

  Widget bodyBuy(Suscripcion susc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          width: double.infinity,
        ),
        Textos.tituloMAX(
          texto: "Cambiar metodo de pago",
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            child: Column(
              children: [
                Textos.tituloMED(texto: "Tarjeta actual"),
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: FutureBuilder<MyPaymentResponse>(
                    future:
                        Orquestador.buy.getSuscripcionPayment(context: context),
                    builder: (context, snap) {
                      final data = snap.data;
                      if (data.runtimeType != MyPaymentResponse) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return CreditCardWidget(
                        glassmorphismConfig:
                            null, //false ? Glassmorphism.defaultConfig() : null,
                        cardNumber: "0000 0000 0000 ${data?.last4 ?? "0000"}",
                        expiryDate:
                            "${data?.expMonth ?? ""}/${data?.expYear ?? ""}",
                        cardHolderName: "",
                        cvvCode: "",
                        showBackView: false,
                        obscureCardNumber: false,
                        obscureCardCvv: true,
                        cardBgColor: Colors.blue,
                        isChipVisible: true,
                        isSwipeGestureEnabled: true,
                        onCreditCardWidgetChange: (p0) {},
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Textos.parrafoMIN(
            renglones: 3,
            align: TextAlign.justify,
            texto:
                "(1).- Pagar con GPay o ApplePay: \nElige una tarjeta de tu provedor (no disponible para huawei).",
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Textos.parrafoMIN(
            renglones: 3,
            align: TextAlign.left,
            texto:
                "(2) Tarjeta: \nIngrese manualmente una tarjeta a la que llegaran los cargos mensuales.",
          ),
        ),
        const Divider(
          color: Colors.black,
          height: 40,
          thickness: 2,
          endIndent: 50,
          indent: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              child: SizedBox(
                width: 150,
                height: 60,
                child: MyPayButton(
                  amount: susc.montoMensual.toString(),
                  onPayIDResult: (payID) async {
                    myPay(payID, susc);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: SizedBox(
                width: 150,
                height: 45,
                child: ButtonCardCrate(onRequest: () {
                  alertDialog = true;
                  setState(() {});
                }),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> myPay(String? payID, Suscripcion orden) async {
    if (payID == null) {
      return;
    }
    // Paga la suscripcion o el pago
    SimpleResponse resp = SimpleResponse();

    // Imprime un mensaje conforme a la respuesta
    if (resp.mensaje != null) {
      // ignore: use_build_context_synchronously
      await DialogAlert.ok(
        context: context,
        text: "Compra realizada con exito",
      );
      Orquestador.user.onLoadCartera(context: context);

      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
      return;
    }
    // ignore: use_build_context_synchronously
    await DialogAlert.ok(
      context: context,
      text: "Error al comprar",
    );
  }
}

class ButtonCardCrate extends StatelessWidget {
  final void Function() onRequest;
  const ButtonCardCrate({Key? key, required this.onRequest}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onRequest,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Textos.parrafoMED(texto: "Tarjeta", color: Colors.white),
            const SizedBox(width: 4),
            const Icon(
              Icons.credit_card,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
