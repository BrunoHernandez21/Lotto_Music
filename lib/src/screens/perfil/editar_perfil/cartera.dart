import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotto_music/src/widgets/text.dart';

import '../../../bloc/cartera/cartera_bloc.dart';

class Cartera extends StatelessWidget {
  static const String routeName = "cartera";
  const Cartera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Textos.tituloMIN(texto: "Cartera"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: BlocBuilder<CarteraBloc, CarteraState>(
          builder: (context, state) {
            return Column(
              children: [
                ListTile(
                  title:
                      Textos.tituloMIN(texto: "Puntos ${state.cartera.puntos}"),
                ),
                ListTile(
                  title: Textos.tituloMIN(
                      texto: "Saldo MXN ${state.cartera.saldoMxn}"),
                ),
                ListTile(
                  title: Textos.tituloMIN(
                      texto: "Saldo USD ${state.cartera.saldoUsd}"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
