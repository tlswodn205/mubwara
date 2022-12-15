import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:mubwara/views/common/const/color.dart';

class SceduleCard extends StatelessWidget {
  final String reservation_time;
  final selectMethod;
  final onPress;

  const SceduleCard({
    this.onPress,
    required this.reservation_time,
    required this.selectMethod,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          _Time(
            reservation_time: reservation_time,
            selectMethod: selectMethod,
            onPress: onPress,
          )
        ],
      ),
    );
  }
}

class _Time extends StatelessWidget {
  final String reservation_time;
  final selectMethod;
  final onPress;
  late bool select = false;
  _Time(
      {required this.onPress,
      required this.reservation_time,
      required this.selectMethod,
      Key? key})
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
            ElevatedButton(
              onPressed: onPress,
              child: Text('${reservation_time}'),
              style: ButtonStyle(overlayColor:
                  MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                if (select) {
                  if (states.contains(MaterialState.focused))
                    return PRIMARY_COLOR;
                  if (states.contains(MaterialState.pressed))
                    return PRIMARY_COLOR;
                } else {
                  if (states.contains(MaterialState.focused)) return Colors.red;
                  if (states.contains(MaterialState.pressed)) return Colors.red;
                }
                return Colors.red;
              }), backgroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                if (select) return Colors.red;
                if (!select) return PRIMARY_COLOR;
              })),
            ),
            // is
          ],
        ),
      ),
    );
  }
}
