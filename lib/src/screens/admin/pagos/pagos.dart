import 'package:flutter/material.dart';
import 'package:lotto_music/src/screens/admin/pagos/cancelados/cancelados.dart';
import 'package:lotto_music/src/screens/admin/pagos/pendientes/pendientes.dart';

import '../../../widgets/text.dart';
import 'appbar.dart';
import 'ejecutados/ejecutados.dart';

class Pagos extends StatelessWidget {
  const Pagos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Column(
          children: [
            const AppbarCarrito(),
            Center(
              child: Textos.tituloGrey(texto: "Pagos"),
            ),
            const SizedBox(
              height: 55,
              child: TabBar(
                labelColor: Colors.orange,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.orange,
                tabs: <Widget>[
                  Tab(
                    text: 'Pendientes',
                  ),
                  Tab(
                    text: 'Ejecutados',
                  ),
                  Tab(
                    text: 'Cancelados',
                  ),
                ],
              ),
            ),
            const Expanded(
              child: TabBarView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[Pendientes(), Ejecutados(), Cancelados()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
