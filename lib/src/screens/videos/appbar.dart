import 'package:flutter/material.dart';

import '../../helpers/variables_globales.dart';
import '../../widgets/text.dart';
import '../notify/notify.dart';
import '../search/search.dart';

class AppbarVideos extends StatelessWidget {
  const AppbarVideos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          width: 15,
        ),
        Image.asset(Assets.logo, height: 30),
        const SizedBox(
          width: 5,
        ),
        Textos.parrafoMED(texto: "Lotto Music"),
        const Expanded(child: SizedBox()),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            Navigator.pushNamed(context, SearchVideos.routeName);
          },
        ),
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
    );
  }
}
