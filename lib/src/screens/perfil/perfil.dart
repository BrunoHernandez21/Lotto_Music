import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lotto_music/src/cores/compositor.dart';
import 'package:lotto_music/src/helpers/new_icons.dart';
import 'package:lotto_music/src/helpers/variables_globales.dart';
import 'package:lotto_music/src/models/cartera.dart';
import 'package:lotto_music/src/models/login_response.dart';
import 'package:lotto_music/src/screens/acount/login.dart';
import 'package:flutter/material.dart';
import 'package:lotto_music/src/screens/perfil/tarjetas/tarjetas.dart';
import 'package:lotto_music/src/widgets/botones.dart';

import '../../bloc/acount/acount_bloc.dart';
import '../../bloc/user/user_bloc.dart';
import '../../widgets/inicia_secion.dart';
import '../../widgets/text.dart';
import 'acerda_de.dart';
import 'ajustes/ajustes.dart';
import 'editar_perfil/ajustes_usuario.dart';
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
                return const BodyNoLoged();
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
    if (BlocProvider.of<UserBloc>(context).state.user == null) {
      Compositor.onLoadUser(context);
    }
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () async {
            Compositor.onLoadUser(context);
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            child: Column(
              children: bodyLogin(context, state),
            ),
          ),
        );
      },
    );
  }

  List<Widget> bodyLogin(BuildContext context, UserState state) {
    return [
      const SizedBox(
        height: 30,
      ),
      Textos.tituloMED(
          texto: "Hola " + (state.user?.nombre ?? "Nuevo Usuario")),
      const SizedBox(
        height: 30,
      ),
      Container(
        margin: const EdgeInsets.only(left: 15),
        alignment: Alignment.centerLeft,
        child: FutureBuilder(
          future: Compositor.onLoadCartera(context: context),
          initialData: null,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            final data = snapshot.data;
            int cash = 0;
            if (data.runtimeType == Cartera) {
              cash = snapshot.data.cash;
            }
            return Column(
              children: [
                Textos.tituloMIN(
                  texto: "Cash = " + cash.toString(),
                  color: Colors.yellow,
                )
              ],
            );
          },
        ),
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
    ];
  }
}
