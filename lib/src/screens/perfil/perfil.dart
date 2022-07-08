import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lotto_music/src/cores/compositor.dart';
import 'package:lotto_music/src/helpers/new_icons.dart';
import 'package:lotto_music/src/helpers/variables_globales.dart';
import 'package:lotto_music/src/models/login_response.dart';
import 'package:lotto_music/src/screens/acount/login.dart';
import 'package:flutter/material.dart';
import 'package:lotto_music/src/screens/perfil/tarjetas.dart';
import 'package:lotto_music/src/widgets/botones.dart';

import '../../bloc/acount/acount_bloc.dart';
import '../../widgets/text.dart';
import 'acerdade.dart';
import 'ajustes/ajustes.dart';
import 'ajustes/ajustes_usuario.dart';
import 'appbar.dart';
import 'historial_compras.dart';

class Perfil extends StatelessWidget {
  final TabController? controller;
  const Perfil({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        AppbarMiPerfil(controller: controller),
        Expanded(
          child: BlocBuilder<AcountBloc, AcountState>(
            builder: (context, state) {
              if (state.isLogin) {
                return BodyLogin(acount: state.acount);
              } else {
                return const BodyNoLogin();
              }
            },
          ),
        ),
      ]),
    );
  }
}

class BodyLogin extends StatelessWidget {
  final LoginResponse acount;
  const BodyLogin({Key? key, required this.acount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            width: Medidas.size.width * .4,
            padding: const EdgeInsets.only(bottom: 20),
            child: CircleAvatar(
              child: const Text('BZ'),
              radius: Medidas.size.width * .15,
            ),
          ),
          Textos.tituloMED(texto: "Hola" + ("")),
          Textos.parrafoMED(texto: ""),
          const SizedBox(
            height: 30,
          ),
          ListTile(
            title: Textos.tituloMIN(
              texto: 'Editar perfil',
              color: const Color(0xFFADB0B3),
            ),
            leading: const Icon(Icons.account_box),
            trailing: const Icon(
              Icons.arrow_forward_ios_sharp,
              size: 17,
            ),
            onTap: () {
              Navigator.pushNamed(context, AjustesUsuario.routeName);
            },
          ),
          ListTile(
            title: Textos.tituloMIN(texto: 'Configuracion'),
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
            title: Textos.tituloMIN(texto: 'Tarjetas'),
            leading: const Icon(Icons.credit_card),
            trailing: const Icon(
              Icons.arrow_forward_ios_sharp,
              size: 17,
            ),
            onTap: () {
              Navigator.pushNamed(context, Tarjetas.routeName);
            },
          ),
          ListTile(
            title: Textos.tituloMIN(texto: 'Historial de compra'),
            leading: const Icon(Icons.history_edu),
            trailing: const Icon(
              Icons.arrow_forward_ios_sharp,
              size: 17,
            ),
            onTap: () {
              Navigator.pushNamed(context, HistorialCompras.routeName);
            },
          ),
          ListTile(
            title: Textos.tituloMIN(texto: 'Acerca de'),
            leading: const Icon(NewIcons.escudo),
            trailing: const Icon(
              Icons.arrow_forward_ios_sharp,
              size: 17,
            ),
            onTap: () {
              Navigator.pushNamed(context, AcercaDe.routeName);
            },
          ),
          ListTile(
            title: Textos.tituloMIN(texto: 'Cerra sesión'),
            leading: const Icon(Icons.logout),
            onTap: () {
              Compositor.onLogOut(context);
            },
          ),
        ],
      ),
    );
  }
}

class BodyNoLogin extends StatelessWidget {
  const BodyNoLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            width: Medidas.size.width * .8,
            height: Medidas.size.width * .8,
            child: SvgPicture.asset(
              "assets/svg/imagenes/login.svg",
            ),
          ),
          SizedBox(
            width: Medidas.size.width * .5,
            child: Botones.solidTextButton(
                text: "Registrate",
                onTap: () {
                  Navigator.of(context).pushNamed(Login.routeName);
                },
                fontColor: Colors.white,
                backColor: Colors.red.shade200),
          )
        ],
      ),
    );
  }
}
