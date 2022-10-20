import 'package:flutter/material.dart';

import '../../helpers/globals/assets.dart';
import '../../widgets/text.dart';
import '../eventos/eventos/clock.dart';

class AppbarInicio extends StatelessWidget {
  const AppbarInicio({Key? key}) : super(key: key);

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
          Image.asset(Assets.pngLogo, height: 30),
          const SizedBox(
            width: 5,
          ),
          Textos.parrafoMED(texto: "Videos en tendencia"),
          const Expanded(child: SizedBox()),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.pushNamed(context, Clock.routeName);
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
