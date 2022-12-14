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
            ElevatedButton(
              onPressed: () {},
              onLongPress: () {
                onPress;
              },
              child: Text('${personal}명'),
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.focused)) return Colors.red;
                  if (states.contains(MaterialState.pressed)) return Colors.red;
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
