import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotto_music/src/helpers/new_icons.dart';
import 'package:lotto_music/src/models/auth/login_response.dart';
import 'package:flutter/material.dart';
import 'package:lotto_music/src/screens/perfil/suscripcion.dart';
import 'package:lotto_music/src/screens/perfil/tarjetas/tarjetas.dart';
import 'package:lotto_music/src/widgets/dialogs_alert.dart';
import '../../bloc/acount/acount_bloc.dart';
import '../../bloc/cartera/cartera_bloc.dart';
import '../../bloc/user/user_bloc.dart';
import '../../cores/orquestador/orquestador.dart';
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
      Orquestador.user.onLoadUser(context);
    }
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () async {
            Orquestador.user.onLoadUser(context);
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
      Textos.tituloMED(texto: "Hola ${state.user?.nombre ?? "Nuevo Usuario"}"),
      const SizedBox(
        height: 30,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Align(
          alignment: Alignment.centerLeft,
          child: BlocBuilder<CarteraBloc, CarteraState>(
            builder: (context, state) {
              return Center(
                child: Textos.tituloMED(
                  texto: "Tus Puntos = ${state.cartera.puntos}",
                  color: Colors.grey,
                ),
              );
            },
          ),
        ),
      ),
      ListTile(
        title: Textos.tituloMIN(
          texto: 'Editar perfil',
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
        title: Textos.tituloMIN(texto: 'Suscripción'),
        leading: const Icon(Icons.subscriptions),
        trailing: const Icon(
          Icons.arrow_forward_ios_sharp,
          size: 17,
        ),
        onTap: () {
          Navigator.pushNamed(context, SuscribcionPage.routeName);
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
        onTap: () async {
          final a = await DialogAlert.confirm(
            context: context,
            text: "Decea cerrar la sesión?",
          );
          if (a == true) {
            // ignore: use_build_context_synchronously
            Orquestador.auth.onLogOut(context);
          }
        },
      ),
    ];
  }
}
