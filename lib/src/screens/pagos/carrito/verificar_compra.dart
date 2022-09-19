import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotto_music/src/bloc/tarjetas/tarjetas_bloc.dart';
import 'package:lotto_music/src/widgets/dialogs_alert.dart';
import '../../../bloc/carrito/carrito_bloc.dart';
import '../../../cores/orquestador/orquestador.dart';
import '../../../helpers/globals/screen_size.dart';
import '../../../models/user/tarjetas.dart';
import '../../../models/user/tarjetas_response.dart';
import '../../../widgets/botones.dart';
import '../../../widgets/text.dart';
import '../../perfil/tarjetas/tarjetas_add.dart';

class VerificarCompra extends StatefulWidget {
  static const routeName = "verificarCompra";
  const VerificarCompra({Key? key}) : super(key: key);

  @override
  State<VerificarCompra> createState() => _VerificarCompraState();
}

class _VerificarCompraState extends State<VerificarCompra> {
  int index = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: BlocBuilder<CarritoBloc, CarritoState>(
        builder: (context, carState) {
          if (carState.itemsCarrito == null) {
            Orquestador.shopingcar.onloadCarrito(context);
          }
          double total = 0;
          carState.itemsCarrito?.forEach((i) {
            total += i.totalLinea;
          });
          return BlocBuilder<TarjetasBloc, TarjetasState>(
            builder: (context, tarState) {
              if (tarState.tarjetas == null) {
                Orquestador.user.onLoadTarjetas(context);
              }

              return bodyValidate(carState, total, tarState);
            },
          );
        },
      ),
    );
  }

  Widget bodyValidate(
    CarritoState carState,
    double total,
    TarjetasState tarState,
  ) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Cabezera(
            moneda: (carState.itemsCarrito?.isNotEmpty ?? false)
                ? (carState.itemsCarrito!.first.moneda ?? "MXN")
                : "MXN",
            total: total,
          ),
          RefreshIndicator(
            onRefresh: () async {
              Orquestador.shopingcar.onloadCarrito(context);
              Orquestador.user.onLoadTarjetas(context);
            },
            child: Column(
              children: [
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  child: Column(
                    children: [
                      ...listaTarjetasWidget(tarState.tarjetas),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 150,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: Medidas.size.width * .5,
                child: Botones.degradedTextButton(
                  text: "Comprar",
                  colors: const [Color(0xffea8d8d), Color(0xffa890fe)],
                  onTap: () async {
                    if (index == -1) {
                      DialogAlert.ok(
                        context: context,
                        text: "Seleccione una tarjeta",
                      );
                      return;
                    }
                    final a = await Orquestador.buy.onBuyCarrito(
                      context: context,
                      tarjeta: tarState.tarjetas?.tarjetas?[index].id ?? 0,
                    );

                    // ignore: use_build_context_synchronously
                    await Orquestador.shopingcar.onloadCarrito(context);
                    if (!mounted) {
                      return;
                    }
                    await DialogAlert.ok(
                      context: context,
                      text: a,
                    );

                    if (!mounted) {
                      return;
                    }
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> listaTarjetasWidget(TarjetasResponse? estado) {
    List<Widget> lista = [];
    for (int i = 0; i < (estado?.tarjetas?.length ?? 0); i++) {
      lista.add(_Tarjeta(
        evento: estado!.tarjetas![i],
        isSelected: index == i,
        onChange: (a) {
          index = i;

          setState(() {});
        },
      ));
    }

    if ((estado?.tarjetas?.length ?? 0) < 2) {
      lista.add(SizedBox(
        height: Medidas.size.height * .25,
      ));
    }
    return lista;
  }
}

class _Tarjeta extends StatelessWidget {
  final TarjetaModel evento;
  final bool isSelected;
  final Function(bool? change) onChange;
  const _Tarjeta({
    Key? key,
    required this.evento,
    required this.isSelected,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: isSelected,
        onChanged: onChange,
      ),
      title: Textos.parrafoMAX(texto: evento.cardNumber),
      subtitle: Textos.parrafoMED(texto: evento.holderName),
    );
  }
}

class Cabezera extends StatelessWidget {
  final double total;
  final String moneda;
  const Cabezera({
    Key? key,
    required this.moneda,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Textos.tituloMAX(texto: "Compra"),
        Textos.tituloMAX(
          texto: "Total: $total $moneda",
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: TextButton(
                child: Textos.tituloMIN(
                    texto: "Agregar metodo de pago", color: Colors.blueAccent),
                onPressed: () {
                  Navigator.pushNamed(context, TarjetasADD.routeName);
                },
              ),
            )
          ],
        )
      ],
    );
  }
}
