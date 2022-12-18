import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/controller/reservation_controller.dart';
import 'package:mubwara/dto/request/reservation_req_dto.dart';
import 'package:mubwara/views/common/const/color.dart';
import 'package:mubwara/views/page/payment_page/paymentScreen.dart';

class PaymentNavBar extends ConsumerWidget {
  const PaymentNavBar(
      {required this.maxPeople,
      required this.selectDay,
      required this.time,
      required this.shopId,
      Key? key})
      : super(key: key);

  final int shopId;
  final int maxPeople;
  final DateTime selectDay;
  final int? time;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        ref.read(reservationController).reservation(ReservationSaveReqDto(
            maxPeople: maxPeople,
            shopId: shopId,
            date: '${selectDay.year}${selectDay.month}${selectDay.day}',
            time: '${time}'));
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => paymentScreen(),
          ),
        );
      },
      child: Container(
        height: 56,
        alignment: Alignment.center,
        color: PRIMARY_COLOR,
        child: Text("결제 하기",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Body_TEXT_COLOR1)),
      ),
    );
  }
}
