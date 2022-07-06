import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../helpers/variables_globales.dart';
import '../../widgets/text.dart';
import '../videos/videos.dart';

class Categorias extends StatelessWidget {
  const Categorias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(
          height: double.infinity,
          width: double.infinity,
        ),
        SvgPicture.asset(
          "assets/svg/imagenes/explorer.svg",
          fit: BoxFit.fitWidth,
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
        ),
      ],
    );
  }

  List<Widget> createCarts(
    List<String> list,
    BuildContext context,
  ) {
    List<Widget> r = [];
    const styleBorder = BorderSide(
      color: Color(0xff591da9),
      style: BorderStyle.solid,
      width: 4,
    );
    for (var element in list) {
      r.add(
        Container(
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.all(Medidas.size.width * .02),
          width: Medidas.size.width * .46,
          height: Medidas.size.width * .27,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(.6),
            borderRadius: BorderRadius.circular(10),
            border: const Border(
              bottom: styleBorder,
              left: styleBorder,
              right: styleBorder,
              top: styleBorder,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent)),
              onPressed: () {
                Navigator.of(context).pushNamed(Videos.routeName);
              },
              onLongPress: () {},
              child: Center(
                child: Textos.tituloMIN(texto: element, color: Colors.white),
              ),
            ),
          ),
        ),
      );
    }
    return r;
  }
}
