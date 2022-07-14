import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lotto_music/src/models/evento_video.dart';
import 'package:lotto_music/src/screens/eventos/adivina/adivina.dart';
import 'package:lotto_music/src/widgets/botones.dart';
import 'package:lotto_music/src/widgets/text.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../bloc/video_event/video_event_bloc.dart';
import '../../../cores/compositor.dart';
import '../../../helpers/rutinas.dart';
import '../../../helpers/variables_globales.dart';
import 'appbar.dart';

class VideoEvento extends StatefulWidget {
  static const routeName = 'videocategorias';

  const VideoEvento({Key? key}) : super(key: key);

  @override
  State<VideoEvento> createState() => _VideoEventoState();
}

class _VideoEventoState extends State<VideoEvento> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoEventBloc, VideoEventState>(
      builder: (context, state) {
        final _controller = YoutubePlayerController(
          initialVideoId: state.eventoVideo.video.idVideo ?? "dO1rMeYnOmM",
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
            controller: _controller,
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
                    texto: state.eventoVideo.video.titulo ?? "",
                    color: const Color.fromARGB(255, 201, 174, 56),
                  ),
                  subtitle: Textos.parrafoMAX(
                      texto: state.eventoVideo.video.artista ?? ""),
                )),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Textos.parrafoMAX(
                    texto: "Hora " +
                        state.eventoVideo.evento.fechahoraapuesta
                            .toString()
                            .substring(11, 16),
                  ),
                  Textos.parrafoMAX(
                    texto: comprobador(
                      state.eventoVideo.evento.fechahoraapuesta,
                    ),
                  ),
                ],
              ),
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
                        onTap: () {
                          Navigator.of(context).pushNamed(Adivina.routeName);
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
              child: imagen(v.video.thumblary)),
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
                  texto: v.video.titulo ?? "",
                  renglones: 2,
                ),
                Textos.parrafoMIN(
                  texto: v.video.artista ?? "",
                  renglones: 1,
                ),
                const Expanded(child: SizedBox()),
                Textos.parrafoMED(
                  texto: "Hora " +
                      v.evento.fechahoraapuesta.toString().substring(11, 16),
                ),
                Textos.parrafoMED(
                  texto: comprobador(v.evento.fechahoraapuesta),
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
          Assets.svgvideo,
          fit: BoxFit.cover,
        );
      },
      fit: BoxFit.cover,
    );
  }
}
