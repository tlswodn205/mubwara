import 'package:flutter/material.dart';
import 'package:mubwara/views/common/const/color.dart';

class ManageMentButton extends StatelessWidget {
  const ManageMentButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            InkWell(
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