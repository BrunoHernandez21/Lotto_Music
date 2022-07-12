import 'package:flutter/material.dart';

import '../../helpers/variables_globales.dart';
import '../../widgets/text.dart';
import '../utils/clock.dart';
import 'search_video/search_video_event.dart';

class AppbarEventos extends StatelessWidget {
  const AppbarEventos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Medidas.size.height * .08,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 15,
          ),
          Image.asset(Assets.logo, height: 30),
          const SizedBox(
            width: 5,
          ),
          Textos.parrafoMED(texto: "Eventos"),
          const Expanded(child: SizedBox()),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, SearchVideosEvent.routeName);
            },
          ),
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
