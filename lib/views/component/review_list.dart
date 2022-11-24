import 'package:flutter/material.dart';
import 'package:mubwara/domain/review/review.dart';
import 'package:mubwara/views/component/review_list_item.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: reviewList.length,
      itemBuilder: (context, index) {
        return ReviewListItem(listIndex: index);
      },
    );
  }
}
