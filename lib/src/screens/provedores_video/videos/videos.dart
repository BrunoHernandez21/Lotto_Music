import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lotto_music/src/cores/compositor.dart';
import 'package:lotto_music/src/widgets/text.dart';

import '../../../bloc/videos/videos_bloc.dart';
import '../../../helpers/variables_globales.dart';
import '../../../models/youtube.dart';
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
    if (BlocProvider.of<VideosBloc>(context).state.yt == null) {
      Compositor.onLoadPrincipalYT(context: context);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideosBloc, VideosState>(
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () async {
            Compositor.onLoadPrincipalYT(context: context);
            setState(() {});
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: iterable(context, state.yt?.itemsyt),
            ),
          ),
        );
      },
    );
  }

  List<Widget> iterable(BuildContext context, List<ItemYT>? items) {
    List<Widget> a = [];
    if (items != null) {
      for (var v in items) {
        a.add(Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: Medidas.size.width * .240,
            child: GestureDetector(
              child: bodyTarjeta(v),
              onTap: () {
                Compositor.onSelectYT(context: context, item: v);
                Navigator.pushNamed(context, Video.routeName);
              },
            ),
          ),
        ));
      }
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
                Textos.tituloMIN(texto: v.snippet?.title ?? "", renglones: 2),
                Textos.parrafoMED(
                    texto: v.snippet?.channelTitle ?? "", renglones: 1),
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
