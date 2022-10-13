import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotto_music/src/services/websocket/socket.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../bloc/stadistics/estadisticas_bloc.dart';
import '../../../bloc/video_event/video_event_bloc.dart';
import '../../../models/video/stadistics_response.dart';
import 'appbar.dart';
import 'controler.dart';

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
  void initState() {
    final blocSt = BlocProvider.of<EstadisticasBloc>(context);
    SocketService.socket.on('estadisticas', (data) {
      final a = StadisticsResponse.fromMap(data);
      blocSt.add(OnUpdateStadistics(response: a));
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    SocketService.socket.off("estadisticas");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (() async {
        return true;
      }),
      child: BlocBuilder<VideoEventBloc, VideoEventState>(
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
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              const SizedBox(
                                width: double.infinity,
                              ),
                              player,
                              BodyController(
                                controller: controller,
                                eventoVideo: state.eventoVideo,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
