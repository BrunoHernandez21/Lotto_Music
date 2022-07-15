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
import '../../../models/evento_video.dart';
import '../../../widgets/digital_clock.dart';
import '../../../widgets/text.dart';

class Adivina extends StatelessWidget {
  static const String routeName = "adivina";
  Adivina({Key? key}) : super(key: key);
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
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
    Widget selector = const SizedBox();

    if (evento.evento.tipoApuestaId == 1) {
      selector = Textos.tituloMED(texto: "Vistas");
    }
    if (evento.evento.tipoApuestaId == 2) {
      selector = Textos.tituloMED(texto: "Like");
    }
    if (evento.evento.tipoApuestaId == 3) {
      selector = Textos.tituloMED(texto: "comentarios");
    }
    if (evento.evento.tipoApuestaId == 4) {
      selector = Textos.tituloMED(texto: "No me gusta");
    }
    if (evento.evento.tipoApuestaId == 5) {
      selector = Textos.tituloMED(texto: "Guardados");
    }
    if (evento.evento.tipoApuestaId == 6) {
      selector = Textos.tituloMED(texto: "Compartidos");
    }

    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Textos.tituloMAX(texto: "Tipo de evento"),
        const SizedBox(
          height: 40,
        ),
        selector,
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 15,
            ),
            SizedBox(
              height: 45,
              width: 160,
              child: InputsText.classic(
                  controller: controller,
                  textType: TextInputType.number,
                  onChanged: (a) {
                    if (a.length >= 14) {
                      controller.text = a.substring(0, 13);
                    }
                  }),
            ),
            const SizedBox(
              width: 30,
            ),
            SizedBox(
              height: 45,
              width: 110,
              child: Botones.degradedTextButton(
                text: "Participa",
                colors: [
                  const Color.fromARGB(255, 100, 74, 146),
                  const Color.fromARGB(255, 69, 27, 143)
                ],
                onTap: () async {
                  int intento = 0;
                  String texto = controller.text;
                  if (texto.isEmpty) {
                    DialogAlert.ok(
                      context: context,
                      text: "La participacion vacia",
                    );
                    return;
                  }
                  try {
                    texto = texto
                        .replaceAll(",", "")
                        .replaceAll(" ", "")
                        .replaceAll("-", "")
                        .replaceAll(".", "")
                        .replaceAll("/", "")
                        .replaceAll(",", "");
                    intento = int.parse(texto);
                  } catch (e) {
                    DialogAlert.ok(
                      context: context,
                      text: "Solo numeros",
                    );
                  }
                  if (await Compositor.onBuyIntent(
                        context: context,
                        evento: evento,
                        aproximacion: intento,
                        cantidad: 1,
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
          ],
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
            child: imagen(v.video.thumblary)),
        const SizedBox(
          width: 6,
        ),
        Textos.tituloMAX(
          texto: v.video.titulo ?? "",
          renglones: 2,
        ),
        Textos.tituloMED(
          texto: v.video.artista ?? "",
          renglones: 1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Textos.tituloMED(
                texto: "Hora " +
                    v.evento.fechahoraapuesta.toString().substring(11, 16),
              ),
              Textos.tituloMED(
                texto: comprobador(v.evento.fechahoraapuesta),
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
