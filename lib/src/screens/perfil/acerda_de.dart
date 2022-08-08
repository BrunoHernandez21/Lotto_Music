import 'package:flutter/material.dart';
import 'package:lotto_music/src/widgets/text.dart';

class AcercaDe extends StatelessWidget {
  static const String routeName = 'acercade';
  const AcercaDe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: const Color.fromRGBO(0, 0, 0, 1),
      ),
      body: Center(
          child: Textos.parrafoMED(
              texto: '''Version de la app V0.2.1 \n
      creado por el equipo de inclusive 2022 agosto''',
              align: TextAlign.center)),
    );
  }
}
