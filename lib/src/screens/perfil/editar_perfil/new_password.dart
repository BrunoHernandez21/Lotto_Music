import 'package:flutter/material.dart';

import 'package:lotto_music/src/widgets/dialogs_alert.dart';
import '../../../cores/orquestador/orquestador.dart';
import '../../../helpers/globals/assets.dart';
import '../../../helpers/globals/screen_size.dart';
import '../../../widgets/botones.dart';
import '../../../widgets/inputs_text.dart';
import '../../../widgets/text.dart';
import 'password_confirm.dart';

class NewPassword extends StatefulWidget {
  static String routeName = 'newPassword';
  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final TextEditingController pcontroller = TextEditingController();
  final TextEditingController scontroller = TextEditingController();

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
                  height: Medidas.size.height * .2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Textos.tituloMAX(
                    texto: "Cambiar tu Contraseña",
                  ),
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Textos.tituloMED(
                    texto: "Escribe tu nueva contraseña",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: InputsText.classic(
                    controller: scontroller,
                    maxLines: 1,
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
                  child: Textos.tituloMED(
                    texto: "Confirma tu nueva contraseña",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: InputsText.classic(
                    controller: pcontroller,
                    hintText: 'xxxxxxxxxx',
                    maxLines: 1,
                    textType: TextInputType.visiblePassword,
                    obscure: true,
                    icon: const Icon(Icons.lock),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Botones.degradedTextButtonOrange(
                    text: 'Cambiar Contraseña',
                    onTap: () async {
                      if (pcontroller.text.length < 4) {
                        DialogAlert.ok(
                          context: context,
                          text: "la contraseña debe ser mayor a 4 caratecter",
                        );
                        return;
                      }
                      if (pcontroller.text != scontroller.text) {
                        DialogAlert.ok(
                          context: context,
                          text: "la contraseña no es igual",
                        );
                        return;
                      }
                      if (await Orquestador.user.onChangePassword(
                        context: context,
                        password: pcontroller.text,
                      )) {
                        Navigator.of(context)
                            .pushNamed(PasswordConfirm.routeName);
                      }
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
