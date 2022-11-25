import 'package:flutter/material.dart';

class BasicAppBar extends StatelessWidget {
  const BasicAppBar({required this.pageName, Key? key}) : super(key: key);
  final String pageName;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "${pageName}",
        style: TextStyle(fontSize: 25),
      ),
      backgroundColor: Colors.grey,
    );
  }
}
