import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotto_music/src/bloc/planes/planes_bloc.dart';
import 'package:lotto_music/src/cores/orquestador/orquestador.dart';
import 'package:lotto_music/src/screens/pagos/planes/planes.dart';
import 'package:lotto_music/src/screens/pagos/suscribciones/suscribciones.dart';

import '../../bloc/suscripciones/suscripciones_bloc.dart';
import 'appbar.dart';

class Pagos extends StatefulWidget {
  const Pagos({Key? key}) : super(key: key);

  @override
  State<Pagos> createState() => _PagosState();
}

class _PagosState extends State<Pagos> {
  @override
  void initState() {
    super.initState();
    if (BlocProvider.of<PlanesBloc>(context).state.planes?.isEmpty ?? true) {
      Orquestador.plan.onLoadPlanes(context);
    }
    if (BlocProvider.of<SuscripcionesBloc>(context).state.planes?.isEmpty ??
        true) {
      Orquestador.plan.onLoadSuscripciones(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Column(
          children: const [
            AppbarCarrito(),
            SizedBox(
              height: 4,
            ),
            SizedBox(
              height: 30,
              child: TabBar(
                labelColor: Colors.orange,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.orange,
                tabs: <Widget>[
                  Tab(
                    text: 'Paquetes',
                  ),
                  Tab(
                    text: 'Suscripciones',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  Planes(),
                  Suscripciones(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
