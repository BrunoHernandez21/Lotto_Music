import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotto_music/src/bloc/videos_categoria/videos_categoria_bloc.dart';
import 'package:lotto_music/src/cores/compositor.dart';
import 'package:lotto_music/src/screens/eventos/video/video_evento.dart';

import '../../helpers/variables_globales.dart';
import '../../models/evento_video.dart';
import '../../widgets/svg_nosignal.dart';
import '../../widgets/text.dart';
import 'appbar.dart';

class VideosCategoria extends StatelessWidget {
  static const routeName = "videoscategoria";
  const VideosCategoria({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            AppbarEventos(),
            Expanded(
              child: _ListVideosPaginacion(),
            ),
          ],
        ),
      ),
    );
  }
}

class _ListVideosPaginacion extends StatefulWidget {
  const _ListVideosPaginacion({Key? key}) : super(key: key);

  @override
  State<_ListVideosPaginacion> createState() => _ListVideosPaginacionState();
}

class _ListVideosPaginacionState extends State<_ListVideosPaginacion> {
  final ScrollController controller = ScrollController();
  bool isLoad = false;
  @override
  void initState() {
    super.initState();
    controller.addListener(() async {
      final vEB = BlocProvider.of<VideosCategoriaBloc>(context);
      if (controller.position.pixels >
          controller.position.maxScrollExtent * .8) {
        if (vEB.state.pag > vEB.state.pags) {
          return;
        }
        if (!isLoad) {
          isLoad = true;
          await Compositor.onLoadCategorias(context: context);
          isLoad = false;
        }
      }
    });
    if (BlocProvider.of<VideosCategoriaBloc>(context).state.listado == null) {
      Compositor.onLoadInitVideosCategoria(context);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideosCategoriaBloc, VideosCategoriaState>(
      builder: (context, state) {
        if (state.listado == null) {
          return RefreshIndicator(
            onRefresh: () async {
              Compositor.onLoadInitVideosCategoria(context);
            },
            child: const NoSignal(),
          );
        }
        return RefreshIndicator(
            onRefresh: () async {
              Compositor.onLoadCategorias(
                context: context,
              );
            },
            child: ListView.separated(
                controller: controller,
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: state.listado?.length ?? 0,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemBuilder: (context, i) {
                  return bodyTarjeta(state.listado![i]);
                }));
      },
    );
  }

  Widget bodyTarjeta(Item v) {
    return GestureDetector(
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
              child: Image.network(
                v.video.thumblary ?? "",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            SizedBox(
              height: Medidas.size.width * .240,
              width: Medidas.size.width * .6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Textos.parrafoMED(texto: v.video.titulo ?? "", renglones: 2),
                  Textos.parrafoMIN(texto: v.video.artista ?? "", renglones: 1),
                  const Expanded(child: SizedBox()),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Textos.parrafoMED(
                          texto: v.evento.fechahoraapuesta
                              .toString()
                              .substring(11, 16))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      onTap: () {
        Compositor.onSlectVideoEvento(
          context: context,
          item: v,
        );
        Navigator.of(context).pushNamed(VideoEvento.routeName);
      },
    );
  }
}
