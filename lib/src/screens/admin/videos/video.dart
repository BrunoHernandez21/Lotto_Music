import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lotto_music/src/widgets/text.dart';

import '../../../helpers/variables_globales.dart';
import '../grupos/appbar.dart';

class Video extends StatelessWidget {
  static const routeName = 'video';

  const Video({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(children: [
            Container(
              color: Colors.amber,
              height: Medidas.size.width * .5625,
            ),
            SizedBox(height: 4),
            Align(
                alignment: Alignment.centerLeft,
                child: Textos.tituloGrey(texto: "Cancion Actual")),
            SizedBox(height: 8),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: destacados(
                [
                  "asdasd",
                  "asdasd",
                  "asdasd",
                  "asdasd",
                  "asdasd",
                  "asdasd",
                  "asdasd",
                  "asdasd",
                ],
                context,
              )),
            ),
            ...iterable(
              [
                "asdasd",
                "asdasd",
                "asdasd",
                "asdasd",
                "asdasd",
                "asdasd",
                "asdasd",
                "asdasd",
              ],
              context,
            ),
          ]),
        ),
      ),
    );
  }

  List<Widget> destacados(List<String> b, BuildContext context) {
    List<Widget> a = [];
    b.forEach((element) {
      a.add(Container(
        height: Medidas.size.width * .28,
        width: Medidas.size.width * .28,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(6)),
        child: GestureDetector(
          child: Stack(),
          onTap: () {
            Navigator.pushNamed(context, Video.routeName);
          },
        ),
      ));
    });
    return a;
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
