import 'package:flutter/material.dart';
import 'package:lotto_music/src/screens/perfil/editar_perfil/cartera.dart';

import '../../../widgets/text.dart';
import '../editar_perfil.dart';
import 'direcciones/direccion.dart';
import 'new_password.dart';

class AjustesUsuario extends StatelessWidget {
  static const routeName = 'ajustesusuario';

  const AjustesUsuario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Textos.tituloMIN(texto: 'Editar Perfil'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                title: Textos.tituloMIN(texto: 'Direcciones'),
                trailing: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 17,
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(Direccion.routeName);
                },
              ),
              const Divider(color: Colors.grey, height: 10),
              ListTile(
                title: Textos.tituloMIN(texto: 'Cartera'),
                trailing: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 17,
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(Cartera.routeName);
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
