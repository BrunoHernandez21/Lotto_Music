import 'package:flutter/material.dart';
import 'package:lotto_music/src/widgets/text.dart';

import '../../../helpers/variables_globales.dart';
import '../../../models/videos.dart';

class Video extends StatelessWidget {
  static const routeName = 'video';

  const Video({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            SizedBox(
              height: Medidas.size.width * .5625,
              width: double.infinity,
              child: Image.network(
                Developer.videos[2].image,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 4),
            Align(
                alignment: Alignment.centerLeft,
                child: Textos.tituloGrey(texto: "Cancion Actual")),
            const SizedBox(height: 8),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: destacados(
                Developer.videos,
                context,
              )),
            ),
            ...iterable(
              Developer.videos,
              context,
            ),
          ]),
        ),
      ),
    );
  }

  List<Widget> destacados(List<VideoModel> b, BuildContext context) {
    List<Widget> a = [];
    for (var v in b) {
      a.add(Container(
        height: Medidas.size.width * .28,
        width: Medidas.size.width * .28,
        margin: const EdgeInsets.all(8),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
        child: GestureDetector(
          child: Image.network(
            v.image,
            fit: BoxFit.fill,
          ),
          onTap: () {
            Navigator.pushNamed(context, Video.routeName);
          },
        ),
      ));
    }
    return a;
  }

  List<Widget> iterable(List<VideoModel> b, BuildContext context) {
    List<Widget> a = [];
    for (var v in b) {
      a.add(SizedBox(
        height: Medidas.size.width * .3,
        child: GestureDetector(
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10),
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
              const SizedBox(
                width: 6,
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(
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
    }
    return a;
  }
}
