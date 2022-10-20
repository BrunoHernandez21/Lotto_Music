import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotto_music/src/bloc/buy/buy_bloc.dart';
import 'package:lotto_music/src/cores/orquestador/orquestador.dart';
import 'package:lotto_music/src/widgets/botones.dart';
import '../../../../bloc/dialogs_on_display/widget_dialog.dart';
import '../../../../models/buy/order_response.dart';
import '../../../../widgets/text.dart';

class UpdateSucription extends StatefulWidget {
  static const routeName = "updatesuscription";
  const UpdateSucription({Key? key}) : super(key: key);

  @override
  State<UpdateSucription> createState() => _UpdateSucriptionState();
}

class _UpdateSucriptionState extends State<UpdateSucription> {
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
              return bodyBuy(state);
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
        Textos.tituloMAX(texto: "Cambiar suscripcion"),
        Textos.tituloMAX(
          texto:
              "Total: ${state.orden.orden?.precioTotal ?? 0} ${state.orden.orden?.moneda ?? ""}/mes",
        ),
        Flexible(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            itemCount: state.orden.itemsOrden.length,
            itemBuilder: (BuildContext context, int i) {
              return _Items(
                item: state.orden.itemsOrden[i],
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Textos.parrafoMIN(
            renglones: 3,
            align: TextAlign.justify,
            texto:
                "(1) Cambiar ahora: Esta opcion terminara su suscribcion actual y creara una nueva con fecha de corte de hoy",
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Textos.parrafoMIN(
            renglones: 3,
            align: TextAlign.justify,
            texto:
                "(2) Actualizar: Cambiara la suscripcion actual hasta el dia de facturacion de su suscripcion",
          ),
        ),
        const Divider(
          color: Colors.black,
          height: 40,
          thickness: 2,
          endIndent: 50,
          indent: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Textos.parrafoHiper(
            texto: "Al realizar esta accion usted esta aceptando \n",
            colorTexto:
                Theme.of(context).textTheme.bodyText1?.color ?? Colors.black,
            hipertext: "cambiar su suscripcion",
            fontSize: 16,
            fontHiperSize: 17,
            onTap: () {},
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Textos.parrafoMIN(
            texto: "Esto puede ocaccionar cargos adicionales",
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
                  height: 40,
                  child: Botones.solidTextButton(
                    text: "Cambiar ahora",
                    onTap: () {
                      Orquestador.buy.changeSuscripcionNow(
                        context: context,
                        orden: state.orden.orden?.id ?? 0,
                      );
                    },
                    fontColor: Colors.white,
                    backColor: Colors.black,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              child: SizedBox(
                  width: 150,
                  height: 40,
                  child: Botones.solidTextButton(
                    text: "Actualizar",
                    onTap: () {
                      Orquestador.buy.changeSuscripcionProration(
                        context: context,
                        orden: state.orden.orden?.id ?? 0,
                      );
                    },
                    fontColor: Colors.white,
                    backColor: Colors.black,
                  )),
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
      subtitle: Textos.parrafoMED(texto: "Puntos ${item.puntosLinea}/mes"),
    );
  }
}
