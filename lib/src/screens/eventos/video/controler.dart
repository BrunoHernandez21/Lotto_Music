import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../bloc/ve_page_controller/videos_event_controller_bloc.dart';
import '../../../models/evento_video.dart';
import 'adivina.dart';
import 'estadisticas.dart';
import 'iterable_video.dart';

class BodyController extends StatefulWidget {
  final ItemEvent eventoVideo;
  final YoutubePlayerController controller;
  const BodyController(
      {Key? key, required this.eventoVideo, required this.controller})
      : super(key: key);

  @override
  State<BodyController> createState() => _BodyControllerState();
}

class _BodyControllerState extends State<BodyController> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VEPageControllerBloc, VEPageControllerState>(
      builder: (context, pstate) {
        if (pstate.page == 2) {
          return const Adivina();
        }
        if (pstate.page == 3) {
          return const Estadisticas();
        }
        return IterableVideo(
          controller: widget.controller,
          eventoVideo: widget.eventoVideo,
        );
      },
    );
  }
}
