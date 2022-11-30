import 'package:flutter/material.dart';
import 'package:mubwara/dto/response/shop_resp_dto.dart';
import 'package:mubwara/views/component/reservation_list_item.dart';

class ReservationList extends StatelessWidget {
  const ReservationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: shopList.length,
      itemBuilder: (context, index) {
        return ReservationListItem(listIndex: index);
      },
    );
  }
}
