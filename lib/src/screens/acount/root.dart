import 'package:flutter/material.dart';
import 'package:lotto_music/src/screens/acount/register.dart';

import '../../../generated/l10n.dart';
import '../../helpers/variables_globales.dart';
import '../../widgets/bacground.dart';
import '../../widgets/botones.dart';
import 'login.dart';

class RootPage extends StatelessWidget {
  static const routeName = '/';
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Medidas.size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: BackGrounds.login(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
              padding: EdgeInsets.only(bottom: Medidas.size.height * .05),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 30,
                    ),
                    child: Botones.solidTextButtonWhite(
                      fontColor: Colors.white,
                      text: AppLocalisations.of(context).soyNuevo,
                      onTap: () {
                        Navigator.of(context).pushNamed(Register.routeName);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 30,
                    ),
                    child: Botones.solidTextButtonWhite(
                      fontColor: Colors.white,
                      text: AppLocalisations.of(context).iniciarSesion,
                      onTap: () {
                        Navigator.of(context).pushNamed(Login.routeName);
                      },
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
