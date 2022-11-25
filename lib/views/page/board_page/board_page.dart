import 'package:flutter/material.dart';
import '../../../domain/review/review.dart';

import '../search_page/component/restaurant_card.dart';
import 'component/review_item.dart';

class BoardPage extends StatelessWidget {
  const BoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: reviewList.length,
        itemBuilder: (context, index) {
          return ReviewItem(listIndex: index);
        },
      ),
    );
  }
}
