import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:mubwara/views/common/const/color.dart';

class PersonnelCard extends StatelessWidget {
  final int maxPeople;
  final int personal;
  final onPress;
  const PersonnelCard(
      {required this.maxPeople,
      required this.personal,
      required this.onPress,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          _personal(
              maxPeople: maxPeople, personal: personal, onPress: this.onPress)
        ],
      ),
    );
  }
}

class _personal extends StatelessWidget {
  final int personal;
  final onPress;
  final int maxPeople;
  late bool select = false;
  _personal(
      {required this.maxPeople,
      required this.personal,
      required this.onPress,
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
              child: Text('${personal}명'),
              style: ButtonStyle(overlayColor:
                  MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                if (maxPeople == personal) {
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
                if (maxPeople == personal) return Colors.red;
                if (maxPeople != personal) return PRIMARY_COLOR;
              })),
              // isReverse: true,
            ),
          ],
        ),
      ),
    );
  }
}
