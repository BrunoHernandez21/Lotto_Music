import 'package:flutter/material.dart';

import '../../helpers/globals/assets.dart';
import '../../widgets/text.dart';

class AppbarMiPerfil extends StatelessWidget {
  const AppbarMiPerfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: Row(
        children: [
          const SizedBox(
            width: 15,
          ),
          Image.asset(
            Assets.pngLogo,
            height: 30,
          ),
          const SizedBox(
            width: 5,
          ),
          Textos.parrafoMED(texto: "Mi perfil"),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
