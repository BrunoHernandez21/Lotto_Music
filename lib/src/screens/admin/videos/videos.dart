import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lotto_music/src/screens/admin/Videos/appbar.dart';
import 'package:lotto_music/src/screens/admin/videos/video.dart';
import 'package:lotto_music/src/widgets/text.dart';

import '../../../helpers/variables_globales.dart';
import '../../../models/videos.dart';
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
                  children: iterable(Developer.videos, context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> iterable(List<Video_Model> b, BuildContext context) {
    List<Widget> a = [];
    b.forEach((v) {
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
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  v.image,
                  fit: BoxFit.cover,
                ),
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
                    Textos.titulo(texto: v.name, align: TextAlign.left),
                    Textos.tituloGrey(texto: v.name),
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
