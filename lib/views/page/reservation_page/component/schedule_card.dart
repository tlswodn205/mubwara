import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:mubwara/views/common/const/color.dart';

class SceduleCard extends StatelessWidget {
  final String reservation_time;
  final selectMethod;

  const SceduleCard(
      {required this.reservation_time, required this.selectMethod, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          _Time(
            reservation_time: reservation_time,
            selectMethod: selectMethod,
          )
        ],
      ),
    );
  }
}

class _Time extends StatelessWidget {
  final String reservation_time;
  final selectMethod;
  const _Time(
      {required this.reservation_time, required this.selectMethod, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonTextStyle = TextStyle(
      fontSize: 17,
      color: Body_TEXT_COLOR2,
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedButton(
              selectedBackgroundColor: PRIMARY_COLOR,
              width: 100,
              text: '${reservation_time}',
              isReverse: true,
              selectedTextColor: Body_TEXT_COLOR1,
              transitionType: TransitionType.LEFT_TO_RIGHT,
              textStyle: buttonTextStyle,
              backgroundColor: Body_TEXT_COLOR1,
              borderColor: PRIMARY_COLOR,
              borderWidth: 2,
              onPress: () {
                selectMethod;
              },
            ),
          ],
        ),
      ),
    );
  }
}
