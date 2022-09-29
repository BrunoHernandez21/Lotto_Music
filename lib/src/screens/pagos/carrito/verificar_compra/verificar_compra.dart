import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:lotto_music/src/bloc/tarjetas/tarjetas_bloc.dart';
import 'package:lotto_music/src/models/user/tarjetas_response.dart';
import '../../../../bloc/carrito/carrito_bloc.dart';
import '../../../../bloc/dialogs_on_display/widget_dialog.dart';
import '../../../../cores/orquestador/orquestador.dart';
import '../../../../widgets/dialogs_alert.dart';
import 'buy_card.dart';
import 'select_tarjet.dart';
import 'state_carrito.dart';

class VerificarCompra extends StatefulWidget {
  static const routeName = "verificarCompra";
  const VerificarCompra({Key? key}) : super(key: key);

  @override
  State<VerificarCompra> createState() => _VerificarCompraState();
}

class _VerificarCompraState extends State<VerificarCompra> {
  @override
  void initState() {
    SCL.clear();
    super.initState();
  }

  final TextEditingController controller = TextEditingController();
  bool alertDialog = false;
  @override
  Widget build(BuildContext context) {
    return DialogOnDisplayWidget(
      child: Scaffold(
          appBar: AppBar(),
          body: BlocBuilder<CarritoBloc, CarritoState>(
            builder: (context, carState) {
              if (carState.itemsCarrito == null) {
                Orquestador.shopingcar.onloadCarrito(context);
              }
              final moneda = (carState.itemsCarrito?.isEmpty ?? true)
                  ? "MXN"
                  : carState.itemsCarrito?.first.moneda ?? "MXN";
              double total = 0;
              carState.itemsCarrito?.forEach((i) {
                total += i.totalLinea;
              });
              return BlocBuilder<TarjetasBloc, TarjetasState>(
                builder: (context, tarState) {
                  if (tarState.tarjetas == null) {
                    Orquestador.user.onLoadTarjetas(context);
                  }

                  return Stack(
                    children: [
                      BodySelector(
                        moneda: moneda,
                        total: total,
                        tarjetas: tarState.tarjetas ?? TarjetasResponse(),
                        onchage: () async {
                          if (SCL.index == -1) {
                            DialogAlert.ok(
                              context: context,
                              text: "Seleccione una tarjeta",
                            );
                            return;
                          }

                          alertDialog = true;
                          setState(() {});
                        },
                      ),
                      Visibility(
                        visible: alertDialog,
                        child: AlertBuy(
                          controller: controller,
                          onchage: () async {
                            alertDialog = false;
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          )),
    );
  }
}
