import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:lotto_music/src/cores/compositor.dart';
import 'package:lotto_music/src/screens/pagos/pagos.dart';
import 'package:lotto_music/src/screens/provedores_video/provedores_video.dart';

import '../bloc/shaderPreferences/shaderpreferences_bloc.dart';
import '../helpers/new_icons.dart';
import '../helpers/variables_globales.dart';
import 'perfil/perfil.dart';
import 'eventos/eventos.dart';

// este widget es solo para controlar los estados de la app (ciclo de vida)
class Admin extends StatefulWidget {
  static const routeName = 'Admin';

  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> with WidgetsBindingObserver {
  @override
  void initState() {
    Compositor.checkToken(context);
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      Compositor.checkToken(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    Medidas.size = MediaQuery.of(context).size;
    return const _BodyAdmin();
  }
}

class _BodyAdmin extends StatefulWidget {
  const _BodyAdmin({Key? key}) : super(key: key);

  @override
  State<_BodyAdmin> createState() => _BodyAdminState();
}

class _BodyAdminState extends State<_BodyAdmin> with TickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, initialIndex: 1, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShaderpreferencesBloc, ShaderpreferencesState>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: TabBarView(
                    controller: controller,
                    physics: const BouncingScrollPhysics(),
                    children: <Widget>[
                      const ProvedoresVideo(),
                      const Eventos(),
                      Perfil(controller: controller),
                      const Pagos(),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  color: BlocProvider.of<ShaderpreferencesBloc>(context)
                      .state
                      .themeData
                      .backgroundColor,
                  height: 35,
                  width: double.infinity,
                  child: TabBar(
                    controller: controller,
                    labelColor: Colors.orange,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.orange,
                    tabs: const <Widget>[
                      Tab(
                        icon: Icon(NewIcons.home2),
                      ),
                      Tab(
                        height: 55,
                        icon: Icon(Icons.gamepad_outlined),
                      ),
                      Tab(
                        icon: Icon(Icons.person),
                      ),
                      Tab(
                        icon: Icon(Icons.attach_money),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
