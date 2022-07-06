import 'package:flutter/material.dart';

import '../../../widgets/text.dart';
import '../editar_perfil.dart';
import 'direccion.dart';
import 'new_password.dart';

class AjustesUsuario extends StatelessWidget {
  static const routeName = 'ajustesusuario';

  const AjustesUsuario({Key? key}) : super(key: key);

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
              ListTile(
                title: Textos.tituloMIN(texto: 'Datos Personales'),
                trailing: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 17,
                ),
                onTap: () {
                  Navigator.pushNamed(context, EditarPerfil.routeName);
                },
              ),
              ListTile(
                title: Textos.tituloMIN(texto: 'Cambiar Contraseña'),
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
                title: Textos.tituloMIN(texto: 'Telefono de contacto'),
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
