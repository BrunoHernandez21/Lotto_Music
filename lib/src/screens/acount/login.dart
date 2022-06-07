import 'package:flutter/material.dart';
import 'package:lotto_music/src/screens/acount/recovery.dart';
import 'package:lotto_music/src/screens/acount/register.dart';

import '../../bloc/shaderPreferences/shaderpreferences_temp.dart';
import '../../cores/compositor.dart';
import '../../helpers/variables_globales.dart';
import '../../services/acount_services.dart';
import '../../widgets/botones.dart';
import '../../widgets/chec_box.dart';
import '../../widgets/inputs_text.dart';
import '../../widgets/text.dart';
import '../admin/admin.dart';

class Login extends StatelessWidget {
  static const routeName = '/login';
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  Login({Key? key}) : super(key: key);

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
              horizontal: 12.0,
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
                    texto: "Inicia Sesión",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 20),
                  child: Textos.tituloGrey(
                    texto: "Entra a tu cuenta de Aldo Neri",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: InputsText.box(
                      hintText: 'Tu correo',
                      textType: TextInputType.emailAddress,
                      icon: const Icon(Icons.mail_outline)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: InputsText.box(
                    hintText: 'Tu contraseña',
                    textType: TextInputType.visiblePassword,
                    obscure: true,
                    icon: const Icon(Icons.lock),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: MyCheckBoxTitle(
                    title: Textos.parrafoGrey(texto: 'Recuerdame'),
                    value: ShaderPreferencesTemp.recuerdame,
                    onChnange: (a) {
                      ShaderPreferencesTemp.recuerdame = a;
                    },
                    leading: Row(children: [
                      const Expanded(child: SizedBox()),
                      Textos.parrafoHiper(
                        texto: '',
                        hipertext: '¿Olvidaste tu contraseña?',
                        onTap: () {
                          Navigator.of(context).pushNamed(Recovery.routeName);
                        },
                      ),
                    ]),
                  ),
                ),
                Botones.degradedTextButtonOrange(
                  text: 'Inicia Sesión',
                  onTap: () async {
                    await Compositor.onLogin(
                        context, email.text, password.text);
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        Admin.routeName, (route) => false);
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Textos.parrafoHiper(
                    texto: '¿No tienes cuenta?  ',
                    hipertext: 'Registrate',
                    fontSize: 16,
                    fontHiperSize: 18,
                    onTap: () {
                      Navigator.of(context).pushNamed(Register.routeName);
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
