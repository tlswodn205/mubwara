import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
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
    final buttonTextStyle = TextStyle(
      fontSize: 17,
      color: Body_TEXT_COLOR1,
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedButton(
              selectedBackgroundColor: SELECTED_COLOR,
              width: 100,
              text: '${reservation_time}',
              isReverse: true,
              selectedTextColor: Body_TEXT_COLOR1,
              transitionType: TransitionType.LEFT_TO_RIGHT,
              textStyle: buttonTextStyle,
              backgroundColor: PRIMARY_COLOR,
              borderColor: INPUT_BORDER_COLOR,
              borderWidth: 2,
              onPress: () {},
            ),
          ],
        ),
      ),
    );
  }
}
