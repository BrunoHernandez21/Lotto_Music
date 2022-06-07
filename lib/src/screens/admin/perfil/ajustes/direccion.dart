import 'package:flutter/material.dart';

import '../../../../widgets/text.dart';

class Direccion extends StatelessWidget {
  static String routeName = 'direcciones';
  const Direccion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: Textos.tituloGrey(texto: 'Billetera'),
        centerTitle: true,
      ),
    );
  }
}
