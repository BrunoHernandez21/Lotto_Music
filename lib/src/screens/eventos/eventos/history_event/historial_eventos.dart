import 'package:flutter/material.dart';
import 'package:lotto_music/src/screens/eventos/eventos/history_event/inactive.dart';
import 'active.dart';

class HistorialEventos extends StatelessWidget {
  static const routeName = 'historialEventos';
  const HistorialEventos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DefaultTabController(
        length: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // const AppbarEventos(),
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
                    icon: Icon(Icons.verified),
                  ),
                  Tab(
                    icon: Icon(Icons.work_history_sharp),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: TabBarView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  HistorialActive(),
                  HistorialInactive(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
