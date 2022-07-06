import 'package:flutter/material.dart';
import 'appbar.dart';
import 'categorias.dart';
import 'videos.dart';

class Grupos extends StatelessWidget {
  const Grupos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Column(
        children: [
          const AppbarInicio(),
          Container(
            alignment: Alignment.center,
            height: 35,
            width: double.infinity,
            child: const TabBar(
              labelColor: Colors.orange,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.orange,
              tabs: <Widget>[
                Tab(
                  height: 55,
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
                VideosApuestas(),
                Categorias(),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
