import 'package:flutter/material.dart';

class reservationScreen extends StatelessWidget {
  const reservationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        "예약",
        style: TextStyle(
          fontSize: 50
        ),
      ),
    );
  }
}
