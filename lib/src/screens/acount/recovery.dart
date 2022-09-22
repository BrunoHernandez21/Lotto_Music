import 'package:flutter/material.dart';
import 'package:lotto_music/src/cores/orquestador/orquestador.dart';

import '../../helpers/globals/assets.dart';
import '../../helpers/globals/screen_size.dart';
import '../../widgets/botones.dart';
import '../../widgets/inputs_text.dart';
import '../../widgets/text.dart';

class Recovery extends StatelessWidget {
  static const routeName = '/login/recovery';
  final TextEditingController controller = TextEditingController();

  Recovery({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Medidas.size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            child: Column(
              children: [
                Image.asset(
                  Assets.logo2,
                  height: Medidas.size.height * .2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Textos.tituloMAX(
                    texto: "Olvide mi Contraseña",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 20),
                  child: Textos.tituloMED(
                    texto: "Proporciona tu Correo",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: InputsText.classic(
                    controller: controller,
                    hintText: 'example@example.com',
                    textType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Textos.parrafoMED(
                      texto:
                          'Te enviaremos un correo para con tu nueva contraseña'),
                ),
                Botones.degradedTextButtonOrange(
                  text: 'Enviar',
                  onTap: () async {
                    if (await Orquestador.auth
                        .onRecovery(context, controller.text)) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
