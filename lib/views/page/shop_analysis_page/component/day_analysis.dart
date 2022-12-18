import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../../../../dto/response/shop_resp_dto.dart';
import 'day_analysis_model.dart';

class DayAnalysis extends ConsumerStatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  DayAnalysis({Key? key}) : super(key: key);

  @override
  _DayAnalysisState createState() => _DayAnalysisState();
}

class _DayAnalysisState extends ConsumerState<DayAnalysis> {
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
    final da = ref.watch(dayAnalysis);
    return Column(
      children: [
        //Initialize the chart widget
        SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            // Chart title
            title: ChartTitle(text: '일일 예약수(차트)'),
            // Enable tooltip
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries<AnalysisDateRespDto, int>>[
              LineSeries<AnalysisDateRespDto, int>(
                  dataSource: da,
                  xValueMapper: (AnalysisDateRespDto sales, _) => sales.times ,
                  yValueMapper: (AnalysisDateRespDto sales, _) => sales.results ,
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
                for (int i = 0; i < da.length; i++)
                  (DataRow(
                    cells: <DataCell>[
                      DataCell(Text('${da[i].times}')),
                      DataCell(Text('${da[i].results}')),
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
