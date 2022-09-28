import 'package:flutter/material.dart';
import '../../../../cores/orquestador/orquestador.dart';
import '../../../../helpers/globals/screen_size.dart';
import '../../../../models/user/tarjetas.dart';
import '../../../../models/user/tarjetas_response.dart';
import '../../../../widgets/botones.dart';
import '../../../../widgets/text.dart';
import '../../../perfil/tarjetas/tarjetas_add.dart';
import 'state_carrito.dart';

class BodySelector extends StatefulWidget {
  final String moneda;
  final double total;
  final TarjetasResponse tarjetas;
  final void Function() onchage;
  const BodySelector({
    required this.onchage,
    required this.tarjetas,
    required this.moneda,
    required this.total,
    Key? key,
  }) : super(key: key);

  @override
  State<BodySelector> createState() => _BodySelectorState();
}

class _BodySelectorState extends State<BodySelector> {
  bool isFist = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Cabezera(
          moneda: widget.moneda,
          total: widget.total,
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              Orquestador.shopingcar.onloadCarrito(context);
              Orquestador.user.onLoadTarjetas(context);
            },
            child: ListView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              children: listaTarjetasWidget(widget.tarjetas.tarjetas ?? []),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0, top: 10),
          child: SizedBox(
            width: Medidas.size.width * .5,
            child: Botones.degradedTextButton(
              text: "Comprar",
              colors: const [Color(0xffea8d8d), Color(0xffa890fe)],
              onTap: widget.onchage,
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> listaTarjetasWidget(List<TarjetaModel> tarjetas) {
    List<Widget> lista = [];

    for (int i = 0; i < tarjetas.length; i++) {
      if (tarjetas[i].defaultPayment && isFist) {
        SCL.index = i;
        SCL.tarjeta = tarjetas[i];
        isFist = false;
      }
      lista.add(_Tarjeta(
        evento: tarjetas[i],
        isSelected: SCL.index == i,
        onChange: (a) {
          SCL.index = i;
          SCL.tarjeta = tarjetas[i];
          setState(() {});
        },
      ));
    }
    if (lista.isEmpty) {
      lista.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: Textos.parrafoMAX(
          texto: "Cree un metodo de pago o deslice para actualizar",
          renglones: 2,
          align: TextAlign.center,
        ),
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
