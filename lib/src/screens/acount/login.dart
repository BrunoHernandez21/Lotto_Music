import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotto_music/src/bloc/dialogs_on_display/dialogs_on_display_bloc.dart';
import 'package:lotto_music/src/bloc/dialogs_on_display/widget_dialog.dart';
import 'package:lotto_music/src/cores/compositor.dart';
import 'package:lotto_music/src/screens/acount/recovery.dart';
import 'package:lotto_music/src/screens/acount/register.dart';

import '../../bloc/shaderPreferences/shaderpreferences_temp.dart';

import '../../helpers/variables_globales.dart';

import '../../widgets/botones.dart';
import '../../widgets/chec_box.dart';
import '../../widgets/inputs_text.dart';
import '../../widgets/text.dart';
import '../admin.dart';

class Login extends StatelessWidget {
  static const routeName = '/login';
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Medidas.size = MediaQuery.of(context).size;
    return DialogOnDisplayWidget(
      child: Scaffold(
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
                    child: Textos.tituloMAX(
                      texto: "Inicia Sesión",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 20),
                    child: Textos.tituloMED(
                      texto: "Entra a tu cuenta de Lotto Music",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: InputsText.box(
                        hintText: 'Tu correo',
                        textType: TextInputType.emailAddress,
                        controller: email,
                        icon: const Icon(
                          Icons.mail_outline,
                          color: Color.fromARGB(255, 192, 189, 189),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: InputsText.box(
                      hintText: 'Tu contraseña',
                      textType: TextInputType.visiblePassword,
                      controller: password,
                      obscure: true,
                      icon: const Icon(
                        Icons.lock,
                        color: Color.fromARGB(255, 192, 189, 189),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: MyCheckBoxTitle(
                      title: Textos.parrafoMED(texto: 'Recuerdame'),
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
                    onTap: () {
                      BlocProvider.of<DialogsOnDisplayBloc>(context).add(
                        OnIsLoading(isLoading: true),
                      );
                      Compositor.onLogin(
                        context,
                        email.text,
                        password.text,
                      ).then((value) {
                        BlocProvider.of<DialogsOnDisplayBloc>(context).add(
                          OnIsLoading(isLoading: false),
                        );
                        if (value) {
                          Navigator.pushNamedAndRemoveUntil(
                              context, Admin.routeName, (route) => false);
                        }
                      });
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
                        Textos.parrafoMED(texto: 'O Continúa con'),
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
                  const SizedBox(
                    height: 20,
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
