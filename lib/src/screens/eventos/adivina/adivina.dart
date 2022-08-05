import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lotto_music/src/widgets/botones.dart';
import 'package:lotto_music/src/widgets/dialogs_alert.dart';
import 'package:lotto_music/src/widgets/inputs_text.dart';

import '../../../bloc/video_event/video_event_bloc.dart';
import '../../../cores/compositor.dart';
import '../../../helpers/rutinas.dart';
import '../../../helpers/variables_globales.dart';
import '../../../models/userevent.dart';
import '../../../models/evento_video.dart';
import '../../../widgets/digital_clock.dart';
import '../../../widgets/text.dart';

class Adivina extends StatefulWidget {
  static const String routeName = "adivina";
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

  bool controlV = true;
  bool controlL = true;
  bool controlC = true;
  bool controlG = true;
  bool controlS = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BlocBuilder<VideoEventBloc, VideoEventState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: double.infinity,
                  ),
                  Textos.tituloMAX(texto: "Evento"),
                  Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 5, 222, 230),
                          Color.fromARGB(255, 3, 199, 101),
                        ])),
                    child: const DefaultDigitalClock(),
                  ),
                  _CardVideo(v: state.eventoVideo),
                  apuesta(evento: state.eventoVideo, context: context),
                ],
              );
            },
          )),
    );
  }

  Widget apuesta({required ItemEvent evento, required BuildContext context}) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Textos.tituloMAX(texto: "Tipo de evento"),
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
                  onChanged: (a) {
                    if (a.length >= 14) {
                      controllerV.text = a.substring(0, 13);
                    }
                  }),
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
                  }),
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
                  }),
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
                  }),
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
                  onChanged: (a) {}),
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

              if (await Compositor.onUserEventCreate(
                    context: context,
                    apuesta: apuesta,
                  ) ??
                  false) {
                DialogAlert.ok(
                  context: context,
                  text: "Compra realizada con exito",
                );
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
        Container(
            width: Medidas.size.width * .640,
            height: Medidas.size.width * .360,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: imagen(v.thumblary)),
        const SizedBox(
          width: 6,
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
                texto: "Hora " + v.fechahoraevento.toString().substring(11, 16),
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
