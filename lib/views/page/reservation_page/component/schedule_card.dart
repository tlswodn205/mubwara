import 'package:flutter/material.dart';
import 'package:mubwara/views/common/const/color.dart';

class SceduleCard extends StatelessWidget {
  final String reservation_time;

  const SceduleCard({required this.reservation_time, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [_Time(reservation_time: reservation_time)],
      ),
    );
  }
}

class _Time extends StatelessWidget {
  final String reservation_time;

  const _Time({required this.reservation_time, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: CALENDAR_PRIMARY_COLOR),
        ),
        width: 80,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${reservation_time}',
              style: TextStyle(
                fontSize: 25,
                color: Body_TEXT_COLOR2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
