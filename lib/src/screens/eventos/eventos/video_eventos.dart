import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotto_music/src/screens/acount/login.dart';

import '../../../bloc/acount/acount_bloc.dart';
import '../../../bloc/videos_event/videos_event_bloc.dart';
import '../../../cores/orquestador/orquestador.dart';
import '../../../helpers/globals/screen_size.dart';
import '../../../helpers/rutinas.dart';
import '../../../models/video/evento_video.dart';
import '../../../widgets/botones.dart';
import '../../../widgets/digital_clock.dart';
import '../../../widgets/svg_nosignal.dart';
import '../../../widgets/text.dart';
import '../../utils/clock.dart';
import '../../utils/historial_eventos.dart';
import '../../utils/winner.dart';
import '../video/video_evento.dart';

class VideosEventos extends StatelessWidget {
  const VideosEventos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: Medidas.size.height * .07,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: lessbar(context),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Expanded(
          child: ListVideosPaginacion(),
        ),
      ],
    );
  }

  List<Widget> lessbar(BuildContext context) {
    return [
      SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            width: Medidas.size.width * .2,
            child: Botones.degradedButton(
              body: const Icon(Icons.history),
              colors: const [Color(0xffFFBBBB), Color(0xffA9F1DF)],
              onTap: () {
                if (BlocProvider.of<AcountBloc>(context).state.isLogin ==
                    false) {
                  Navigator.of(context).pushNamed(Login.routeName);
                } else {
                  Navigator.of(context).pushNamed(HistorialEventos.routeName);
                }
              },
            ),
          ),
        ),
      ),
      SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            width: Medidas.size.width * .4,
            child: Botones.degradedButton(
                body: FutureBuilder<DateTime>(
                  initialData: null,
                  future: Orquestador.utils.horaServidor(),
                  builder: (c, snap) {
                    if (snap.data == null) {
                      return Textos.tituloMED(
                          texto: "-- -- : -- --", color: Colors.black);
                    }
                    return const DefaultDigitalClock();
                  },
                ),
                colors: const [Color(0xffA9F1DF), Color(0xffA9F1DF)],
                onTap: () {
                  Navigator.of(context).pushNamed(Clock.routeName);
                }),
          ),
        ),
      ),
      SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            width: Medidas.size.width * .2,
            child: Botones.degradedButton(
                body: const Icon(Icons.analytics),
                colors: const [Color(0xffA9F1DF), Color(0xffFFBBBB)],
                onTap: () {
                  if (BlocProvider.of<AcountBloc>(context).state.isLogin ==
                      false) {
                    Navigator.of(context).pushNamed(Login.routeName);
                  } else {
                    Navigator.of(context).pushNamed(Winner.routeName);
                  }
                }),
          ),
        ),
      ),
    ];
  }
}

class ListVideosPaginacion extends StatefulWidget {
  const ListVideosPaginacion({Key? key}) : super(key: key);

  @override
  State<ListVideosPaginacion> createState() => _ListVideosPaginacionState();
}

class _ListVideosPaginacionState extends State<ListVideosPaginacion> {
  final ScrollController controller = ScrollController();
  bool isLoad = false;
  @override
  void initState() {
    super.initState();
    controller.addListener(() async {
      final vEB = BlocProvider.of<VideosEventBloc>(context);
      if (controller.position.pixels >
          controller.position.maxScrollExtent * .8) {
        if (vEB.state.pag > vEB.state.pags) {
          return;
        }
        if (!isLoad) {
          isLoad = true;
          await Orquestador.video.onLoadVideosEventos(context: context);
          isLoad = false;
        }
      }
    });
    if (BlocProvider.of<VideosEventBloc>(context).state.listado == null) {
      Orquestador.video.onLoadInitVideosEventos(context);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideosEventBloc, VideosEventState>(
      builder: (context, state) {
        if (state.listado == null) {
          return RefreshIndicator(
            onRefresh: () async {
              Orquestador.video.onLoadInitVideosEventos(context);
            },
            child: const NoSignal(),
          );
        }
        return RefreshIndicator(
            onRefresh: () async {
              Orquestador.video.onLoadInitVideosEventos(context);
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
                  return FadeInLeft(
                      delay: Duration(
                        milliseconds: (100 * i) > 500 ? 500 : 100 * i,
                      ),
                      child: bodyTarjeta(state.listado![i]));
                }));
      },
    );
  }

  Widget bodyTarjeta(ItemEvent v) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
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
                  v.thumblary ?? "",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              SizedBox(
                height: Medidas.size.width * .240,
                width: Medidas.size.width * .55,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Textos.parrafoMED(texto: v.titulo ?? "", renglones: 2),
                    Textos.parrafoMIN(texto: v.artista ?? "", renglones: 1),
                    const Expanded(child: SizedBox()),
                    Textos.parrafoMED(
                      texto:
                          "Hora ${v.fechahoraevento.toString().substring(11, 16)}",
                    ),
                    Textos.parrafoMED(
                      texto: Rutinas.comprobador(v.fechahoraevento),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        onTap: () {
          if (BlocProvider.of<AcountBloc>(context).state.isLogin == false) {
            Navigator.of(context).pushNamed(Login.routeName);
          } else {
            Orquestador.video.onSlectVideoEvento(
              context: context,
              item: v,
            );
            Navigator.of(context).pushNamed(VideoEvento.routeName);
          }
        },
      ),
    );
  }
}
