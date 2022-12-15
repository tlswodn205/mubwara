import 'package:flutter/material.dart';
import 'package:mubwara/views/common/const/color.dart';
import 'package:mubwara/views/page/payment_page/basket_page.dart';

class reservationBottomBar extends StatelessWidget {
  const reservationBottomBar(
      {required this.maxPeople,
      required this.selectDay,
      required this.time,
      Key? key})
      : super(key: key);

  final int maxPeople;
  final DateTime selectDay;
  final int? time;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => BasketPage(
                maxPeople: maxPeople, selectDay: selectDay, time: time),
          ),
        );
      },
      child: Container(
        height: 56,
        alignment: Alignment.center,
        color: PRIMARY_COLOR,
        child: Text("결제하러 가기",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Body_TEXT_COLOR1)),
      ),
    );
  }
}
