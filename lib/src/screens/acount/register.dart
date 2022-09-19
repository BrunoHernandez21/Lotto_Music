import 'package:flutter/material.dart';
import 'package:lotto_music/src/cores/orquestador/orquestador.dart';
import 'package:lotto_music/src/screens/acount/register_confirm.dart';

import '../../helpers/variables_globales.dart';
import '../../widgets/botones.dart';
import '../../widgets/inputs_text.dart';
import '../../widgets/text.dart';

class Register extends StatelessWidget {
  static const routeName = '/register';
  final TextEditingController nombre = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController email = TextEditingController();

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
                    child: Textos.tituloMAX(
                      texto: "Registro",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 20),
                    child: Textos.tituloMED(
                      texto: "Crea tu cuenta de Lotto Music",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: InputsText.classic(
                        controller: nombre,
                        hintText: "Nombre",
                        textType: TextInputType.name),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: InputsText.classic(
                        controller: phone,
                        hintText: "Telefono",
                        textType: TextInputType.number),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: InputsText.box(
                        controller: email,
                        hintText: 'Correo Eléctronico',
                        textType: TextInputType.emailAddress,
                        icon: const Icon(
                          Icons.email,
                          color: Color.fromARGB(255, 163, 159, 159),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: InputsText.box(
                        controller: password,
                        hintText: 'Contraseña',
                        textType: TextInputType.visiblePassword,
                        obscure: true,
                        icon: const Icon(
                          Icons.password,
                          color: Color.fromARGB(255, 163, 159, 159),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Textos.parrafoHiper(
                      texto: 'Al suscribirse usted acepta nuestros ',
                      hipertext: 'terminos y condiciones',
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Botones.degradedTextButtonOrange(
                    text: 'Registrate',
                    onTap: () async {
                      if (await Orquestador.auth.onRegister(
                        context: context,
                        email: email.text,
                        password: password.text,
                        phone: phone.text,
                        name: nombre.text,
                      )) {
                        Navigator.of(context)
                            .pushNamed(RegisterConfirm.routeName);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
