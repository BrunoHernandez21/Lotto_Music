import 'package:flutter/material.dart';
import 'package:lotto_music/src/screens/pagos/planes/planes.dart';

import 'appbar.dart';
import 'carrito/carrito.dart';

class Pagos extends StatelessWidget {
  const Pagos({Key? key}) : super(key: key);

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
                    text: 'Planes',
                  ),
                  Tab(
                    text: 'Carrito',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  Planes(),
                  Carrito(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}