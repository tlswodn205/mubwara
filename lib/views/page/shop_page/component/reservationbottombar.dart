import 'package:flutter/material.dart';
import 'package:mubwara/views/common/const/color.dart';
import 'package:mubwara/views/page/payment_page/basket_page.dart';

class reservationBottomBar extends StatelessWidget {
  reservationBottomBar({required this.onTap, Key? key}) : super(key: key);

  final onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
