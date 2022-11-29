import 'package:flutter/material.dart';
import 'package:mubwara/views/common/const/color.dart';

class OrderCard extends StatelessWidget {
  final int personal;
  final DateTime reservation_date;
  final String reservation_time;
  final String customer_name;
  final Image image;
  const OrderCard({
    required this.image,
    required this.customer_name,
    required this.reservation_date,
    required this.reservation_time,
    required this.personal,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${reservation_date.year}.${reservation_date.month.toString().padLeft(2,'0')}.${reservation_date.day.toString().padLeft(2,'0')} 예약완료',
          style: TextStyle(
            fontSize: 17,
          ),
        ),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: image,
            ),
            const SizedBox(width: 16.0,),
            Column(
              children: [
                Text(
                  customer_name,
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                Text(
                  '$reservation_time $personal명',
                  style: TextStyle(
                    color: Body_TEXT_COLOR,
                    fontWeight: FontWeight.w700
                  ),
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}
