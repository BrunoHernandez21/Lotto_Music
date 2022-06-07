import 'package:flutter/material.dart';

import '../../helpers/variables_globales.dart';
import '../../widgets/botones.dart';
import '../../widgets/inputs_text.dart';
import '../../widgets/text.dart';
import '../admin/perfil/ajustes/new_password.dart';

class RecoveryVerificacion extends StatelessWidget {
  static const routeName = '/login/recovery/verificacion';

  const RecoveryVerificacion({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Medidas.size = MediaQuery.of(context).size;
    const String numero = '3321748476';
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
                    texto: "Escribe tu códico",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                          child: Padding(
                        padding: const EdgeInsets.only(right: 15.0, top: 15),
                        child:
                            InputsText.classic(textType: TextInputType.number),
                      )),
                      SizedBox(
                        width: 120,
                        child: Botones.degradedTextButtonOrange(
                          text: 'Renviar',
                          onTap: () {},
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Textos.parrafoHiper(
                      fontSize: 16,
                      fontHiperSize: 18,
                      texto: 'Te enviaremos un código al número ',
                      hipertext: '(+52) ' +
                          numero.substring(0, numero.length - 4).toString() +
                          'xxxx',
                      onTap: () {}),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Textos.parrafoGrey(
                        texto:
                            'Este codigo caducara en 10 minutos despues de recibir este mensaje. Si no recibes un mensaje.')),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Botones.degradedTextButtonOrange(
                    text: 'Cambiar Contraseña',
                    onTap: () {
                      Navigator.of(context).pushNamed(NewPassword.routeName);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Textos.parrafoHiper(
                      texto: '',
                      hipertext: 'Cambiar número de teléfono',
                      fontHiperSize: 19,
                      onTap: () {
                        Navigator.of(context).pop();
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
