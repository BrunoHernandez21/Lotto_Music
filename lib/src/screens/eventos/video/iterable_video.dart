import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lotto_music/src/cores/orquestador/orquestador.dart';
import 'package:lotto_music/src/screens/eventos/video/video_evento.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../bloc/cartera/cartera_bloc.dart';
import '../../../bloc/videos_event/videos_event_bloc.dart';
import '../../../helpers/globals/assets.dart';
import '../../../helpers/globals/screen_size.dart';
import '../../../helpers/rutinas.dart';
import '../../../models/video/evento_video.dart';
import '../../../widgets/botones.dart';
import '../../../widgets/text.dart';
import 'estadisticas_yt.dart';

class IterableVideo extends StatelessWidget {
  final ItemEvent eventoVideo;
  final YoutubePlayerController controller;
  final void Function() onPage2;
  final void Function() onPage3;
  const IterableVideo({
    Key? key,
    required this.controller,
    required this.eventoVideo,
    required this.onPage2,
    required this.onPage3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: Column(
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          ListTile(
            title: Textos.tituloMED(
              texto: eventoVideo.titulo?.trim() ?? "",
              color: const Color.fromARGB(255, 201, 174, 56),
              align: TextAlign.left,
            ),
            subtitle:
                Textos.parrafoMAX(texto: eventoVideo.artista?.trim() ?? ""),
          ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              EstadisticasYT(
                videoID: eventoVideo.vidId ?? 0,
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Textos.parrafoMAX(
                      texto:
                          "Hora ${eventoVideo.fechahoraEvento.toString().substring(11, 16)}",
                    ),
                    Textos.parrafoMAX(
                      texto: Rutinas.comprobador(
                        eventoVideo.fechahoraEvento,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 80,
              width: Medidas.size.width * .9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 150,
                    child: Botones.solidTextButton(
                      text: "Participa",
                      onTap: onPage2,
                      fontColor: const Color.fromARGB(255, 255, 255, 255),
                      backColor: const Color.fromARGB(255, 46, 161, 50),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: Botones.solidTextButton(
                      text: "Estadisticas",
                      fontColor: const Color.fromARGB(255, 255, 255, 255),
                      backColor: const Color.fromARGB(255, 196, 30, 18),
                      onTap: onPage3,
                    ),
                  )
                ],
              ),
            ),
          ),
          const _ListaVideosEvent(),
        ],
      ),
    );
  }
}

/// Tarjetas iterables

class _ListaVideosEvent extends StatefulWidget {
  const _ListaVideosEvent({Key? key}) : super(key: key);

  @override
  State<_ListaVideosEvent> createState() => _ListVideosPaginacionState();
}

class _ListVideosPaginacionState extends State<_ListaVideosEvent> {
  bool isLoad = false;
  @override
  void initState() {
    super.initState();
    if (BlocProvider.of<VideosEventBloc>(context).state.listado == null) {
      Orquestador.video.onLoadInitVideosEventos(context);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideosEventBloc, VideosEventState>(
      builder: (context, state) {
        return Column(
          children: cuerpo(context, state.listado ?? []),
        );
      },
    );
  }

  List<Widget> cuerpo(BuildContext context, List<ItemEvent> items) {
    List<Widget> a = [];

    for (var v in items) {
      a.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: Medidas.size.width * .240,
          child: GestureDetector(
            child: bodyTarjeta(v),
            onTap: () async {
              await Orquestador.video
                  .onSlectVideoEvento(context: context, item: v);

              if (!mounted) {
                return;
              }
              Navigator.popAndPushNamed(context, VideoEvento.routeName);
            },
          ),
        ),
      ));
    }

    return a;
  }

  Widget bodyTarjeta(ItemEvent v) {
    return SizedBox(
      height: Medidas.size.width * .240,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: Medidas.size.width * .360,
              height: Medidas.size.width * .240,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: imagen(v.thumblary)),
          const SizedBox(
            width: 6,
          ),
          SizedBox(
            width: Medidas.size.width * .4,
            height: Medidas.size.width * .240,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Textos.parrafoMED(
                  texto: v.titulo ?? "",
                  renglones: 2,
                ),
                Textos.parrafoMIN(
                  texto: v.artista ?? "",
                  renglones: 1,
                ),
                const Expanded(child: SizedBox()),
                Textos.parrafoMED(
                  texto:
                      "Hora ${v.fechahoraEvento.toString().substring(11, 16)}",
                ),
                Textos.parrafoMED(
                  texto: Rutinas.comprobador(v.fechahoraEvento),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget imagen(String? url) {
    return Image.network(
      url ?? "",
      errorBuilder: (context, error, stackTrace) {
        return SvgPicture.asset(
          Assets.pngLogo,
          fit: BoxFit.cover,
        );
      },
      fit: BoxFit.cover,
    );
  }
}
