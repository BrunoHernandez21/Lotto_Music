import 'package:flutter/material.dart';
import 'package:lotto_music/src/screens/acount/recovery_verificacion.dart';

import '../../helpers/variables_globales.dart';
import '../../widgets/botones.dart';
import '../../widgets/inputs_text.dart';
import '../../widgets/text.dart';

class Recovery extends StatelessWidget {
  static const routeName = '/login/recovery';

  const Recovery({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Medidas.size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: Colors.black,
      ),
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
                  child: Textos.tituloNaranja(
                    texto: "Olvide mi Contraseña",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 20),
                  child: Textos.tituloGrey(
                    texto: "Proporciona tu telefonop",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: InputsText.classic(
                    hintText: '(+52)',
                    textType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Textos.parrafoGrey(
                        texto:
                            'Te enviaremos un código para verificar tu numero')),
                Botones.degradedTextButtonOrange(
                  text: 'Enviar',
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(RecoveryVerificacion.routeName);
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
