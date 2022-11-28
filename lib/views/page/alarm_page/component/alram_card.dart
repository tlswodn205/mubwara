import 'package:flutter/material.dart';
import 'package:mubwara/views/common/const/color.dart';

class AlramCard extends StatelessWidget {

  // 예약자 이름
  final String customer_name;

  // 레스토랑 태그
  final String customer_phone;

  // 주소
  final String reservation_date;

  // 가게 소개
  final String reservation_time;

  // 전화번호
  final int table_max_people;

  const AlramCard({
    required this.customer_name,
    required this.customer_phone,
    required this.reservation_date,
    required this.reservation_time,
    required this.table_max_people,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                customer_name,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  _IconText(
                    icon: Icons.phone,
                    label: customer_phone.toString(),
                  ),
                  renderDot(),
                  _IconText(
                    icon: Icons.calendar_month_outlined,
                    label: reservation_date.toString(),
                  ),
                  renderDot(),
                  _IconText(
                    icon: Icons.timelapse_outlined,
                    label: '$reservation_time ',
                  ),
                  renderDot(),
                  _IconText(
                    icon: Icons.people,
                    label: '$table_max_people 명',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget renderDot() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Text(
        '·',
        style: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _IconText extends StatelessWidget {
  final IconData icon;
  final String label;

  const _IconText({required this.icon, required this.label, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: PRIMARY_COLOR,
          size: 14.0,
        ),
        const SizedBox(width: 8.0),
        Text(
          label,
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}