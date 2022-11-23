import 'package:flutter/material.dart';

class BoardPage extends StatelessWidget {
  const BoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "게시판입니다.",
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
