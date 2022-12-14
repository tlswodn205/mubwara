import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:mubwara/views/common/const/color.dart';

class PersonnelCard extends StatelessWidget {
  final int personal;
  final onPress;
  const PersonnelCard({required this.personal, required this.onPress, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [_personal(personal: personal, onPress: this.onPress)],
      ),
    );
  }
}

class _personal extends StatelessWidget {
  final int personal;
  final onPress;
  const _personal({required this.personal, required this.onPress, Key? key})
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
              text: '${personal}명',
              isReverse: true,
              selectedTextColor: Body_TEXT_COLOR1,
              transitionType: TransitionType.LEFT_TO_RIGHT,
              textStyle: buttonTextStyle,
              backgroundColor: Body_TEXT_COLOR1,
              borderColor: PRIMARY_COLOR,
              borderWidth: 2,
              onPress: () {
                onPress;
              },
            ),
          ],
        ),
      ),
    );
  }
}
