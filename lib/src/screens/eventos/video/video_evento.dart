import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotto_music/src/widgets/text.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../bloc/video_event/video_event_bloc.dart';
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
            thumbnail: Container(),
            controller: _controller,
          ),
          builder: (context, player) {
            return Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    const AppbarVideosEvento(),
                    player,
                    Align(
                        alignment: Alignment.centerLeft,
                        child: ListTile(
                          title: Textos.tituloMIN(
                            texto: state.eventoVideo.video.titulo ?? "",
                            color: Colors.black,
                          ),
                          subtitle: Textos.parrafoMED(
                              texto: state.eventoVideo.video.artista ?? ""),
                        )),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
