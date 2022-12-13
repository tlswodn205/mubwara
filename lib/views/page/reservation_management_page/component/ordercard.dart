import 'package:flutter/material.dart';
import 'package:mubwara/views/common/const/color.dart';

class OrderCard extends StatelessWidget {
  final String personal;
  final String reservation_date;
  final String reservation_time;
  final String customer_name;
  final Image image;
  final String phone_number;
  const OrderCard({
    required this.image,
    required this.customer_name,
    required this.reservation_date,
    required this.reservation_time,
    required this.personal,
    required this.phone_number,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
         '$reservation_date 예약완료',
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
                Row(
                  children: [
                    Text(
                      '$customer_name님',
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    const SizedBox(width: 30.0,),

                    Text(
                        phone_number,
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    )
                  ],
                ),
                Text(
                  '$reservation_time:00 $personal명',
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
