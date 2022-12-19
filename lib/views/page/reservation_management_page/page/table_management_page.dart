import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/dto/request/table_type_req_dto.dart';
import 'package:mubwara/views/layout/default_layout.dart';
import 'package:mubwara/views/page/reservation_management_page/component/table_bottom_sheet.dart';

import '../../../../controller/table_controller.dart';
import '../model/table_page_model.dart';

class TableManagementPage extends ConsumerStatefulWidget {
  const TableManagementPage({Key? key}) : super(key: key);

  @override
  ConsumerState<TableManagementPage> createState() =>
      _TableManagementPageState();
}

class _TableManagementPageState extends ConsumerState<TableManagementPage> {
  @override
  Widget build(BuildContext context) {
    final sm = ref.watch(tablePageModel);
    final sc = ref.read(tableController);
    TableReqDto tableReqDto = TableReqDto.origin();

    return DefaultLayout(
      title: '테이블관리',
      child: Scaffold(
        floatingActionButton: tableaddbutton(),
        body: Center(
          child: RefreshIndicator(
            onRefresh: () => sc.allShopTableListRefresh(),
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return DataTable(
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
                    ),
                  ],
                  rows: <DataRow>[
                    for (int i = 0; i < sm.length; i++)
                      (DataRow(
                        cells: <DataCell>[
                          DataCell(Text('${sm[i].maxPeople}')),
                          DataCell(Text('${sm[i].qty}')),
                          DataCell(IconButton(
                            onPressed: () {
                              sc.tableupdate(TableReqDto(sm[i].maxPeople, '${(-1)!*(sm[i].qty)}'));
                            },
                            icon: Icon(Icons.delete),
                          ))
                        ],
                      )),
                  ],
                );
              },
            ),
          ),
        ),
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
