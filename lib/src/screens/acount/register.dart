import 'package:flutter/material.dart';
import 'package:lotto_music/src/screens/acount/register_confirm.dart';

import '../../cores/compositor.dart';
import '../../helpers/variables_globales.dart';
import '../../widgets/botones.dart';
import '../../widgets/inputs_text.dart';
import '../../widgets/text.dart';

class Register extends StatelessWidget {
  static const routeName = '/register';
  final TextEditingController nombre = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController fecha = TextEditingController();
  final TextEditingController telefono = TextEditingController();

  Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Medidas.size = MediaQuery.of(context).size;
    return Container(
      color: Colores.background,
      child: SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            foregroundColor: Colors.black,
          ),
          body: SingleChildScrollView(
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
                      texto: "Registro",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 20),
                    child: Textos.tituloGrey(
                      texto: "Crea tu cuenta de Aldo Neri",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: InputsText.classic(
                        controller: nombre,
                        hintText: "Nombre y Apellido",
                        textType: TextInputType.name),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: InputsText.classic(
                        controller: fecha,
                        hintText: "Fecha de Nacimiento",
                        textType: TextInputType.datetime),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: InputsText.box(
                        controller: email,
                        hintText: 'Correo Eléctronico',
                        textType: TextInputType.emailAddress,
                        icon: const Icon(Icons.mail_outline)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: InputsText.box(
                        controller: telefono,
                        hintText: 'Telefono',
                        textType: TextInputType.phone,
                        icon: const Icon(Icons.phone_outlined)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Textos.parrafoHiper(
                      texto: 'Al suscribirse usted aceota nuestros ',
                      hipertext:
                          'terminos y condiciones y politica de privacidad',
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Botones.degradedTextButtonOrange(
                    text: 'Registrate',
                    onTap: () {
                      Compositor.onRegister(
                        context: context,
                        email: email.text,
                        lastname: '',
                        name: nombre.text,
                        password: telefono.text,
                      );
                      Navigator.of(context)
                          .pushNamed(RegisterConfirm.routeName);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            color: Colors.grey,
                            height: 20,
                            indent: 10,
                            endIndent: 10,
                          ),
                        ),
                        Textos.parrafoGrey(texto: 'O Continúa con'),
                        const Expanded(
                          child: Divider(
                            color: Colors.grey,
                            height: 20,
                            indent: 10,
                            endIndent: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Botones.solidnWhitSvg(
                            titulo: 'Google',
                            svgAsset: Assets.svgGoogle,
                            onTap: () {
                              Navigator.of(context).pop();
                            }),
                        Botones.solidnWhitSvg(
                            titulo: 'Facebook',
                            svgAsset: Assets.svgFacebook,
                            onTap: () {
                              Navigator.of(context).pop();
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
