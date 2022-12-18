import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/views/page/shop_analysis_page/component/week_analysis_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../../../../dto/response/shop_resp_dto.dart';

class WeekAnalysis extends ConsumerStatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  WeekAnalysis({Key? key}) : super(key: key);

  @override
  _WeekAnalysisState createState() => _WeekAnalysisState();
}

class _WeekAnalysisState extends ConsumerState<WeekAnalysis> {
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
    final wa = ref.read(weekAnalysis);
    return Column(
      children: [
        //Initialize the chart widget
        SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          // Chart title
          title: ChartTitle(text: '주간 예약수(차트)'),
          // Enable tooltip
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ChartSeries<AnalysisWeekRespDto, String>>[
            LineSeries<AnalysisWeekRespDto, String>(
                dataSource: wa,
                xValueMapper: (AnalysisWeekRespDto sales, _) => sales.week,
                yValueMapper: (AnalysisWeekRespDto sales, _) => sales.price,
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
                      'price',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ],
              rows: <DataRow>[
                for (int i = 0; i < wa.length; i++)
                  (DataRow(
                    cells: <DataCell>[
                      DataCell(Text('${wa[i].week}')),
                      DataCell(Text('${wa[i].price}')),
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
