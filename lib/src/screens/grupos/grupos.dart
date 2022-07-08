import 'package:flutter/material.dart';
import 'appbar.dart';
import '../eventos/categorias.dart';
import 'videos.dart';

class Grupos extends StatelessWidget {
  const Grupos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: const [
          AppbarInicio(),
          VideosApuestas(),
        ],
      )),
    );

    ;
  }
}
