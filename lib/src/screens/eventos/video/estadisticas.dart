import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotto_music/src/widgets/text.dart';

import '../../../bloc/stadistics/estadisticas_bloc.dart';
import '../../../bloc/video_event/video_event_bloc.dart';
import '../../../models/video/stadistics_model.dart';
import 'internal_widget.dart';

class Estadisticas extends StatelessWidget {
  final void Function() onBack;
  const Estadisticas({
    Key? key,
    required this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: BlocBuilder<VideoEventBloc, VideoEventState>(
        builder: (context, stEvent) {
          return BlocBuilder<EstadisticasBloc, EstadisticasState>(
            builder: (context, stEst) {
              final List<StadisticModel> estadisticas = [];
              stEst.allStadistics?.stadisticModel?.forEach(
                ((element) {
                  if (element.videoId == stEvent.eventoVideo.vidId) {
                    estadisticas.add(element);
                  }
                }),
              );
              estadisticas.sort(
                (a, b) {
                  return (a.fecha ?? DateTime(2000))
                      .compareTo(b.fecha ?? DateTime(2000));
                },
              );
              final List<int> view = [];
              final List<int> like = [];
              final List<int> coments = [];
              final List<int> shared = [];
              final List<int> save = [];
              final List<DateTime?> date = [];
              estadisticas.forEach(((st) {
                view.add(st.viewCount ?? 0);
                like.add(st.likeCount ?? 0);
                coments.add(st.commentsCount ?? 0);
                shared.add(st.sharedCount ?? 0);
                save.add(st.savedCount ?? 0);
                date.add(st.fecha);
              }));
              return Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new),
                          onPressed: onBack,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Textos.tituloMAX(texto: "Estadisticas"),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Textos.tituloMAX(texto: "Tablas"),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    scrollDirection: Axis.horizontal,
                    child: TableStadistics(
                      estadisticas: estadisticas,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Textos.tituloMAX(texto: "Graficas"),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    child: ListOfChart(
                      coments: coments,
                      like: like,
                      save: save,
                      shared: shared,
                      time: date,
                      view: view,
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
