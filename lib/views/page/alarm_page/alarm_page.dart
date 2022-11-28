import 'package:flutter/material.dart';
import 'package:mubwara/views/common/const/color.dart';
import 'package:mubwara/views/page/alarm_page/component/alram_card.dart';

class AlarmPage extends StatelessWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      width: 1,
                      color: PRIMARY_COLOR,
                    ),
                ),
                child: AlramCard(
                    customer_name: '박동훈',
                    customer_phone: '01024102957',
                    reservation_date: '2022.11.29',
                    reservation_time: '19:00',
                    table_max_people: 5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
