import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:lotto_music/src/cores/compositor.dart';
import 'package:lotto_music/src/helpers/variables_globales.dart';

import '../../../bloc/carrito/carrito_bloc.dart';
import '../../../models/carrito_plan.dart';
import '../../../widgets/botones.dart';
import '../../../widgets/svg_nosignal.dart';
import '../../../widgets/text.dart';

class Carrito extends StatelessWidget {
  const Carrito({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (BlocProvider.of<CarritoBloc>(context).state.ordenes == null) {
      Compositor.onloadCarrito(context);
    }
    return BlocBuilder<CarritoBloc, CarritoState>(
      builder: (context, state) {
        if (state.ordenes == null) {
          return RefreshIndicator(
              onRefresh: () async {
                Compositor.onloadCarrito(context);
              },
              child: const NoSignal());
        }
        return RefreshIndicator(
          onRefresh: () async {
            Compositor.onloadCarrito(context);
          },
          child: ListView.builder(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            itemCount: state.ordenes!.length,
            itemBuilder: (context, index) {
              return TarjetaCarrito(carrito: state.ordenes![index]);
            },
          ),
        );
      },
    );
  }
}

class TarjetaCarrito extends StatelessWidget {
  final Ordenes carrito;
  const TarjetaCarrito({
    Key? key,
    required this.carrito,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const styleBorder = BorderSide(
      color: Color(0xffbf930d),
      style: BorderStyle.solid,
      width: 4,
    );
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(
          horizontal: Medidas.size.width * .05, vertical: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: const Border(
          bottom: styleBorder,
          left: styleBorder,
          right: styleBorder,
          top: styleBorder,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Textos.tituloMED(
              texto: carrito.plane.nombre,
              color: const Color(0xff1eae98),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Textos.parrafoMED(
            texto: "Cantidad = " + carrito.orden.cantidad.toString(),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Textos.tituloMED(
              texto: "\$" + carrito.orden.amount.toString() + "MX c/u",
              color: const Color(0xfffca51f),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: SizedBox(
              width: Medidas.size.width * .5,
              child: Botones.degradedTextButton(
                text: "Comprar",
                colors: const [Color(0xffea8d8d), Color(0xffa890fe)],
                onTap: () async {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
