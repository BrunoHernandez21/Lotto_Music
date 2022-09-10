import 'package:flutter/material.dart';

import '../../../../helpers/variables_globales.dart';
import '../../../../widgets/text.dart';
import '../search/search.dart';

class AppbarVideosYT extends StatelessWidget {
  const AppbarVideosYT({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
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
            Navigator.pushNamed(context, SearchVideosYT.routeName);
          },
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
