import 'package:flutter/material.dart';
import 'package:mubwara/views/common/const/color.dart';

import 'page/reservation_cancle_page.dart';
import 'page/reservation_now_page.dart';
import 'page/schedule_page.dart';

class ReservationManagementPage extends StatelessWidget {
  const ReservationManagementPage({

    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => SchedulePage(),
                  ),
                );
              },
              child: Container(
                height: 56,
                width: 300,
                alignment: Alignment.center,
                color: PRIMARY_COLOR,
                child: Text("스케쥴 관리",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Body_TEXT_COLOR1)),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ReservationNowPage(),
                  ),
                );
              },
              child: Container(
                height: 56,
                width: 300,
                alignment: Alignment.center,
                color: PRIMARY_COLOR,
                child: Text("예약 현황",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Body_TEXT_COLOR1)),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ReservationCanclePage(),
                  ),
                );
              },
              child: Container(
                height: 56,
                width: 300,
                alignment: Alignment.center,
                color: PRIMARY_COLOR,
                child: Text("예약 취소 현황",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Body_TEXT_COLOR1)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}