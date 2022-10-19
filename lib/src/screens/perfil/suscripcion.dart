import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotto_music/src/cores/orquestador/orquestador.dart';
import 'package:lotto_music/src/models/user/suscripcion.dart';
import 'package:lotto_music/src/widgets/botones.dart';
import 'package:lotto_music/src/widgets/dialogs_alert.dart';
import 'package:lotto_music/src/widgets/text.dart';

import '../../bloc/usersus/usersus_bloc.dart';

class SuscribcionPage extends StatelessWidget {
  static const String routeName = 'suscripcionpage';
  const SuscribcionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<UsersusBloc, UsersusState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              Orquestador.user.onLoadSuscribcion(context: context);
            },
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    width: double.infinity,
                  ),
                  _TarjetaSus(
                    susc: state.suscribcion ??
                        Suscripcion(
                          montoMensual: 0,
                          usuarioId: 0,
                        ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Visibility(
                    visible: (state.suscribcion?.stripeSuscription ?? "") != "",
                    child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 200,
                        child: Botones.solidTextButton(
                          text: "Terminar Suscribcion",
                          backColor: Colors.red,
                          fontColor: Colors.black,
                          onTap: () async {
                            final a = await DialogAlert.confirm(
                              context: context,
                              text: "Decea terminar la suscipcion?",
                            );
                            if (a != true) {
                              return;
                            }
                            final b = await Orquestador.buy.finishSuscripcion(
                              context: context,
                            );
                            if (b.mensaje != null) {
                              DialogAlert.ok(
                                context: context,
                                text: b.mensaje ?? "",
                              );
                            }
                            if (b.resp != null) {
                              DialogAlert.ok(
                                context: context,
                                text: b.resp ?? "",
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 300,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _TarjetaSus extends StatelessWidget {
  final Suscripcion susc;
  const _TarjetaSus({Key? key, required this.susc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.monetization_on),
          title: Textos.parrafoMED(
            texto: "Costo mensual ${susc.montoMensual}",
          ),
        ),
        ListTile(
          leading: const Icon(Icons.timelapse),
          title: Textos.parrafoMED(
            texto: "Inicio del mes ${susc.fechaInicio ?? "empty"}",
          ),
        ),
        ListTile(
          leading: const Icon(Icons.timelapse),
          title: Textos.parrafoMED(
            texto: "Fin del mes ${susc.fechaFin ?? "empty"}",
          ),
        ),
      ],
    );
  }
}
