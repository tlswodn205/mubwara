import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/controller/customer/reservation_controller.dart';
import 'package:mubwara/dto/response/shop_resp_dto.dart';
import 'package:mubwara/views/component/model/reservation_list_model.dart';
import 'package:mubwara/views/component/reservation_list_item.dart';

class ReservationList extends ConsumerStatefulWidget {
  const ReservationList({Key? key}) : super(key: key);

  @override
  ConsumerState<ReservationList> createState() => _ReservationListState();
}

class _ReservationListState extends ConsumerState<ReservationList> {
  @override
  Widget build(BuildContext context) {
    final rm = ref.watch(reservationListModel);
    final rc = ref.read(reservationController);
    if (rm.length == 0) {
      return Center(
        child: Text("가게를 예약하지 않았습니다."),
      );
    }
    return RefreshIndicator(
      onRefresh: () => rc.refresh(),
      child: ListView.builder(
        itemCount: rm.length,
        itemBuilder: (context, index) {
          return ReservationListItem(
            listIndex: index,
            rm: rm,
          );
        },
      ),
    );
  }
}
