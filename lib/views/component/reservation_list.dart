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
    final sm = ref.watch(reservationListModel);
    final sc = ref.read(reservationController);
    return RefreshIndicator(
      onRefresh: () => sc.refresh(),
      child: ListView.builder(
        itemCount: sm.length,
        itemBuilder: (context, index) {
          return ReservationListItem(listIndex: index, sm: [],);
        },
      ),
    );
  }
}
