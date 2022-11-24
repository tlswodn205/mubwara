import 'package:flutter/material.dart';

import '../../component/shop_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ShopList(),
    );
  }
}
