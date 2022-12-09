import 'package:flutter/material.dart';
import 'package:mubwara/views/common/const/color.dart';

class ReservationTextField extends StatelessWidget {
  final String label;
  final ValueChanged<String>? onChanged;

  const ReservationTextField({
    required this.label,
    this.onChanged,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: PRIMARY_COLOR,
          ),
        ),
        TextField(
          onChanged: onChanged,
          cursorColor:Body_TEXT_COLOR,
          decoration: InputDecoration(
            border: InputBorder.none,
            filled: true,
            fillColor: TEXT_FIELD_COLOR,
          ),
        ),
      ],
    );
  }
}
