import 'package:flutter/material.dart';
import 'package:lotto_music/src/screens/utils/notify.dart';

import '../../helpers/globals/assets.dart';
import '../../widgets/text.dart';

class AppbarEventos extends StatelessWidget {
  const AppbarEventos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
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
          Textos.parrafoMED(texto: "Eventos"),
          const Expanded(child: SizedBox()),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.pushNamed(context, Notify.routeName);
            },
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
