import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lotto_music/src/models/evento_video.dart';
import 'package:lotto_music/src/screens/eventos/adivina/adivina.dart';
import 'package:lotto_music/src/screens/eventos/estadisticas/estadisticas.dart';
import 'package:lotto_music/src/widgets/botones.dart';
import 'package:lotto_music/src/widgets/text.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../bloc/stadistics/estadisticas_bloc.dart';
import '../../../bloc/video_event/video_event_bloc.dart';
import '../../../cores/compositor.dart';
import '../../../helpers/rutinas.dart';
import '../../../helpers/variables_globales.dart';
import '../../../models/cartera.dart';
import '../../../models/stadistics_model.dart';
import 'appbar.dart';

class VideoEvento extends StatefulWidget {
  static const routeName = 'videocategorias';

  const VideoEvento({Key? key}) : super(key: key);

  @override
  State<VideoEvento> createState() => _VideoEventoState();
}

class _VideoEventoState extends State<VideoEvento> {
  YoutubePlayerController controller = YoutubePlayerController(
    initialVideoId: "dO1rMeYnOmM",
    flags: const YoutubePlayerFlags(),
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoEventBloc, VideoEventState>(
      builder: (context, state) {
        controller = YoutubePlayerController(
          initialVideoId: state.eventoVideo.videoId ?? "dO1rMeYnOmM",
          flags: const YoutubePlayerFlags(
            hideThumbnail: true,
            mute: false,
            autoPlay: true,
            disableDragSeek: false,
            loop: false,
            isLive: false,
            forceHD: false,
            enableCaption: true,
          ),
        );
        return YoutubePlayerBuilder(
          player: YoutubePlayer(
            thumbnail: const SizedBox(),
            controller: controller,
          ),
          builder: (context, player) {
            return Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    const AppbarVideosEvento(),
                    _bodyVideo(player, state),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _bodyVideo(Widget player, VideoEventState state) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            player,
            Align(
              alignment: Alignment.centerLeft,
              child: ListTile(
                title: Textos.tituloMED(
                  texto: state.eventoVideo.titulo ?? "",
                  color: const Color.fromARGB(255, 201, 174, 56),
                ),
                subtitle:
                    Textos.parrafoMAX(texto: state.eventoVideo.artista ?? ""),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: FutureBuilder(
                future: Compositor.onLoadCartera(context: context),
                initialData: null,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  final data = snapshot.data;
                  int cash = 0;
                  if (data.runtimeType == CarteraModel) {
                    cash = snapshot.data.puntos;
                  }
                  return Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Textos.tituloMED(
                      texto: "Tus Puntos = $cash",
                      color: Colors.yellow,
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _EstadisticasYT(
                  videoID: state.eventoVideo.vidid ?? 0,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Textos.parrafoMAX(
                        texto:
                            "Hora ${state.eventoVideo.fechahoraevento.toString().substring(11, 16)}",
                      ),
                      Textos.parrafoMAX(
                        texto: Rutinas.comprobador(
                          state.eventoVideo.fechahoraevento,
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
                          controller.pause();
                          Navigator.of(context).pushNamed(Adivina.routeName);
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
                          controller.pause();
                          await Navigator.of(context)
                              .pushNamed(Estadisticas.routeName);
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
      ),
    );
  }
}

/////////////////////////////////////////////
///
///
///
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

/////////////////////////////////////////////
///
///
///
///Estadisticas

class _EstadisticasYT extends StatelessWidget {
  final int videoID;

  const _EstadisticasYT({Key? key, required this.videoID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EstadisticasBloc, EstadisticasState>(
      builder: (context, state) {
        StadisticModel st = StadisticModel();
        state.allStadistics?.stadisticModel?.forEach(((element) {
          if (element.id == videoID) {
            st = element;
          }
        }));
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Textos.parrafoMAX(
              texto:
                  "Vistas: ${(st.viewCount?.toString() ?? "").replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}",
            ),
            Textos.parrafoMAX(
              texto:
                  "Me gusta: ${(st.likeCount?.toString() ?? "").replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}",
            ),
            Textos.parrafoMAX(
              texto:
                  "Comentarios: ${(st.commentsCount?.toString() ?? "").replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}",
            ),
          ],
        );
      },
    );
  }
}
