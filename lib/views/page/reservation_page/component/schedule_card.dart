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
            ElevatedButton(onPressed: () {},
              child: Text('${reservation_time}명'),   style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.focused))
                        return Colors.red;
                      if (states.contains(MaterialState.pressed))
                        return Colors.red;
                      return Colors.red;
                    }),
              ),
              // isReverse: true,
            ),
          ],
        ),
      ),
    );
  }
}
