import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../cores/orquestador/orquestador.dart';
import '../../../models/video/evento_video.dart';
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
  void initState() {
    Orquestador.user.onLoadCartera(context: context);
    super.initState();
  }

  int page = 0;
  @override
  Widget build(BuildContext context) {
    if (page == 2) {
      return Adivina(onBack: () {
        page = 1;
        setState(() {});
      });
    }
    if (page == 3) {
      return Estadisticas(onBack: () {
        page = 1;
        setState(() {});
      });
    }
    return IterableVideo(
      controller: widget.controller,
      eventoVideo: widget.eventoVideo,
      onPage2: () {
        page = 2;
        setState(() {});
      },
      onPage3: () {
        page = 3;
        setState(() {});
      },
    );
  }
}
