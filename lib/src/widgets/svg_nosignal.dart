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
          const SizedBox(
            height: 30,
            width: double.infinity,
          ),
          Textos.tituloMAX(texto: "Sin conexión al Servidor"),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 30,
          ),
          SvgPicture.asset(
            Assets.svgPaisaje,
            height: Medidas.size.height * .2,
            width: double.infinity,
          ),
          const SizedBox(
            height: 60,
          ),
          const Divider(
            color: Colors.grey,
            height: 40,
            thickness: 2,
            endIndent: 80,
            indent: 80,
          ),
          const SizedBox(
            height: 50,
          ),
          Textos.tituloMIN(texto: 'Deslice para actualizar'),
          const SizedBox(
            height: 20,
          ),
          Icon(
            Icons.keyboard_double_arrow_down,
            color: Theme.of(context).iconTheme.color,
            size: Medidas.size.height * .1,
          ),
        ],
      ),
    );
  }
}
