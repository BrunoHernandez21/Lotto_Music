import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lotto_music/src/cores/compositor.dart';
import 'package:lotto_music/src/widgets/text.dart';

import '../../../../bloc/youtube/youtube_bloc.dart';
import '../../../../helpers/variables_globales.dart';
import '../../../../models/youtube.dart';
import '../video/video.dart';

class ListVideosYT extends StatefulWidget {
  const ListVideosYT({
    Key? key,
  }) : super(key: key);

  @override
  State<ListVideosYT> createState() => _ListVideosState();
}

class _ListVideosState extends State<ListVideosYT> {
  @override
  void initState() {
    if (BlocProvider.of<YoutubeBloc>(context).state.yt == null) {
      Compositor.onLoadPrincipalYT(context: context);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<YoutubeBloc, YoutubeState>(builder: (context, state) {
      return RefreshIndicator(
        onRefresh: () async {
          Compositor.onLoadPrincipalYT(context: context);
          setState(() {});
        },
        child: ListView.separated(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemCount: state.yt?.itemsyt?.length ?? 0,
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemBuilder: (context, i) {
            return FadeInLeft(
              delay: Duration(milliseconds: (100 * i) > 500 ? 500 : 100 * i),
              child: bodyTarjeta(
                v: state.yt?.itemsyt?[i] ?? ItemYT(),
                context: context,
              ),
            );
          },
        ),
      );
    });
  }

  Widget bodyTarjeta({required BuildContext context, required ItemYT v}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Compositor.onSelectYT(context: context, item: v);
          Navigator.pushNamed(context, Video.routeName);
        },
        child: SizedBox(
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
                    Textos.tituloMIN(
                        texto: v.snippet?.title ?? "", renglones: 2),
                    Textos.parrafoMED(
                        texto: v.snippet?.channelTitle ?? "", renglones: 1),
                  ],
                ),
              )
            ],
          ),
        ),
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
