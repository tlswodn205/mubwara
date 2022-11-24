import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReviewStarMake extends StatelessWidget {
  const ReviewStarMake({required this.review_score, Key? key})
      : super(key: key);
  final int review_score;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < review_score; i++)
          (Icon(
            CupertinoIcons.star_fill,
            size: 15,
            color: Colors.yellow,
          )),
        for (int i = 0; i < 5 - review_score; i++)
          (Icon(
            CupertinoIcons.star,
            size: 15,
            color: Colors.yellow,
          )),
      ],
    );
  }
}
