import 'package:lotto_music/src/helpers/new_icons.dart';
import 'package:lotto_music/src/helpers/variables_globales.dart';
import 'package:lotto_music/src/screens/admin/perfil/acerdade.dart';
import 'package:lotto_music/src/screens/admin/perfil/ayuda.dart';
import 'package:lotto_music/src/screens/admin/perfil/editar_perfil.dart';
import 'package:lotto_music/src/screens/admin/perfil/informacionlegal.dart';
import 'package:flutter/material.dart';

import '../../../widgets/bacground.dart';
import '../../../widgets/text.dart';
import 'ajustes/ajustes.dart';
import 'appbar.dart';
import 'tema.dart';

class Perfil extends StatelessWidget {
  final TabController? controller;
  const Perfil({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppbarMiPerfil(controller: controller),
            Container(
              width: Medidas.size.width * .4,
              padding: const EdgeInsets.only(bottom: 20),
              child: CircleAvatar(
                child: Text('BZ'),
                radius: Medidas.size.width * .15,
              ),
            ),
            Textos.titulo(texto: 'Nombre y Apellido'),
            Textos.parrafoGrey(texto: 'usuario@gmail.com'),
            const SizedBox(
              height: 30,
            ),
            ListTile(
              title: Textos.tituloGrey(texto: 'Editar Perfil'),
              leading: const Icon(Icons.person_rounded),
              trailing: const Icon(
                Icons.arrow_forward_ios_sharp,
                size: 17,
              ),
              onTap: () {
                Navigator.pushNamed(context, EditarPerfil.routeName);
              },
            ),
            TemeApp(),
            ListTile(
              title: Textos.tituloGrey(texto: 'Temas'),
              leading: const Icon(Icons.settings),
              trailing: const Icon(
                Icons.arrow_forward_ios_sharp,
                size: 17,
              ),
              onTap: () {
                Navigator.pushNamed(context, Ajustes.routeName);
              },
            ),
            ListTile(
              title: Textos.tituloGrey(texto: 'Membresía'),
              leading: const Icon(Icons.card_membership),
              trailing: const Icon(
                Icons.arrow_forward_ios_sharp,
                size: 17,
              ),
              onTap: () {
                Navigator.pushNamed(context, Ayuda.routeName);
              },
            ),
            ListTile(
              title: Textos.tituloGrey(texto: 'Acerca de'),
              leading: const Icon(NewIcons.escudo),
              trailing: const Icon(
                Icons.arrow_forward_ios_sharp,
                size: 17,
              ),
              onTap: () {
                Navigator.pushNamed(context, InformacionLegal.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
