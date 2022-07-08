import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lotto_music/src/cores/compositor.dart';

import '../../helpers/variables_globales.dart';
import '../../widgets/text.dart';
import '../videos/videos.dart';

class Categorias extends StatefulWidget {
  const Categorias({Key? key}) : super(key: key);

  @override
  State<Categorias> createState() => _CategoriasState();
}

class _CategoriasState extends State<Categorias> {
  List<String> grupos = [];
  @override
  void initState() {
    Compositor.onLoadCategorias(context: context).then((value) {
      grupos = value ?? [];
      setState(() {});
    });
    super.initState();
  }

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
        RefreshIndicator(
          onRefresh: () async {
            grupos = await Compositor.onLoadCategorias(context: context) ?? [];
            setState(() {});
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            child: grupos.isEmpty
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: Medidas.size.height * .90,
                        alignment: Alignment.center,
                        color: Colors.black45,
                        child: Textos.tituloMAX(
                          texto: "Deslize para actualizar",
                        ),
                      )
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Wrap(
                        children: createCarts(
                          grupos,
                          context,
                        ),
                      ),
                      grupos.length < 8
                          ? SizedBox(
                              height: (Medidas.size.height * .2) *
                                  ((8 - grupos.length) / 2),
                            )
                          : const SizedBox(),
                    ],
                  ),
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
