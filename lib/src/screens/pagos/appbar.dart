import 'package:flutter/material.dart';

import '../../helpers/globals/assets.dart';
import '../../widgets/text.dart';
import '../utils/notify.dart';

class AppbarCarrito extends StatelessWidget {
  const AppbarCarrito({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
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
          Textos.parrafoMED(texto: "Lotto Music"),
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
