import 'package:flutter/material.dart';
import 'package:mubwara/views/common/const/color.dart';

class ScheduleBanner extends StatelessWidget {
  final DateTime selectedDay;
  final int scheduleCount;

  const ScheduleBanner(
      {required this.selectedDay, required this.scheduleCount, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontWeight: FontWeight.w700,
      color: Body_TEXT_COLOR1,
    );
    return Container(
      color: CALENDAR_PRIMARY_COLOR,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${selectedDay.year}년 ${selectedDay.month}월 ${selectedDay.day}일',
              style: textStyle,
            ),
            Text(
              '테이블 갯수 : $scheduleCount',
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
