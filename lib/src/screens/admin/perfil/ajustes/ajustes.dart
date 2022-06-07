import 'package:flutter/material.dart';

import '../../../../widgets/bacground.dart';
import '../../../../widgets/text.dart';
import 'billetera.dart';
import 'direccion.dart';
import 'new_password.dart';

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
        title: Textos.titulo(texto: 'Ajustes'),
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: Textos.tituloGrey(texto: 'Cambiar Contraseña'),
                trailing: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 17,
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(NewPassword.routeName);
                },
              ),
              const Divider(color: Colors.grey, height: 10),
              ListTile(
                title: Textos.tituloGrey(texto: 'Billetera'),
                trailing: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 17,
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(Billetera.routeName);
                },
              ),
              const Divider(color: Colors.grey, height: 10),
              ListTile(
                title: Textos.tituloGrey(texto: 'Dirección'),
                trailing: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 17,
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(Direccion.routeName);
                },
              ),
              const Divider(color: Colors.grey, height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
