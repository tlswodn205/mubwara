import 'package:flutter/material.dart';
import 'package:mubwara/views/common/const/color.dart';

class PersonnelCard extends StatelessWidget {
  final int personal;

  const PersonnelCard({required this.personal, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [_personal(personal: personal)],
      ),
    );
  }
}

class _personal extends StatelessWidget {
  final int personal;

  const _personal({required this.personal, Key? key}) : super(key: key);

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
              '${personal}명',
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
