import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class DayAnalysis extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  DayAnalysis({Key? key}) : super(key: key);

  @override
  _DayAnalysisState createState() => _DayAnalysisState();
}

class _DayAnalysisState extends State<DayAnalysis> {
  List<_SalesData> data = [
    _SalesData('11:00', 35),
    _SalesData('12:00', 28),
    _SalesData('13:00', 34),
    _SalesData('14:00', 32),
    _SalesData('15:00', 40),
    _SalesData('16:00', 30),
    _SalesData('17:00', 45),
    _SalesData('18:00', 35),
    _SalesData('19:00', 20),
    _SalesData('20:00', 31),
    _SalesData('21:00', 36),
    _SalesData('22:00', 36),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Initialize the chart widget
        SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            // Chart title
            title: ChartTitle(text: '일일 예약수(차트)'),
            // Enable tooltip
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries<_SalesData, String>>[
              LineSeries<_SalesData, String>(
                  dataSource: data,
                  xValueMapper: (_SalesData sales, _) => sales.hour,
                  yValueMapper: (_SalesData sales, _) => sales.sales,
                  name: 'Sales',
                  // Enable data label
                  dataLabelSettings: DataLabelSettings(isVisible: true))
            ]),
        SizedBox(height: 20),
        Expanded(
          child: ListView(children: <Widget>[
            Center(
                child: Text(
                  '일일 예약수(도표)',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )),
            DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'hour',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Sale',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ],
              rows: <DataRow>[
                for (int i = 0; i < data.length; i++)
                  (DataRow(
                    cells: <DataCell>[
                      DataCell(Text('${data[i].hour}')),
                      DataCell(Text('${data[i].sales}')),
                    ],
                  )),
              ],
            )
          ]),
        ),
      ],
    );
  }
}

class _SalesData {
  _SalesData(this.hour, this.sales);

  final String hour;
  final double sales;
}