import 'package:flutter/material.dart';
import '../../../helpers/globals/assets.dart';
import '../../../widgets/text.dart';

class AppbarVideosEvento extends StatelessWidget {
  const AppbarVideosEvento({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 18,
              )),
          const SizedBox(
            width: 15,
          ),
          Image.asset(Assets.pngLogo, height: 30),
          const SizedBox(
            width: 5,
          ),
          Textos.parrafoMED(texto: "Lotto Music"),
          const Expanded(child: SizedBox()),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
