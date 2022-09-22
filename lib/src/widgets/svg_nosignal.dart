import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lotto_music/src/widgets/text.dart';

import '../helpers/globals/assets.dart';
import '../helpers/globals/screen_size.dart';

class NoSignal extends StatelessWidget {
  const NoSignal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: Medidas.size.height * .1,
            width: double.infinity,
          ),
          Textos.tituloMAX(texto: "Sin conexión al Servidor"),
          const SizedBox(
            height: 10,
          ),
          Textos.tituloMIN(texto: "Deslice para actualizar"),
          SizedBox(
            height: Medidas.size.height * .1,
          ),
          SvgPicture.asset(
            Assets.refresh,
            height: Medidas.size.height * .5,
          ),
        ],
      ),
    );
  }
}
