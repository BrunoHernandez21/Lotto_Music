import 'package:flutter/material.dart';

import '../../../helpers/globals/assets.dart';
import '../../../helpers/globals/screen_size.dart';
import '../../../widgets/botones.dart';
import '../../../widgets/text.dart';

class PasswordConfirm extends StatelessWidget {
  static const routeName = 'passwordconfirm';
  const PasswordConfirm({Key? key}) : super(key: key);

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
                  Assets.pngLogo,
                  height: Medidas.size.height * .3,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Textos.tituloMAX(
                    align: TextAlign.center,
                    texto: "¡Se cambio la contraseña con exito!",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 20),
                  child: Textos.tituloMIN(
                    align: TextAlign.center,
                    texto:
                        "Se ha cambiado correctamente la contraseña. Utilice la nueva contraseña cuando inicie sesión",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Botones.degradedTextButtonOrange(
                    text: 'Volver a inicio',
                    onTap: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                      // Navigator.of(context).pushNamedAndRemoveUntil(
                      //     Login.routeName, (route) => false);
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
