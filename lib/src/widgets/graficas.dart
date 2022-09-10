import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
