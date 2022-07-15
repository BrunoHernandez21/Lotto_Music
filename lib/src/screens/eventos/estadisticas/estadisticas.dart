import 'package:flutter/material.dart';
import 'package:lotto_music/src/widgets/text.dart';

class Estadisticas extends StatelessWidget {
  static const String routeName = "estadisticas";
  const Estadisticas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Textos.tituloMAX(texto: "Estadisticas"),
          ],
        ),
      ),
    );
  }
}
