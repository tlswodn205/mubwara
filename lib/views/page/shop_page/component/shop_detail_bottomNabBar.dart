import 'package:flutter/material.dart';
import 'package:mubwara/views/common/const/color.dart';
import 'package:mubwara/views/page/reservation_page/reservation_screen.dart';

class bottomNavBar extends StatelessWidget {
  const bottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              width: 66,
              color: Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.phone, color: Body_TEXT_COLOR1),
                  Text(
                    "연락하기",
                    style: TextStyle(color: Body_TEXT_COLOR1),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: 66,
              color: Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.notifications_active, color: Body_TEXT_COLOR1),
                  Text(
                    "구독하기",
                    style: TextStyle(color: Body_TEXT_COLOR1),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => reservationScreen(),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                color: PRIMARY_COLOR,
                child: Text("예약하러 가기",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Body_TEXT_COLOR1)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}