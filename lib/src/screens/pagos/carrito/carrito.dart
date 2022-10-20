import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lotto_music/src/bloc/acount/acount_bloc.dart';
import 'package:lotto_music/src/bloc/shaderPreferences/shaderpreferences_bloc.dart';
import 'package:lotto_music/src/cores/orquestador/orquestador.dart';
import 'package:lotto_music/src/screens/pagos/carrito/verificar_compra/verificar_compra.dart';

import '../../../bloc/carrito/carrito_bloc.dart';
import '../../../helpers/globals/assets.dart';
import '../../../helpers/globals/screen_size.dart';
import '../../../models/carrito/carrito_response.dart';
import '../../../widgets/botones.dart';
import '../../../widgets/inicia_secion.dart';
import '../../../widgets/svg_nosignal.dart';
import '../../../widgets/text.dart';

class Carrito extends StatelessWidget {
  static const routeName = "carrito";
  const Carrito({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (BlocProvider.of<CarritoBloc>(context).state.itemsCarrito == null) {
      Orquestador.shopingcar.onloadCarrito(context: context);
    }
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<AcountBloc, AcountState>(
        builder: (context, state) {
          if (BlocProvider.of<AcountBloc>(context).state.isLogin == false) {
            return const BodyNoLoged();
          }
          return BlocBuilder<CarritoBloc, CarritoState>(
            builder: (context, state) {
              if (state.itemsCarrito == null) {
                return RefreshIndicator(
                    onRefresh: () async {
                      Orquestador.shopingcar.onloadCarrito(context: context);
                    },
                    child: const NoSignal());
              }
              return RefreshIndicator(
                onRefresh: () async {
                  Orquestador.shopingcar.onloadCarrito(context: context);
                },
                child: state.itemsCarrito?.isEmpty ?? true
                    ? emptyFunc(context: context)
                    : builderBody(
                        state.itemsCarrito!,
                        context,
                      ),
              );
            },
          );
        },
      ),
    );
  }

  Widget emptyFunc({required BuildContext context}) {
    final isBlack =
        BlocProvider.of<ShaderpreferencesBloc>(context).state.isDarkTheme;
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Textos.tituloMAX(
                    texto: "Parece que tu carrito esta vacio",
                    renglones: 2,
                    align: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Textos.tituloMIN(
                  texto: 'Agrega items al carrito',
                  renglones: 2,
                  align: TextAlign.center,
                ),
                const SizedBox(
                  height: 50,
                ),
                SvgPicture.asset(
                  isBlack ? Assets.svgSolAlPaso : Assets.svgEmptycart,
                  height: Medidas.size.height * .2,
                  width: double.infinity,
                ),
                const SizedBox(
                  height: 60,
                ),
                const Divider(
                  color: Colors.black,
                  height: 40,
                  thickness: 2,
                  endIndent: 80,
                  indent: 80,
                ),
                const SizedBox(
                  height: 70,
                ),
                Textos.tituloMIN(texto: 'Deliza para actualizar'),
                const SizedBox(
                  height: 20,
                ),
                Icon(
                  Icons.keyboard_double_arrow_down,
                  color: Theme.of(context).iconTheme.color,
                  size: Medidas.size.height * .1,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget builderBody(List<ItemsCarrito> itemsCarrito, BuildContext context) {
    double total = 0;
    List<Widget> items = [];
    for (var i in itemsCarrito) {
      items.add(TarjetaCarrito(carrito: i));
      total += i.totalLinea;
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
            texto: "Total: $total ${itemsCarrito.first.moneda ?? ""}",
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
              onTap: () {
                Orquestador.buy.craeteOrden(context: context);
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
            ? Text("Suscribción ${carrito.titulo ?? ""}")
            : Text("Plan ${carrito.titulo ?? ""}"),
        subtitle: Text(
          "Precio Total ${carrito.totalLinea}",
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.remove_circle,
            color: Colors.red,
          ),
          onPressed: () {
            Orquestador.shopingcar.onDeleteCarrito(context, carrito);
          },
        ),
        trailing: Text(
          carrito.totalLinea.toString(),
        ));
  }
}
