import 'package:flutter/material.dart';
import 'package:mubwara/views/common/const/color.dart';
import 'package:mubwara/views/page/payment_page/paymentScreen.dart';

class reservationBottomBar extends StatelessWidget {
  const reservationBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
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
            child: Text("예약하러 가기",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Body_TEXT_COLOR1)),
      ),
    );
  }
}
