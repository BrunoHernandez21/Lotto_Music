import 'package:flutter/material.dart';
import 'package:lotto_music/src/screens/admin/perfil/ajustes/password_confirm.dart';

import '../../../../helpers/variables_globales.dart';
import '../../../../widgets/botones.dart';
import '../../../../widgets/inputs_text.dart';
import '../../../../widgets/text.dart';

class NewPassword extends StatelessWidget {
  static String routeName = 'newPassword';
  const NewPassword({Key? key}) : super(key: key);

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
                    texto: "Cambiar tu Contraseña",
                  ),
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Textos.parrafoGrey(
                    texto: "Escribe tu nueva contraseña",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: InputsText.classic(
                    hintText: 'xxxxxxxxxx',
                    textType: TextInputType.visiblePassword,
                    obscure: true,
                    icon: const Icon(Icons.lock),
                  ),
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Textos.parrafoGrey(
                    texto: "Confirma tu nueva contraseña",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: InputsText.classic(
                    hintText: 'xxxxxxxxxx',
                    textType: TextInputType.visiblePassword,
                    obscure: true,
                    icon: const Icon(Icons.lock),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Botones.degradedTextButtonOrange(
                    text: 'Cambiar Contraseña',
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(PasswordConfirm.routeName);
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
