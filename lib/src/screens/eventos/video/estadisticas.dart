import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotto_music/src/widgets/text.dart';

import '../../../bloc/stadistics/estadisticas_bloc.dart';
import '../../../bloc/ve_page_controller/videos_event_controller_bloc.dart';
import '../../../bloc/video_event/video_event_bloc.dart';
import '../../../models/stadistics_model.dart';
import 'internal_widget.dart';

class Estadisticas extends StatelessWidget {
  const Estadisticas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: BlocBuilder<VideoEventBloc, VideoEventState>(
        builder: (context, stEvent) {
          return BlocBuilder<EstadisticasBloc, EstadisticasState>(
            builder: (context, stEst) {
              final List<int> view = [];
              final List<int> like = [];
              final List<int> coments = [];
              final List<int> shared = [];
              final List<int> save = [];
              final List<DateTime?> date = [];
              List<StadisticModel> estadisticas = [];
              stEst.allStadistics?.stadisticModel?.forEach(((element) {
                if (element.videoId == stEvent.eventoVideo.vidid) {
                  view.add(element.viewCount ?? 0);
                  like.add(element.likeCount ?? 0);
                  coments.add(element.commentsCount ?? 0);
                  shared.add(element.sharedCount ?? 0);
                  save.add(element.savedCount ?? 0);
                  date.add(element.fecha);
                  estadisticas.add(element);
                }
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
                          onPressed: () {
                            BlocProvider.of<VEPageControllerBloc>(context).add(
                              OnSelectPapge(page: 1),
                            );
                          },
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
