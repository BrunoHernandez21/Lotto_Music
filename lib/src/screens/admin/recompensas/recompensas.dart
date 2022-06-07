import 'package:flutter/material.dart';

import '../../../helpers/variables_globales.dart';

import 'Entregas.dart';
import 'appbar.dart';

import 'adquiridas.dart';

class Recompensas extends StatefulWidget {
  const Recompensas({Key? key}) : super(key: key);

  @override
  State<Recompensas> createState() => _RecompensasState();
}

class _RecompensasState extends State<Recompensas>
    with TickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 2, initialIndex: 0, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Medidas.size = MediaQuery.of(context).size;

    return SafeArea(
      child: Column(
        children: [
          const AppbarCursos(),
          SizedBox(
            height: 55,
            child: TabBar(
              controller: controller,
              labelColor: Colors.orange,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.orange,
              tabs: const <Widget>[
                Tab(
                  text: 'Recompensas',
                ),
                Tab(
                  text: 'Entregas',
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: controller,
              physics: const BouncingScrollPhysics(),
              children: <Widget>[
                Adquiridas(controller: controller),
                const Entregas(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
