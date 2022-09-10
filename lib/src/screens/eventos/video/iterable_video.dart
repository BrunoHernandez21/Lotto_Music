import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lotto_music/src/screens/eventos/video/video_evento.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../bloc/cartera/cartera_bloc.dart';
import '../../../bloc/ve_page_controller/videos_event_controller_bloc.dart';
import '../../../cores/compositor.dart';
import '../../../helpers/rutinas.dart';
import '../../../helpers/variables_globales.dart';
import '../../../models/evento_video.dart';
import '../../../widgets/botones.dart';
import '../../../widgets/text.dart';
import 'estadisticas_yt.dart';

class IterableVideo extends StatelessWidget {
  final ItemEvent eventoVideo;
  final YoutubePlayerController controller;
  const IterableVideo({
    Key? key,
    required this.controller,
    required this.eventoVideo,
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
                videoID: eventoVideo.vidid ?? 0,
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Textos.parrafoMAX(
                      texto:
                          "Hora ${eventoVideo.fechahoraevento.toString().substring(11, 16)}",
                    ),
                    Textos.parrafoMAX(
                      texto: Rutinas.comprobador(
                        eventoVideo.fechahoraevento,
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
                      onTap: () {
                        BlocProvider.of<VEPageControllerBloc>(context).add(
                          OnSelectPapge(page: 2),
                        );
                      },
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
                      onTap: () async {
                        BlocProvider.of<VEPageControllerBloc>(context).add(
                          OnSelectPapge(page: 3),
                        );
                      },
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
  State<_ListaVideosEvent> createState() => _ListaVideosState();
}

class _ListaVideosState extends State<_ListaVideosEvent> {
  List<ItemEvent>? iterable;

  @override
  void initState() {
    Compositor.onLoadEventosTemp(context: context).then((value) {
      iterable = value;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: cuerpo(context),
    );
  }

  List<Widget> cuerpo(BuildContext context) {
    List<Widget> a = [];
    final List<ItemEvent> items = iterable ?? [];

    for (var v in items) {
      a.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: Medidas.size.width * .240,
          child: GestureDetector(
            child: bodyTarjeta(v),
            onTap: () async {
              await Compositor.onSlectVideoEvento(context: context, item: v);

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
                      "Hora ${v.fechahoraevento.toString().substring(11, 16)}",
                ),
                Textos.parrafoMED(
                  texto: Rutinas.comprobador(v.fechahoraevento),
                ), /////////////////////////////////////////////
                ///
                ///
                ///
                ///Estadisticas
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
          Assets.svgvideo,
          fit: BoxFit.cover,
        );
      },
      fit: BoxFit.cover,
    );
  }
}
