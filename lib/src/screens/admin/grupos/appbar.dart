import 'package:flutter/material.dart';

import '../../../helpers/variables_globales.dart';
import '../../../widgets/text.dart';
import '../notify/notify.dart';
import '../search/search.dart';

class AppbarInicio extends StatelessWidget {
  const AppbarInicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15,
          ),
          Image.asset(Assets.logo, height: 30),
          SizedBox(
            width: 5,
          ),
          Textos.parrafoGrey(texto: "Lotto Music"),
          Expanded(child: SizedBox()),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, SearchVideos.routeName);
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.pushNamed(context, Notify.routeName);
            },
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
