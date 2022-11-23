import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "마이페이지 입니다.",
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
