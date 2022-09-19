import 'package:flutter/material.dart';
import 'package:lotto_music/src/screens/admin.dart';

import '../../helpers/globals/assets.dart';
import '../../helpers/globals/screen_size.dart';
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
                  child: Textos.tituloMAX(
                    texto: "Tu cuenta se creo con exito",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 20),
                  child: Textos.tituloMED(
                    align: TextAlign.center,
                    texto: "Por favor continua para iniciar Sesión",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Botones.degradedTextButtonOrange(
                    text: 'Inicia Sesión',
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          Admin.routeName, (route) => false);
                      Navigator.of(context).pushNamed(Login.routeName);
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
