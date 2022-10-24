import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotto_music/src/bloc/buy/buy_bloc.dart';
import 'package:lotto_music/src/cores/orquestador/orquestador.dart';
import 'package:lotto_music/src/models/resp/resp.dart';
import 'package:lotto_music/src/widgets/dialogs_alert.dart';
import '../../../../bloc/dialogs_on_display/widget_dialog.dart';
import '../../../../models/buy/order_response.dart';
import '../../../../services/stripe/stripe_widgets.dart';
import '../../../../widgets/text.dart';

class VerificarCompra extends StatefulWidget {
  static const routeName = "verificarCompra";
  const VerificarCompra({Key? key}) : super(key: key);

  @override
  State<VerificarCompra> createState() => _VerificarCompraState();
}

class _VerificarCompraState extends State<VerificarCompra> {
  @override
  void initState() {
    super.initState();
  }

  final TextEditingController controller = TextEditingController();
  bool alertDialog = false;
  @override
  Widget build(BuildContext context) {
    return DialogOnDisplayWidget(
      child: Scaffold(
          appBar: AppBar(),
          body: BlocBuilder<BuyBloc, BuyState>(
            builder: (context, state) {
              if (state.orden.orden == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final orden = (state.orden.orden ?? Orden());
              return Stack(
                children: [
                  bodyBuy(state.orden),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Visibility(
                      visible: alertDialog,
                      child: RequestCard(
                        amount: orden.precioTotal.toString(),
                        onBack: () {
                          alertDialog = false;
                          setState(() {});
                        },
                        onPayIDResult: (payID) async {
                          await myPay(payID, orden);
                        },
                      ),
                    ),
                  )
                ],
              );
            },
          )),
    );
  }

  Widget bodyBuy(OrdenResponse state) {
    final orden = (state.orden ?? Orden());
    final isSus = orden.isSuscription;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: double.infinity,
        ),
        Align(
          alignment: Alignment.center,
          child: Visibility(
            visible: !isSus,
            child: Textos.tituloMAX(
              texto: "Listado de compra",
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Visibility(
            visible: isSus,
            child: Textos.tituloMAX(texto: "Suscripcion a comprar"),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Visibility(
          visible: !isSus,
          child: Align(
            alignment: Alignment.center,
            child: Textos.tituloMAX(
              texto:
                  "Total: ${state.orden?.precioTotal ?? 0} ${state.orden?.moneda ?? ""}",
            ),
          ),
        ),
        Visibility(
          visible: isSus,
          child: Align(
            alignment: Alignment.center,
            child: Textos.tituloMAX(
              texto:
                  "Total: ${state.orden?.precioTotal ?? 0} ${state.orden?.moneda ?? ""}/mes",
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Flexible(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            itemCount: state.itemsOrden.length,
            itemBuilder: (BuildContext context, int i) {
              return _Items(
                item: state.itemsOrden[i],
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Textos.parrafoMIN(
            renglones: 3,
            align: TextAlign.left,
            texto: "1.- Pagar con GPay o ApplePay:",
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Textos.parrafoMIN(
            renglones: 3,
            align: TextAlign.justify,
            texto:
                "Pagos protegidos por Stripe y su provedor de servicio de tarjetas",
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Visibility(
          visible: !isSus,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Textos.parrafoHiper(
              texto:
                  "Usted esta comprando puntos de lotto music, al hacer esto usted acepta nuestros ",
              hipertext: "terminos y condiciones",
              colorTexto:
                  Theme.of(context).textTheme.bodyText1?.color ?? Colors.black,
              onTap: () {},
            ),
          ),
        ),
        Visibility(
          visible: isSus,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Textos.parrafoHiper(
              texto:
                  "Usted esta comprando una suscripción de puntos con cargo mensual, al hacer esto acepta nuestros ",
              hipertext: "terminos y condiciones",
              colorTexto:
                  Theme.of(context).textTheme.bodyText1?.color ?? Colors.black,
              aling: TextAlign.justify,
              onTap: () {},
            ),
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
                  amount: orden.precioTotal.toString(),
                  onPayIDResult: (payID) async {
                    myPay(payID, orden);
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

  Future<void> myPay(String? payID, Orden orden) async {
    if (payID == null) {
      return;
    }
    // Paga la suscripcion o el pago
    SimpleResponse resp = SimpleResponse();
    if (orden.isSuscription) {
      resp = await Orquestador.buy.paySuscripcion(
        context: context,
        orden: orden.id,
        paymentId: payID,
      );
    } else {
      resp = await Orquestador.buy.payIntent(
        context: context,
        orden: orden.id,
        paymentId: payID,
      );
    }
    // Imprime un mensaje conforme a la respuesta
    if ((resp.mensaje ?? "") == "") {
      // ignore: use_build_context_synchronously
      await DialogAlert.ok(
        context: context,
        text: "Compra realizada con exito",
      );
      if (orden.isSuscription) {
        Orquestador.user.onLoadSuscribcion(context: context);
      }
      Orquestador.user.onLoadCartera(context: context);
      Orquestador.shopingcar.onloadCarrito(context: context);
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

class _Items extends StatelessWidget {
  final ItemsOrden item;
  const _Items({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Textos.parrafoMAX(texto: "Plan ${item.titulo}"),
      subtitle:
          Textos.parrafoMED(texto: "Subtotal ${item.totalLinea}${item.moneda}"),
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
