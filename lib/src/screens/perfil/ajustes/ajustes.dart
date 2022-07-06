import 'package:flutter/material.dart';

import '../../../widgets/text.dart';
import '../editar_perfil.dart';
import '../tema.dart';

class Ajustes extends StatelessWidget {
  static const routeName = 'ajustes';

  const Ajustes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Textos.tituloMIN(texto: 'Ajustes'),
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TemeApp(),
              ListTile(
                title: Textos.tituloMIN(texto: 'Uso de datos'),
                trailing: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 17,
                ),
                onTap: () {
                  Navigator.pushNamed(context, EditarPerfil.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
