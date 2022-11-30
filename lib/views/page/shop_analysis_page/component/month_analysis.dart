import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class MonthAnalysis extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MonthAnalysis({Key? key}) : super(key: key);

  @override
  _MonthAnalysisState createState() => _MonthAnalysisState();
}

class _MonthAnalysisState extends State<MonthAnalysis> {
  List<_SalesData> data = [
    _SalesData('1 Week', 150),
    _SalesData('2 Week', 180),
    _SalesData('3 Week', 160),
    _SalesData('4 Week', 240),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Initialize the chart widget
        SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          // Chart title
          title: ChartTitle(
            text: '월간 예약수(차트)',
          ),
          // Enable tooltip
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ChartSeries<_SalesData, String>>[
            LineSeries<_SalesData, String>(
                dataSource: data,
                xValueMapper: (_SalesData sales, _) => sales.week,
                yValueMapper: (_SalesData sales, _) => sales.sales,
                name: 'Sales',
                // Enable data label
                dataLabelSettings: DataLabelSettings(isVisible: true))
          ],
        ),
        Expanded(
          child: ListView(children: <Widget>[
            Center(
                child: Text(
              '월간 예약수(도표)',
              style: TextStyle(
                fontSize: 18,
              ),
            )),
            DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'week',
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
                      DataCell(Text('${data[i].week}')),
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
  _SalesData(this.week, this.sales);

  final String week;
  final double sales;
}
