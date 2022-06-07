import 'package:flutter/material.dart';

import '../../helpers/variables_globales.dart';
import '../../widgets/botones.dart';
import '../../widgets/text.dart';
import 'login.dart';

class RegisterConfirm extends StatelessWidget {
  static const routeName = '/register/registerconfirm';
  const RegisterConfirm({Key? key}) : super(key: key);

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
                  height: Medidas.size.height * .3,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Textos.tituloNaranja(
                    texto: "Tu cuenta se creo con exito",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 20),
                  child: Textos.tituloGrey(
                    align: TextAlign.center,
                    texto:
                        "Te enviaremos un link a tu correo para confirmar tu email",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Botones.degradedTextButtonOrange(
                    text: 'Inicia Sesión',
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          Login.routeName, (route) => false);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
