import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lotto_music/src/screens/admin/videos/video.dart';
import 'package:lotto_music/src/widgets/text.dart';

import '../../../helpers/variables_globales.dart';
import '../videos/videos.dart';
import 'appbar.dart';

class Grupos extends StatelessWidget {
  const Grupos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AppbarInicio(),
          Wrap(
            children: createCarts(
              [
                "Shorcuts",
                "Hits",
                "Ciense",
                "History",
                "Biologi",
                "Family",
                "Shorcuts",
                "Hits",
                "Ciense",
                "History",
                "Biologi",
                "Family",
              ],
              context,
            ),
          )
        ],
      ),
    ));
  }

  List<Widget> createCarts(
    List<String> list,
    BuildContext context,
  ) {
    final a = Random();
    List<Widget> r = [];
    list.forEach((element) {
      r.add(
        Container(
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.all(Medidas.size.width * .02),
          width: Medidas.size.width * .46,
          height: Medidas.size.width * .27,
          decoration: BoxDecoration(
            color: Color(0xFF000000 + a.nextInt(8388608)),
            borderRadius: BorderRadius.circular(5),
          ),
          child: ElevatedButton(
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(Colors.transparent)),
            onPressed: () {
              Navigator.of(context).pushNamed(Videos.routeName);
            },
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Textos.titulo(texto: element),
                ),
                Transform(
                  transform: Matrix4.rotationZ(.2),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      Assets.logo2,
                      width: Medidas.size.width * .2,
                      height: Medidas.size.width * .2,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
    return r;
  }
}
