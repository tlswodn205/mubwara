import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class WeekAnalysis extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  WeekAnalysis({Key? key}) : super(key: key);

  @override
  _WeekAnalysisState createState() => _WeekAnalysisState();
}

class _WeekAnalysisState extends State<WeekAnalysis> {
  List<_SalesData> data = [
    _SalesData('Sun', 35),
    _SalesData('Mon', 28),
    _SalesData('Thus', 34),
    _SalesData('Wed', 32),
    _SalesData('Thur', 40),
    _SalesData('Fri', 30),
    _SalesData('Sat', 0),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Initialize the chart widget
        SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          // Chart title
          title: ChartTitle(text: '주간 예약수(차트)'),
          // Enable legend
          legend: Legend(isVisible: true),
          // Enable tooltip
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ChartSeries<_SalesData, String>>[
            LineSeries<_SalesData, String>(
                dataSource: data,
                xValueMapper: (_SalesData sales, _) => sales.date,
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
              '주간 예약수(도표)',
              style: TextStyle(
                fontSize: 18,
              ),
            )),
            DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'date',
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
                      DataCell(Text('${data[i].date}')),
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
  _SalesData(this.date, this.sales);

  final String date;
  final double sales;
}
