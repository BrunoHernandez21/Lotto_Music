import 'package:flutter/material.dart';
import 'package:lotto_music/src/cores/compositor.dart';
import 'package:lotto_music/src/models/cartera.dart';

import '../../../helpers/variables_globales.dart';
import '../../../widgets/text.dart';

class Billetera extends StatefulWidget {
  static String routeName = 'billetera';
  const Billetera({Key? key}) : super(key: key);

  @override
  State<Billetera> createState() => _BilleteraState();
}

class _BilleteraState extends State<Billetera> {
  Cartera? cartera;
  @override
  void initState() {
    Compositor.onLoadCartera(context: context).then((value) {
      cartera = value;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Textos.tituloMIN(texto: 'Billetera'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          Compositor.onLoadCartera(context: context).then((value) {
            cartera = value;
            setState(() {});
          });
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: Column(children: [
            SizedBox(
              height: Medidas.size.height * .10,
            ),
            cartera == null
                ? SizedBox(
                    height: Medidas.size.height * .60,
                  )
                : _Tarjeta(
                    cartera: cartera!,
                  ),
            SizedBox(
              height: Medidas.size.height * .30,
            ),
          ]),
        ),
      ),
    );
  }
}

class _Tarjeta extends StatelessWidget {
  final Cartera cartera;
  const _Tarjeta({Key? key, required this.cartera}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const styleBorder = BorderSide(
      color: Color(0xff591da9),
      style: BorderStyle.solid,
      width: 4,
    );
    return Container(
      height: Medidas.size.height * .4,
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: const Border(
          bottom: styleBorder,
          left: styleBorder,
          right: styleBorder,
          top: styleBorder,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Textos.tituloMAX(texto: "Estado de la cartera"),
          Textos.tituloMIN(
            texto: "Cantidad: " + cartera.oportunidades.toString(),
          ),
          Textos.tituloMIN(
            texto: "likes: " + cartera.acumuladoAlto8Am.toString(),
          ),
          Textos.tituloMIN(
            texto: "Comentarios: " + cartera.acumuladoBajo8Pm.toString(),
          ),
          Textos.tituloMIN(
            texto: "Vistas: " + cartera.aproximacionAlta00Am.toString(),
          ),
          Textos.tituloMIN(
            texto: "Vistas: " + cartera.aproximacionBaja.toString(),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Textos.tituloMIN(
                texto: "ID " + cartera.idUsuario.toString(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget espace(Widget child) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: Medidas.size.width * .15),
        child: child,
      ),
    );
  }
}
