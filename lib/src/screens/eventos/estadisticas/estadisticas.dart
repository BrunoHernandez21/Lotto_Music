import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotto_music/src/widgets/text.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../bloc/stadistics/estadisticas_bloc.dart';
import '../../../bloc/video_event/video_event_bloc.dart';

class Estadisticas extends StatelessWidget {
  static const String routeName = "estadisticas";
  const Estadisticas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<VideoEventBloc, VideoEventState>(
        builder: (context, stEvent) {
          return BlocBuilder<EstadisticasBloc, EstadisticasState>(
            builder: (context, stEst) {
              final List<int> view = [];
              final List<int> like = [];
              final List<int> coments = [];
              final List<int> shared = [];
              final List<int> save = [];
              final List<DateTime?> date = [];
              stEst.allStadistics?.stadisticModel?.forEach(((element) {
                if (element.videoId == stEvent.eventoVideo.vid_id) {
                  view.add(element.viewCount ?? 0);
                  like.add(element.likeCount ?? 0);
                  coments.add(element.commentsCount ?? 0);
                  shared.add(element.sharedCount ?? 0);
                  save.add(element.savedCount ?? 0);
                  date.add(element.fecha);
                }
              }));
              return bodyEstadisticas(view, coments, like, shared, save, date);
            },
          );
        },
      ),
    );
  }

  SingleChildScrollView bodyEstadisticas(
    List<int> view,
    List<int> coments,
    List<int> like,
    List<int> shared,
    List<int> save,
    List<DateTime?> time,
  ) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Textos.tituloMIN(texto: "Vistas"),
                    ...iterable(view)
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Textos.tituloMIN(texto: "Comentarios"),
                    ...iterable(coments)
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Textos.tituloMIN(texto: "Like"),
                    ...iterable(like)
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Textos.tituloMIN(texto: "Compartido"),
                    ...iterable(shared)
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Textos.tituloMIN(texto: "Guardado"),
                    ...iterable(save)
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
          GraficaLinear(
            items: view,
            date: time,
            title: "Vistas",
          ),
          GraficaLinear(
            items: coments,
            date: time,
            title: "Comentarios",
          ),
          GraficaLinear(
            items: like,
            date: time,
            title: "Like",
          ),
          GraficaLinear(
            items: shared,
            date: time,
            title: "compartido",
          ),
          GraficaLinear(
            items: save,
            date: time,
            title: "Guardado",
          ),
        ],
      ),
    );
  }

  List<Widget> iterable(List<int> iterable) {
    final List<Widget> lista = [];
    for (var element in iterable) {
      lista.add(
        Textos.parrafoMAX(texto: element.toString()),
      );
      lista.add(
        const SizedBox(
          height: 10,
        ),
      );
    }
    return lista;
  }
}

class GraficaLinear extends StatelessWidget {
  final List<int> items;
  final List<DateTime?> date;
  final String title;
  const GraficaLinear({
    Key? key,
    required this.items,
    required this.title,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<_Data> data = [];
    for (int i = 0; i < items.length; i++) {
      data.add(
          _Data((date[i]?.second.toString() ?? "null"), items[i].toDouble()));
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Textos.tituloMED(texto: title),
        SfCartesianChart(
            // Initialize category axis
            primaryXAxis: CategoryAxis(),
            series: <LineSeries<_Data, String>>[
              LineSeries<_Data, String>(
                  // Bind data source
                  dataSource: data,
                  xValueMapper: (_Data sales, _) => sales.time,
                  yValueMapper: (_Data sales, _) => sales.value)
            ])
      ],
    );
  }
}

class _Data {
  _Data(this.time, this.value);

  final String time;
  final double value;
}
