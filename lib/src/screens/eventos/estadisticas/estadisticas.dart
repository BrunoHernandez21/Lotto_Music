import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotto_music/src/widgets/text.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../bloc/stadistics/estadisticas_bloc.dart';
import '../../../bloc/video_event/video_event_bloc.dart';
import '../../../models/stadistics_model.dart';

class Estadisticas extends StatelessWidget {
  static const String routeName = "estadisticas";
  const Estadisticas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Textos.tituloMED(
          texto: "Estadisticas",
        ),
      ),
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
              return bodyEstadisticas(
                view,
                coments,
                like,
                shared,
                save,
                date,
                estadisticas,
              );
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
    List<StadisticModel> estadisticas,
  ) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            scrollDirection: Axis.horizontal,
            child: Table(
              defaultColumnWidth: const FixedColumnWidth(110.0),
              children: [
                TableRow(children: [
                  Container(
                    color: const Color.fromARGB(255, 10, 100, 110),
                    alignment: Alignment.center,
                    child: Textos.tituloMIN(
                      texto: "Hora",
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    color: const Color.fromARGB(255, 10, 100, 110),
                    alignment: Alignment.center,
                    child: Textos.tituloMIN(
                      texto: "Vistas",
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    color: const Color.fromARGB(255, 10, 100, 110),
                    alignment: Alignment.center,
                    child: Textos.tituloMIN(
                      texto: "Comentarios",
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    color: const Color.fromARGB(255, 10, 100, 110),
                    alignment: Alignment.center,
                    child: Textos.tituloMIN(
                      texto: "Like",
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    color: const Color.fromARGB(255, 10, 100, 110),
                    alignment: Alignment.center,
                    child: Textos.tituloMIN(
                      texto: "Compartido",
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    color: const Color.fromARGB(255, 10, 100, 110),
                    alignment: Alignment.center,
                    child: Textos.tituloMIN(
                      texto: "Guardado",
                      color: Colors.white,
                    ),
                  ),
                ]),
                ...iterable(estadisticas)
              ],
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                GraficaLinear(
                  items: view,
                  date: time,
                  title: "Vistas",
                ),
                const SizedBox(
                  width: 30,
                ),
                GraficaLinear(
                  items: coments,
                  date: time,
                  title: "Comentarios",
                ),
                const SizedBox(
                  width: 30,
                ),
                GraficaLinear(
                  items: like,
                  date: time,
                  title: "Like",
                ),
                const SizedBox(
                  width: 30,
                ),
                GraficaLinear(
                  items: shared,
                  date: time,
                  title: "compartido",
                ),
                const SizedBox(
                  width: 30,
                ),
                GraficaLinear(
                  items: save,
                  date: time,
                  title: "Guardado",
                ),
                const SizedBox(
                  width: 30,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }

  List<TableRow> iterable(List<StadisticModel> estadisticas) {
    final List<TableRow> lista = [];
    for (var el in estadisticas) {
      lista.add(
        TableRow(children: [
          Container(
            color: const Color.fromARGB(255, 51, 11, 97),
            alignment: Alignment.center,
            child: Textos.parrafoMAX(
              color: Colors.white,
              texto: el.fecha.toString().substring(10, 16),
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 21, 95, 52),
            alignment: Alignment.center,
            child: Textos.parrafoMAX(
              color: Colors.white,
              texto: el.viewCount.toString(),
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 21, 95, 52),
            alignment: Alignment.center,
            child: Textos.parrafoMAX(
              color: Colors.white,
              texto: el.commentsCount.toString(),
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 21, 95, 52),
            alignment: Alignment.center,
            child: Textos.parrafoMAX(
              color: Colors.white,
              texto: el.likeCount.toString(),
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 21, 95, 52),
            alignment: Alignment.center,
            child: Textos.parrafoMAX(
              color: Colors.white,
              texto: el.sharedCount.toString(),
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 21, 95, 52),
            alignment: Alignment.center,
            child: Textos.parrafoMAX(
              color: Colors.white,
              texto: el.savedCount.toString(),
            ),
          ),
        ]),
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
      data.add(_Data(date[i]?.toString().substring(10, 16) ?? "00:00",
          items[i].toDouble()));
    }

    return SizedBox(
      width: 400,
      height: 400,
      child: SfCartesianChart(
          enableMultiSelection: true,
          enableAxisAnimation: true,
          title: ChartTitle(text: title),

          // Initialize category axis
          primaryXAxis: CategoryAxis(
              title: AxisTitle(
            text: "Tiempo",
          )),
          primaryYAxis: NumericAxis(
              title: AxisTitle(
            text: title,
          )),
          series: <LineSeries<_Data, String>>[
            LineSeries<_Data, String>(
              enableTooltip: true,
              animationDelay: 150,
              dataSource: data,
              xValueMapper: (_Data sales, _) => sales.time,
              yValueMapper: (_Data sales, _) => sales.value,
              width: 2,
              markerSettings: const MarkerSettings(
                  isVisible: true,
                  height: 5,
                  width: 5,
                  shape: DataMarkerType.circle,
                  borderWidth: 3,
                  borderColor: Colors.orange),
              dataLabelSettings: const DataLabelSettings(
                isVisible: true,
                labelAlignment: ChartDataLabelAlignment.auto,
              ),
              animationDuration: 2000,
              isVisible: true,
              color: Colors.blue,
              isVisibleInLegend: true,
            ),
          ]),
    );
  }
}

class _Data {
  _Data(
    this.time,
    this.value,
  );

  final String time;
  final double value;
}
