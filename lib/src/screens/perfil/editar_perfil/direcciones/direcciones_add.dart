import 'package:flutter/material.dart';

import '../../../../widgets/text.dart';

class DireccionADD extends StatelessWidget {
  static String routeName = 'direccionesadd';
  const DireccionADD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Textos.tituloMED(texto: 'Direcciones'),
        centerTitle: true,
      ),
    );
  }
}