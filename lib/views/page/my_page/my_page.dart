import 'package:flutter/material.dart';

import '../../component/review_list.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: ReviewList());
  }
}
