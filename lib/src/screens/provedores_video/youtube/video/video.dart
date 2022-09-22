import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lotto_music/src/widgets/text.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../bloc/youtube_video/video_bloc.dart';
import '../../../../cores/orquestador/orquestador.dart';
import '../../../../helpers/globals/assets.dart';
import '../../../../helpers/globals/screen_size.dart';
import '../../../../models/youtube/youtube.dart';
import 'appbar.dart';

class Video extends StatefulWidget {
  static const routeName = 'videoYT';

  const Video({Key? key}) : super(key: key);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<YTVideoBloc, YTVideoState>(
      builder: (context, state) {
        final controller = YoutubePlayerController(
          initialVideoId: state.eventoVideo?.id?.videoId ?? "dO1rMeYnOmM",
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
            thumbnail: Container(),
            controller: controller,
          ),
          builder: (context, player) {
            return _bodyWidget(player, state);
          },
        );
      },
    );
  }

  Scaffold _bodyWidget(Widget player, YTVideoState state) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppbarVideosYT(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    player,
                    Align(
                        alignment: Alignment.centerLeft,
                        child: ListTile(
                          title: Textos.tituloMIN(
                            texto: state.eventoVideo?.snippet?.title ?? "",
                            color: Colors.black,
                          ),
                          subtitle: Textos.parrafoMED(
                            texto:
                                state.eventoVideo?.snippet?.channelTitle ?? "",
                          ),
                        )),
                    _ListaVideosYT(
                      videID: state.eventoVideo?.id?.videoId,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ListaVideosYT extends StatefulWidget {
  final String? videID;
  const _ListaVideosYT({Key? key, required this.videID}) : super(key: key);

  @override
  State<_ListaVideosYT> createState() => __ListaVideosYTState();
}

class __ListaVideosYTState extends State<_ListaVideosYT> {
  List<ItemYT>? iterable;

  @override
  void initState() {
    Orquestador.youtube
        .onLoadRelacionadosYT(context: context, relaionado: widget.videID)
        .then((value) {
      iterable = value;
      if (mounted) {
        setState(() {});
      }
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
    final List<ItemYT> items = iterable ?? [];

    for (var v in items) {
      a.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: Medidas.size.width * .240,
          child: GestureDetector(
            child: bodyTarjeta(v),
            onTap: () async {
              await Orquestador.youtube.onSelectYT(context: context, item: v);
              if (!mounted) {
                return;
              }
              Navigator.popAndPushNamed(context, Video.routeName);
            },
          ),
        ),
      ));
    }

    return a;
  }

  Widget bodyTarjeta(ItemYT v) {
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
              child: imagen(v.snippet?.thumbnails?.thumbnailsDefault?.url)),
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
                  texto: v.snippet?.title ?? "",
                  renglones: 2,
                ),
                Textos.parrafoMIN(
                  texto: v.snippet?.channelTitle ?? "",
                  renglones: 1,
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
