import 'package:flutter/material.dart';
import 'package:lotto_music/src/widgets/text.dart';

import '../helpers/variables_globales.dart';
import '../models/videos.dart';
import '../screens/videos/video.dart';

class ListVideos extends StatefulWidget {
  final Future<List<VideoModel>> Function() loadVideos;
  const ListVideos({
    Key? key,
    required this.loadVideos,
  }) : super(key: key);

  @override
  State<ListVideos> createState() => _ListVideosState();
}

class _ListVideosState extends State<ListVideos> {
  List<VideoModel> videos = [];
  @override
  void initState() {
    widget.loadVideos().then((videos) {
      this.videos = videos;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        videos = await widget.loadVideos();
        setState(() {});
      },
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: iterable(context),
        ),
      ),
    );
  }

  List<Widget> iterable(BuildContext context) {
    List<Widget> a = [];
    for (var v in videos) {
      a.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: Medidas.size.width * .240,
          child: GestureDetector(
            child: bodyTarjeta(v),
            onTap: () {
              Navigator.pushNamed(context, Video.routeName);
            },
          ),
        ),
      ));
    }
    return a;
  }

  Widget bodyTarjeta(VideoModel v) {
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
            child: Image.network(
              v.thumblary ?? "",
              fit: BoxFit.cover,
            ),
          ),
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
                Textos.tituloMIN(texto: v.titulo ?? "", renglones: 2),
                Textos.parrafoMED(texto: v.artista ?? "", renglones: 1),
              ],
            ),
          )
        ],
      ),
    );
  }
}
