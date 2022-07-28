import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lotto_music/src/cores/compositor.dart';
import 'package:lotto_music/src/helpers/variables_globales.dart';
import 'package:lotto_music/src/screens/pagos/carrito/verificar_compra.dart';

import '../../../bloc/carrito/carrito_bloc.dart';
import '../../../models/carrito_response.dart';
import '../../../widgets/botones.dart';
import '../../../widgets/svg_nosignal.dart';
import '../../../widgets/text.dart';

class Carrito extends StatelessWidget {
  const Carrito({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (BlocProvider.of<CarritoBloc>(context).state.itemsCarrito == null) {
      Compositor.onloadCarrito(context);
    }
    return BlocBuilder<CarritoBloc, CarritoState>(
      builder: (context, state) {
        if (state.itemsCarrito == null) {
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
          child: state.itemsCarrito?.isEmpty ?? true
              ? emptyFunc()
              : builderBody(
                  state.itemsCarrito!,
                  context,
                ),
        );
      },
    );
  }

  Widget emptyFunc() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 15,
            width: double.infinity,
          ),
          Textos.tituloMAX(texto: "Parece que tu carrito esta vacio"),
          Textos.tituloMIN(texto: 'agrega items al carrito'),
          SizedBox(
            height: Medidas.size.height * .1,
          ),
          SvgPicture.asset(
            Assets.emptyCart,
            height: Medidas.size.height * .4,
            width: double.infinity,
          ),
        ],
      ),
    );
  }

  Widget builderBody(List<ItemsCarrito> itemsCarrito, BuildContext context) {
    double total = 0;
    List<Widget> items = [];
    for (var i in itemsCarrito) {
      items.add(TarjetaCarrito(carrito: i));
      total += i.totalLinea ?? 0;
    }
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Center(
          child: Textos.tituloMAX(texto: "Items de compra"),
        ),
        const SizedBox(
          height: 8,
        ),
        Center(
          child: Textos.tituloMAX(
            texto: "Total: " +
                total.toString() +
                " " +
                (itemsCarrito.first.moneda ?? ""),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            child: Column(
              children: [
                ...items,
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: SizedBox(
            width: Medidas.size.width * .5,
            child: Botones.degradedTextButton(
              text: "Comprar",
              colors: const [Color(0xffea8d8d), Color(0xffa890fe)],
              onTap: () async {
                Navigator.of(context).pushNamed(VerificarCompra.routeName);
              },
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

class TarjetaCarrito extends StatelessWidget {
  final ItemsCarrito carrito;
  const TarjetaCarrito({
    Key? key,
    required this.carrito,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: carrito.suscribcion
            ? Text("Suscribción " + carrito.nombre)
            : Text("Plan " + carrito.nombre),
        subtitle: Text(
          "Precio unitario " +
              (carrito.precioUnitario == null
                  ? ""
                  : carrito.precioUnitario.toString()),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.remove_circle,
            color: Colors.red,
          ),
          onPressed: () {
            Compositor.onDeleteCarrito(context, carrito);
          },
        ),
        trailing: Text(
          carrito.totalLinea.toString(),
        ));
  }
}
