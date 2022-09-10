import 'package:flutter/material.dart';

import '../../../models/stadistics_model.dart';
import '../../../widgets/graficas.dart';
import '../../../widgets/text.dart';

////////////////////////////
class ListOfChart extends StatelessWidget {
  final List<int> view;
  final List<int> like;
  final List<int> coments;
  final List<int> shared;
  final List<int> save;
  final List<DateTime?> time;
  const ListOfChart({
    Key? key,
    required this.view,
    required this.like,
    required this.coments,
    required this.shared,
    required this.save,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

////////////////////////////
class TableStadistics extends StatelessWidget {
  final List<StadisticModel> estadisticas;
  const TableStadistics({
    required this.estadisticas,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FixedColumnWidth(90),
        1: FixedColumnWidth(120),
        2: FixedColumnWidth(140),
        3: FixedColumnWidth(120),
        4: FixedColumnWidth(140),
        5: FixedColumnWidth(120),
      },
      children: [
        TableRow(children: [
          Container(
            color: const Color.fromARGB(255, 10, 100, 110),
            alignment: Alignment.center,
            child: Textos.tituloMIN(
              texto: "Hora",
              color: Colors.white,
              renglones: 1,
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 10, 100, 110),
            alignment: Alignment.center,
            child: Textos.tituloMIN(
              texto: "Vistas",
              color: Colors.white,
              renglones: 1,
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 10, 100, 110),
            alignment: Alignment.center,
            child: Textos.tituloMIN(
              texto: "Comentarios",
              color: Colors.white,
              renglones: 1,
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 10, 100, 110),
            alignment: Alignment.center,
            child: Textos.tituloMIN(
              texto: "Like",
              color: Colors.white,
              renglones: 1,
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 10, 100, 110),
            alignment: Alignment.center,
            child: Textos.tituloMIN(
              texto: "Compartido",
              color: Colors.white,
              renglones: 1,
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 10, 100, 110),
            alignment: Alignment.center,
            child: Textos.tituloMIN(
              texto: "Guardado",
              color: Colors.white,
              renglones: 1,
            ),
          ),
        ]),
        ...iterable(estadisticas)
      ],
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
              renglones: 1,
              texto: el.fecha.toString().substring(10, 16),
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 21, 95, 52),
            alignment: Alignment.center,
            child: Textos.parrafoMAX(
              color: Colors.white,
              renglones: 1,
              texto: el.viewCount.toString(),
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 21, 95, 52),
            alignment: Alignment.center,
            child: Textos.parrafoMAX(
              color: Colors.white,
              renglones: 1,
              texto: el.commentsCount.toString(),
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 21, 95, 52),
            alignment: Alignment.center,
            child: Textos.parrafoMAX(
              color: Colors.white,
              renglones: 1,
              texto: el.likeCount.toString(),
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 21, 95, 52),
            alignment: Alignment.center,
            child: Textos.parrafoMAX(
              color: Colors.white,
              renglones: 1,
              texto: el.sharedCount.toString(),
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 21, 95, 52),
            alignment: Alignment.center,
            child: Textos.parrafoMAX(
              color: Colors.white,
              renglones: 1,
              texto: el.savedCount.toString(),
            ),
          ),
        ]),
      );
    }
    return lista;
  }
}
