import 'package:flutter/material.dart';

class Boundary extends StatelessWidget {
  const Boundary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 1,
        child: ColoredBox(
          color: Colors.grey,
        ));
  }
}
