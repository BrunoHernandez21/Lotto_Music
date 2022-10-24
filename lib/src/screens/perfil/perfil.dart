import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lotto_music/src/helpers/globals/assets.dart';
import 'package:lotto_music/src/helpers/globals/screen_size.dart';
import 'package:lotto_music/src/helpers/new_icons.dart';
import 'package:lotto_music/src/models/auth/login_response.dart';
import 'package:flutter/material.dart';
import 'package:lotto_music/src/screens/acount/login.dart';
import 'package:lotto_music/src/screens/perfil/suscripcion/suscripcion.dart';
import 'package:lotto_music/src/screens/perfil/tarjetas/tarjetas.dart';
import 'package:lotto_music/src/widgets/botones.dart';
import 'package:lotto_music/src/widgets/dialogs_alert.dart';
import '../../bloc/acount/acount_bloc.dart';
import '../../bloc/cartera/cartera_bloc.dart';
import '../../bloc/user/user_bloc.dart';
import '../../cores/orquestador/orquestador.dart';
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
        const AppbarMiPerfil(),
        Expanded(
          child: BlocBuilder<AcountBloc, AcountState>(
            builder: (context, state) {
              return BodyLogin(
                acount: state.acount,
                islogin: state.isLogin,
              );
            },
          ),
        ),
      ]),
    );
  }
}

class BodyLogin extends StatelessWidget {
  final LoginResponse acount;
  final bool islogin;
  const BodyLogin({
    Key? key,
    required this.acount,
    required this.islogin,
  }) : super(key: key);

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
      Visibility(
        visible: islogin,
        child: Textos.tituloMED(
          texto: "Hola ${state.user?.nombre ?? "Nuevo Usuario"}",
        ),
      ),
      Visibility(
        visible: !islogin,
        child: Textos.tituloMED(
          texto: "Hola",
        ),
      ),
      const SizedBox(
        height: 30,
      ),
      Visibility(
        visible: !islogin,
        child: Column(
          children: [
            Textos.tituloMED(
              texto: "Parece que no haz iniciado sesión",
              renglones: 3,
              align: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Theme.of(context).hintColor.withOpacity(.2),
              ),
              child: SvgPicture.asset(
                Assets.svgWelcomCats,
                width: Medidas.size.width * .34,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 200,
              child: Botones.solidTextButton(
                text: "Iniciar sesión",
                onTap: () {
                  Navigator.of(context).pushNamed(Login.routeName);
                },
                fontColor: Colors.white,
                backColor: Colors.black,
              ),
            ),
            const SizedBox(
              width: double.infinity,
              height: 60,
            ),
          ],
        ),
      ),
      Visibility(
        visible: islogin,
        child: Padding(
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
      ),
      Visibility(
        visible: islogin,
        child: ListTile(
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
      Visibility(
        visible: islogin,
        child: ListTile(
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
      ),
      Visibility(
        visible: islogin,
        child: ListTile(
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
      ),
      Visibility(
        visible: islogin,
        child: ListTile(
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
      Visibility(
        visible: islogin,
        child: ListTile(
          title: Textos.tituloMIN(texto: 'Cerra sesión'),
          leading: const Icon(Icons.logout),
          onTap: () async {
            final a = await DialogAlert.confirm(
              context: context,
              text: "Desea cerrar la sesión?",
            );
            if (a == true) {
              // ignore: use_build_context_synchronously
              Orquestador.auth.onLogOut(context);
            }
          },
        ),
      ),
    ];
  }
}
