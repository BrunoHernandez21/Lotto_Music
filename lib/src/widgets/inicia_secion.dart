import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lotto_music/src/widgets/text.dart';

import '../helpers/globals/assets.dart';
import '../helpers/globals/screen_size.dart';
import '../screens/acount/login.dart';
import 'botones.dart';

class BodyNoLoged extends StatelessWidget {
  const BodyNoLoged({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Textos.tituloMAX(texto: "No haz iniciado sesión"),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: Medidas.size.width * .8,
            height: Medidas.size.width * .8,
            child: SvgPicture.asset(
              Assets.svgWelcomCats,
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          SizedBox(
            width: Medidas.size.width * .5,
            child: Botones.solidTextButton(
                text: "Registrate",
                onTap: () {
                  Navigator.of(context).pushNamed(Login.routeName);
                },
                fontColor: Colors.white,
                backColor: Colors.red.shade200),
          )
        ],
      ),
    );
  }
}
