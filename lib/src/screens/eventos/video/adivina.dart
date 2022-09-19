import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lotto_music/src/widgets/botones.dart';
import 'package:lotto_music/src/widgets/dialogs_alert.dart';
import 'package:lotto_music/src/widgets/inputs_text.dart';

import '../../../bloc/cartera/cartera_bloc.dart';
import '../../../bloc/ve_page_controller/videos_event_controller_bloc.dart';
import '../../../bloc/video_event/video_event_bloc.dart';
import '../../../cores/orquestador/orquestador.dart';
import '../../../helpers/globals/assets.dart';
import '../../../helpers/globals/screen_size.dart';
import '../../../helpers/rutinas.dart';
import '../../../models/event/userevent.dart';
import '../../../models/video/evento_video.dart';
import '../../../widgets/digital_clock.dart';
import '../../../widgets/text.dart';

class Adivina extends StatefulWidget {
  const Adivina({Key? key}) : super(key: key);

  @override
  State<Adivina> createState() => _AdivinaState();
}

class _AdivinaState extends State<Adivina> {
  final controllerV = TextEditingController();
  final controllerL = TextEditingController();
  final controllerC = TextEditingController();
  final controllerG = TextEditingController();
  final controllerS = TextEditingController();

  bool controlV = false;
  bool controlL = false;
  bool controlC = false;
  bool controlG = false;
  bool controlS = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoEventBloc, VideoEventState>(
      builder: (context, state) {
        return FadeIn(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: double.infinity,
              ),
              _CardVideo(v: state.eventoVideo),
              apuesta(evento: state.eventoVideo, context: context),
            ],
          ),
        );
      },
    );
  }

  Widget apuesta({required ItemEvent evento, required BuildContext context}) {
    return Column(
      children: [
        const SizedBox(
          width: double.infinity,
          height: 20,
        ),
        Textos.tituloMAX(texto: "Tipo de evento"),
        Textos.tituloMAX(
            texto:
                "\$ ${evento.acumulado.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}MXN"),
        Align(
          alignment: Alignment.centerLeft,
          child: BlocBuilder<CarteraBloc, CarteraState>(
            builder: (context, state) {
              return Center(
                child: Textos.tituloMED(
                  texto: "Tus Puntos = ${state.cartera.puntos}",
                  color: Colors.yellow,
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Checkbox(
                value: controlV,
                fillColor: MaterialStateProperty.all(const Color(0xFF10CA20)),
                onChanged: (s) {
                  if (s != null) {
                    controlV = s;
                    setState(() {});
                  }
                }),
            SizedBox(
              width: Medidas.size.width * .6,
              child: InputsText.box(
                maxLength: 20,
                controller: controllerV,
                labelText: "Vistas",
                hintText: "0",
                textAlign: TextAlign.right,
                textType: TextInputType.number,
                onChanged: (a) async {
                  if (a.length >= 14) {
                    controllerV.text = a.substring(0, 13);
                  }
                  if (a.length == 1) {
                    controlV = true;
                    setState(() {});
                  }
                },
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Checkbox(
                value: controlL,
                fillColor: MaterialStateProperty.all(const Color(0xFF10CA20)),
                onChanged: (s) {
                  if (s != null) {
                    controlL = s;
                    setState(() {});
                  }
                }),
            SizedBox(
              width: Medidas.size.width * .6,
              child: InputsText.box(
                maxLength: 20,
                controller: controllerL,
                labelText: "Me gusta",
                hintText: "0",
                textAlign: TextAlign.right,
                textType: TextInputType.number,
                onChanged: (a) {
                  if (a.length >= 14) {
                    controllerL.text = a.substring(0, 13);
                  }
                  if (a.length == 1) {
                    controlL = true;
                    setState(() {});
                  }
                },
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Checkbox(
                value: controlC,
                fillColor: MaterialStateProperty.all(const Color(0xFF10CA20)),
                onChanged: (s) {
                  if (s != null) {
                    controlC = s;
                    setState(() {});
                  }
                }),
            SizedBox(
              width: Medidas.size.width * .6,
              child: InputsText.box(
                maxLength: 20,
                controller: controllerC,
                labelText: "Comentarios",
                hintText: "0",
                textAlign: TextAlign.right,
                textType: TextInputType.number,
                onChanged: (a) {
                  if (a.length >= 14) {
                    controllerC.text = a.substring(0, 13);
                  }
                  if (a.length == 1) {
                    controlC = true;
                    setState(() {});
                  }
                },
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Checkbox(
                value: controlG,
                fillColor: MaterialStateProperty.all(const Color(0xFF10CA20)),
                onChanged: (s) {
                  if (s != null) {
                    controlG = s;
                    setState(() {});
                  }
                }),
            SizedBox(
              width: Medidas.size.width * .6,
              child: InputsText.box(
                maxLength: 20,
                controller: controllerG,
                labelText: "Guardados",
                hintText: "0",
                textAlign: TextAlign.right,
                textType: TextInputType.number,
                onChanged: (a) {
                  if (a.length >= 14) {
                    controllerG.text = a.substring(0, 13);
                  }
                  if (a.length == 1) {
                    controlG = true;
                    setState(() {});
                  }
                },
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Checkbox(
                value: controlS,
                fillColor: MaterialStateProperty.all(const Color(0xFF10CA20)),
                onChanged: (s) {
                  if (s != null) {
                    controlS = s;
                    setState(() {});
                  }
                }),
            SizedBox(
              width: Medidas.size.width * .6,
              child: InputsText.box(
                maxLength: 20,
                controller: controllerS,
                labelText: "Compartidos",
                hintText: "0",
                textAlign: TextAlign.right,
                textType: TextInputType.number,
                onChanged: (a) {
                  if (a.length >= 14) {
                    controllerS.text = a.substring(0, 13);
                  }
                  if (a.length == 1) {
                    controlS = true;
                    setState(() {});
                  }
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 60,
          width: 160,
          child: Botones.degradedTextButton(
            text: "Participa",
            colors: [
              const Color.fromARGB(255, 100, 74, 146),
              const Color.fromARGB(255, 69, 27, 143)
            ],
            onTap: () async {
              final cartera =
                  BlocProvider.of<CarteraBloc>(context).state.cartera;

              if ((cartera.puntos) <= 0) {
                await DialogAlert.ok(
                  context: context,
                  text: "No tienes puntos disponibles",
                );
                return;
              }
              final apuesta = UserEventModel(
                eventoId: evento.id ?? 0,
              );
              if (controlV) {
                apuesta.viewsCount = int.tryParse(controllerV.text) ?? 0;
              }
              if (controlL) {
                apuesta.likeCount = int.tryParse(controllerL.text) ?? 0;
              }
              if (controlC) {
                apuesta.commentsCount = int.tryParse(controllerC.text) ?? 0;
              }
              if (controlS) {
                apuesta.savedCount = int.tryParse(controllerG.text) ?? 0;
              }
              if (controlS) {
                apuesta.sharedCount = int.tryParse(controllerS.text) ?? 0;
              }

              final resp = await Orquestador.userEvent.onUserEventCreate(
                context: context,
                apuesta: apuesta,
              );
              await Orquestador.user.onLoadCartera(context: context);
              if (resp?.mensaje != null) {
                await DialogAlert.ok(
                  context: context,
                  text: resp?.mensaje ?? "Error",
                );
              } else {
                await DialogAlert.ok(
                  context: context,
                  text: "Envio exitoso",
                );
                setState(() {});
              }
            },
          ),
        ),
        const SizedBox(
          height: 60,
        ),
      ],
    );
  }
}

class _CardVideo extends StatelessWidget {
  final ItemEvent v;
  const _CardVideo({
    Key? key,
    required this.v,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          width: double.infinity,
        ),
        Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                  onPressed: () {
                    BlocProvider.of<VEPageControllerBloc>(context).add(
                      OnSelectPapge(page: 1),
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                  )),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 120,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(15),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(colors: [
                      Color.fromARGB(255, 5, 222, 230),
                      Color.fromARGB(255, 3, 199, 101),
                    ])),
                child: const DefaultDigitalClock(),
              ),
            ),
          ],
        ),
        Textos.tituloMAX(
          texto: v.titulo ?? "",
          renglones: 2,
        ),
        Textos.tituloMED(
          texto: v.artista ?? "",
          renglones: 1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Textos.tituloMED(
                texto: "Hora ${v.fechahoraevento.toString().substring(11, 16)}",
              ),
              Textos.tituloMED(
                texto: Rutinas.comprobador(v.fechahoraevento),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget imagen(String? url) {
    return Image.network(
      url ?? "",
      errorBuilder: (context, error, stackTrace) {
        return SvgPicture.asset(
          Assets.svgvideo,
          fit: BoxFit.cover,
        );
      },
      fit: BoxFit.cover,
    );
  }
}