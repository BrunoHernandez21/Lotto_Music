import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotto_music/src/bloc/buy/buy_bloc.dart';
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
              return Stack(
                children: [
                  bodyBuy(state),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Visibility(
                        visible: alertDialog,
                        child: RequestCard(
                            orden: state.orden.orden ?? Orden(),
                            onBack: () {
                              alertDialog = false;
                              setState(() {});
                            })),
                  )
                ],
              );
            },
          )),
    );
  }

  Widget bodyBuy(BuyState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          width: double.infinity,
        ),
        Textos.tituloMAX(texto: "Compra"),
        Textos.tituloMAX(
          texto:
              "Total: ${state.orden.orden?.precioTotal ?? 0} ${state.orden.orden?.moneda ?? ""}",
        ),
        Flexible(
          child: ListView.builder(
            itemCount: state.orden.itemsOrden.length,
            itemBuilder: (BuildContext context, int i) {
              return _Items(
                item: state.orden.itemsOrden[i],
              );
            },
          ),
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
                  orden: state.orden.orden ?? Orden(),
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
