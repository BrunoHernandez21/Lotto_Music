import 'package:flutter/material.dart';

import 'appbar.dart';
import 'categorias/categorias.dart';
import 'eventos/video_eventos.dart';

class Eventos extends StatelessWidget {
  const Eventos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const AppbarEventos(),
            Container(
              alignment: Alignment.center,
              height: 30,
              width: double.infinity,
              child: const TabBar(
                labelColor: Colors.orange,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.orange,
                tabs: <Widget>[
                  Tab(
                    icon: Icon(Icons.video_library_outlined),
                  ),
                  Tab(
                    icon: Icon(Icons.category),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: TabBarView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  VideosEventos(),
                  Categorias(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
