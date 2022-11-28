import 'package:flutter/material.dart';
import 'package:mubwara/views/component/shop_main.dart';

import 'shopmainbody.dart';

class ShopMain extends StatefulWidget {
  const ShopMain({Key? key}) : super(key: key);

  @override
  State<ShopMain> createState() => _ShopMainState();
}

class _ShopMainState extends State<ShopMain> {  int _selectedIndex = 0;
void selectedIndexChanged(int index) {
  _selectedIndex = index;
  setState(() {});
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        "메인",
        style: TextStyle(fontSize: 25),
      ),
      backgroundColor: Colors.grey,
    ),
    body: ShopMainBody(selectedIndex: _selectedIndex),
    bottomNavigationBar: ShopMainPage(),
  );
}
}