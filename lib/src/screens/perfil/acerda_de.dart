import 'package:flutter/material.dart';
import 'package:lotto_music/src/widgets/text.dart';

class AcercaDe extends StatelessWidget {
  static const String routeName = 'acercade';
  const AcercaDe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          Textos.parrafoMED(
            texto: "Version de la app v1.0.1",
            align: TextAlign.center,
          ),
          Textos.parrafoMED(
            texto: "creado por el equipo de inclusive 20 de oct. 2022",
            align: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
