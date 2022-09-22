import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lotto_music/src/widgets/inputs_text.dart';

import '../../../../cores/orquestador/orquestador.dart';
import '../../../../helpers/globals/assets.dart';
import '../../../../helpers/globals/screen_size.dart';
import '../../../../models/youtube/youtube.dart';
import '../../../../widgets/text.dart';
import '../video/video.dart';
import 'appbar.dart';

class SearchVideosYT extends StatefulWidget {
  static const routeName = 'searchVideosYT';
  const SearchVideosYT({Key? key}) : super(key: key);

  @override
  State<SearchVideosYT> createState() => _SearchVideosYTState();
}

class _SearchVideosYTState extends State<SearchVideosYT> {
  List<ItemYT>? iterable;
  final controller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppbarSearchYT(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60,
                  width: Medidas.size.width * .8,
                  child: InputsText.classic(
                    controller: controller,
                    onChanged: (query) {},
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () async {
                    iterable = await Orquestador.youtube.onSearchYT(
                      context: context,
                      busqueda: controller.text,
                    );
                    setState(() {});
                  },
                )
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: _BodySearch(
                  iterable: iterable,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _BodySearch extends StatelessWidget {
  final List<ItemYT>? iterable;
  const _BodySearch({
    Key? key,
    required this.iterable,
  }) : super(key: key);

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
              // ignore: use_build_context_synchronously
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
