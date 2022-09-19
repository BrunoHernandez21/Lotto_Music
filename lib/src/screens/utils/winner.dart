import 'package:flutter/material.dart';
import 'package:lotto_music/src/helpers/variables_globales.dart';
import 'package:lotto_music/src/widgets/text.dart';

import '../../cores/orquestador/orquestador.dart';
import '../../models/event/ganador.dart';
import '../../models/event/ganador_response.dart';

class Winner extends StatefulWidget {
  static const routeName = 'winner';
  const Winner({Key? key}) : super(key: key);

  @override
  State<Winner> createState() => _WinnerState();
}

class _WinnerState extends State<Winner> {
  final ScrollController controller = ScrollController();
  GanadorResponse? estado;
  bool isLoad = false;
  @override
  void initState() {
    isLoad = true;
    Orquestador.userEvent.onIinitWiner(context).then((value) {
      estado = value;
      isLoad = false;
      setState(() {});
    });

    controller.addListener(
      () async {
        final copy = estado;
        if (controller.position.pixels >
            controller.position.maxScrollExtent * .8) {
          if (!isLoad) {
            isLoad = true;
            if (copy == null) {
              isLoad = false;
              return;
            }
            if (copy.pag >= copy.pags) {
              isLoad = false;
              return;
            }
            final temp = await Orquestador.userEvent
                .onLoadWiner(context: context, pag: copy.pag + 1);
            if (temp != null) {
              estado = temp;
            }
            isLoad = false;
          }
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          Orquestador.userEvent.onIinitWiner(context).then((value) {
            estado = value;
            setState(() {});
          });
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          controller: controller,
          child: Column(
            children: listaWidgets(),
          ),
        ),
      ),
    );
  }

  List<Widget> listaWidgets() {
    List<Widget> lista = [];
    if (estado?.ganador?.isNotEmpty ?? false) {
      estado?.ganador?.forEach((element) {
        lista.add(_Tarjeta(ganador: element));
      });
    }
    if (lista.length < 2) {
      lista.add(SizedBox(
        height: Medidas.size.height * .5,
      ));
    }
    return lista;
  }
}

class _Tarjeta extends StatelessWidget {
  final GanadorModel ganador;
  const _Tarjeta({Key? key, required this.ganador}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const styleBorder = BorderSide(
      color: Color(0xff591da9),
      style: BorderStyle.solid,
      width: 4,
    );
    return Container(
      height: Medidas.size.height * .2,
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
        children: [
          Textos.tituloMAX(texto: "Usted gano"),
          if (ganador.cantidad != 0)
            Textos.tituloMED(
                texto:
                    "${ganador.cantidad.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}\$mx"),
          if (ganador.concepto.isNotEmpty)
            Textos.tituloMED(texto: ganador.concepto),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Textos.parrafoMAX(
                texto: "ID ${ganador.usuarioId}",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
