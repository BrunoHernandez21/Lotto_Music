import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lotto_music/src/helpers/variables_globales.dart';
import 'package:lotto_music/src/widgets/text.dart';

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
          ),
          Textos.tituloMAX(texto: "Sin coneccion al Servidor"),
          SvgPicture.asset(
            "assets/svg/imagenes/explorer.svg",
            height: Medidas.size.height * .5,
          ),
        ],
      ),
    );
  }
}
