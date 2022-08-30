import 'package:flutter/material.dart';

import '../../widgets/text.dart';

class AppbarMiPerfil extends StatelessWidget {
  final TabController? controller;
  const AppbarMiPerfil({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: Stack(
        children: [
          Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
              ),
              child: IconButton(
                onPressed: () {
                  controller?.animateTo(1);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 18,
                ),
              )),
          Center(
            child: Textos.tituloMED(
              texto: 'Mi Perfil',
            ),
          ),
        ],
      ),
    );
  }
}
