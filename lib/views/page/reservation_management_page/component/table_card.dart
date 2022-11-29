import 'package:flutter/material.dart';
import 'package:mubwara/views/common/const/color.dart';

class TableCard extends StatelessWidget {
  final int startTime;
  final int endTime;
  final int max_people;

  const TableCard(
      {required this.endTime,
      required this.startTime,
      required this.max_people,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: CALENDAR_PRIMARY_COLOR,
        ),
        borderRadius: BorderRadius.circular(8.0)
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            _Time(startTime: startTime, endTime: endTime),
            SizedBox(
              width: 16.0,
            ),
            _Max_people(max_people: max_people)
          ],
        ),
      ),
    );
  }
}

class _Time extends StatelessWidget {
  final int startTime;
  final int endTime;

  const _Time({required this.startTime, required this.endTime, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontWeight: FontWeight.w600,
      color: CALENDAR_PRIMARY_COLOR,
      fontSize: 16.0,
    );
    return Column(
      children: [
        Text(
          '${startTime.toString().padLeft(2, '0')}:00',
          style: textStyle,
        ),
        Text(
          '${endTime.toString().padLeft(2, '0')}:00',
          style: textStyle.copyWith(
            fontSize: 10.0,
          ),
        ),
      ],
    );
  }
}

class _Max_people extends StatelessWidget {
  final int max_people;

  const _Max_people({required this.max_people, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('${max_people}명 테이블');
  }
}
