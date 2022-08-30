import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotto_music/src/bloc/tarjetas/tarjetas_bloc.dart';

import '../../../bloc/carrito/carrito_bloc.dart';
import '../../../cores/compositor.dart';
import '../../../helpers/variables_globales.dart';
import '../../../models/tarjetas.dart';
import '../../../models/tarjetas_response.dart';
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
  List<bool> checkListestate = [];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: BlocBuilder<CarritoBloc, CarritoState>(
        builder: (context, carState) {
          if (carState.itemsCarrito == null) {
            Compositor.onLoadTarjetas(context);
          }
          double total = 0;
          carState.itemsCarrito?.forEach((i) {
            total += i.totalLinea;
          });
          return BlocBuilder<TarjetasBloc, TarjetasState>(
            builder: (context, tarState) {
              if (tarState.tarjetas == null) {
                Compositor.onLoadTarjetas(context);
              }

              return bodyValidate(carState, total, context, tarState);
            },
          );
        },
      ),
    );
  }

  Column bodyValidate(CarritoState carState, double total, BuildContext context,
      TarjetasState tarState) {
    return Column(
      children: [
        Cabezera(
          moneda: (carState.itemsCarrito?.isNotEmpty ?? false)
              ? (carState.itemsCarrito!.first.moneda ?? "MXN")
              : "MXN",
          total: total,
        ),
        RefreshIndicator(
          onRefresh: () async {
            Compositor.onLoadTarjetas(context);
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
        const Expanded(child: SizedBox()),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: Medidas.size.width * .5,
              child: Botones.degradedTextButton(
                text: "Comprar",
                colors: const [Color(0xffea8d8d), Color(0xffa890fe)],
                onTap: () async {
                  await Compositor.onBuyCarrito(
                    context: context,
                  );
                  if (!mounted) {
                    return;
                  }
                  Compositor.onloadCarrito(context);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> listaTarjetasWidget(TarjetasResponse? estado) {
    List<Widget> lista = [];
    for (int i = 0; i < (estado?.tarjetas?.length ?? 0); i++) {
      checkListestate.add(estado!.tarjetas![i].defaultPayment);
      if (estado.tarjetas![i].defaultPayment) {
        index = i;
      }

      lista.add(_Tarjeta(
        evento: estado.tarjetas![i],
        isSelected: checkListestate[i],
        onChange: (a) {
          for (int n = 0; n < checkListestate.length; n++) {
            if (i == n) {
              checkListestate[n] = true;
              index = n;
            } else {
              checkListestate[n] = false;
            }
          }

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
