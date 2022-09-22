import 'package:flutter/material.dart';
import 'package:lotto_music/src/widgets/botones.dart';
import 'package:lotto_music/src/widgets/dialogs_alert.dart';
import 'package:lotto_music/src/widgets/inputs_text.dart';

import '../../../../cores/orquestador/orquestador.dart';
import '../../../../helpers/globals/const.dart';
import '../../../../helpers/globals/screen_size.dart';
import '../../../../models/user/direcciones.dart';
import '../../../../widgets/drop_list.dart';
import '../../../../widgets/text.dart';

class DireccionAdd extends StatefulWidget {
  static String routeName = 'direccionadd';
  const DireccionAdd({Key? key}) : super(key: key);

  @override
  State<DireccionAdd> createState() => _DireccionAddState();
}

class _DireccionAddState extends State<DireccionAdd> {
  final TextEditingController controlCalle = TextEditingController();
  final TextEditingController controlNumero = TextEditingController();
  final TextEditingController controlCP = TextEditingController();
  final TextEditingController controlCiduad = TextEditingController();
  final TextEditingController controlPais = TextEditingController();
  String? selectedTipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Textos.tituloMED(texto: 'Dirección'),
        centerTitle: true,
      ),
      body: body(),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Textos.tituloMAX(texto: "Agregar tu dirección"),
            const SizedBox(
              height: 60,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: Medidas.size.width * .4,
                child: Column(
                  children: [
                    Textos.tituloMIN(texto: "Tipo"),
                    DropListButton(
                      init: "default",
                      items: Variables.estadosDireccion,
                      onChange: (sel) {
                        selectedTipe = sel;
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: Medidas.size.width * .6,
                  child: Column(
                    children: [
                      Textos.tituloMIN(texto: "Calle"),
                      InputsText.classic(controller: controlCalle),
                    ],
                  ),
                ),
                SizedBox(
                  width: Medidas.size.width * .3,
                  child: Column(
                    children: [
                      Textos.tituloMIN(texto: "Numero"),
                      InputsText.classic(controller: controlNumero),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Textos.tituloMIN(texto: "CP"),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: InputsText.classic(controller: controlCP),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Textos.tituloMIN(texto: "Ciudad"),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: InputsText.classic(controller: controlCiduad),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Textos.tituloMIN(texto: "Pais"),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: InputsText.classic(controller: controlPais),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Botones.degradedTextButton(
                text: "Crear Dirección",
                colors: [Colors.grey, Colors.grey],
                onTap: () async {
                  final direct = DireccionesModel(
                    calle: controlCalle.text,
                    ciudad: controlCiduad.text,
                    cp: controlCP.text,
                    numero: controlNumero.text,
                    pais: controlPais.text,
                    tipo: selectedTipe,
                    id: 0,
                  );
                  if (await Orquestador.user.onCreateDirecciones(
                    context: context,
                    direccion: direct,
                  )) {
                    Navigator.pop(context);
                  } else {
                    DialogAlert.ok(
                      context: context,
                      text: "Surgio un problema",
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
