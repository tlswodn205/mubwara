import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/dto/request/reservation_req_dto.dart';
import 'package:mubwara/views/common/const/color.dart';
import 'package:mubwara/views/page/alarm_page/component/alram_card.dart';

import '../../../domain/reservation/reservation_firestore_repository.dart';

class AlarmPage extends ConsumerWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataList = ref.watch(reservationStreamProvider);
    return Scaffold(
        body: dataList.when(
      data: (reservationAlarmRespDto) {
        if (reservationAlarmRespDto.isNotEmpty) {
          return Container(
              child: ListView.separated(
            itemCount: reservationAlarmRespDto.length,
            itemBuilder: (context, index) => ListTile(
              subtitle: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    width: 1,
                    color: PRIMARY_COLOR,
                  ),
                ),
                child: AlramCard(
                  customer_name: '${reservationAlarmRespDto[index].name}',
                  reservation_date: '${reservationAlarmRespDto[index].date}',
                  reservation_time: '${reservationAlarmRespDto[index].time}:00',
                  table_max_people:
                      '${reservationAlarmRespDto[index].maxPeople}',
                  isCheck: reservationAlarmRespDto[index].isCheck,
                  AlarmId: reservationAlarmRespDto[index].alarmId,
                ),
              ),
            ),
            separatorBuilder: (context, index) => Divider(),
          ));
        } else {
          return Center(
            child: Text(
              "예약 내역 없음",
              style: TextStyle(fontSize: 50),
            ),
          );
        }
      },
      error: (error, stackTrace) => CircularProgressIndicator(),
      loading: () => CircularProgressIndicator(),
    ));
  }
}
