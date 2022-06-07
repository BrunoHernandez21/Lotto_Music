import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lotto_music/src/screens/admin/Videos/appbar.dart';
import 'package:lotto_music/src/screens/admin/videos/video.dart';
import 'package:lotto_music/src/widgets/text.dart';

import '../../../helpers/variables_globales.dart';
import '../grupos/appbar.dart';

class Videos extends StatelessWidget {
  static const routeName = 'videos';

  const Videos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppbarVideos(),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: iterable([
                    "Video musical de maluma",
                    "Video musical de Riana",
                    "Video musical de Guns and Roces",
                    "Video musical de Pink Floy",
                    "Video musical de coldplay",
                    "Video musical de Dua Lipa",
                    "Video musical de Cristian Nodal",
                    "Video musical de Intocable",
                  ], context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> iterable(List<String> b, BuildContext context) {
    List<Widget> a = [];
    b.forEach((element) {
      a.add(SizedBox(
        height: Medidas.size.width * .3,
        child: GestureDetector(
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                height: Medidas.size.width * .240,
                width: Medidas.size.width * .360,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10)),
              ),
              SizedBox(
                width: 6,
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Textos.titulo(texto: element, align: TextAlign.left),
                    Textos.tituloGrey(texto: element),
                  ],
                ),
              )
            ],
          ),
          onTap: () {
            Navigator.pushNamed(context, Video.routeName);
          },
        ),
      ));
    });
    return a;
  }
}
