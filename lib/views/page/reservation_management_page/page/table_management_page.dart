import 'package:flutter/material.dart';
import 'package:mubwara/views/layout/default_layout.dart';
import 'package:mubwara/views/page/reservation_management_page/component/table_bottom_sheet.dart';

class TableManagementPage extends StatefulWidget {
  const TableManagementPage({Key? key}) : super(key: key);

  @override
  State<TableManagementPage> createState() => _TableManagementPageState();
}

class _TableManagementPageState extends State<TableManagementPage> {
  List<_TableData> data = [
    _TableData('1', '10'),
    _TableData('2', '10'),
    _TableData('4', '10'),
    _TableData('8', '5'),
    _TableData('20', '1'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '테이블관리',
      child: Scaffold(
        floatingActionButton: tableaddbutton(),
        body: Center(
            child: Expanded(
          child: ListView(children: <Widget>[
            DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Expanded(
                    child: Text(
                      '인원수',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      '테이블갯수',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      '삭제',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                )
              ],
              rows: <DataRow>[
                for (int i = 0; i < data.length; i++)
                  (DataRow(
                    cells: <DataCell>[
                      DataCell(Text('${data[i].personnel}')),
                      DataCell(Text('${data[i].table}')),
                      DataCell(IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.delete),
                      ))
                    ],
                  )),
              ],
            )
          ]),
        )),
      ),
    );
  }

  FloatingActionButton tableaddbutton() {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) {
            return TableBottomSheet();
          },
        );
      },
      child: Icon(Icons.add),
    );
  }
}

class _TableData {
  _TableData(this.personnel, this.table);

  final String personnel;
  final String table;
}
