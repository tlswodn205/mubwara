import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mubwara/views/component/review_star_make.dart';

import '../../domain/review/review.dart';

class ReviewListItem extends StatelessWidget {
  const ReviewListItem({required this.listIndex, Key? key}) : super(key: key);
  final int listIndex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Row(
            children: [
              Container(
                child: Center(
                  child: Image.asset(
                    'assets/images/review/${reviewList[listIndex].image}',
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReviewStarMake(
                        review_score: reviewList[listIndex].review_score),
                    Text(
                      reviewList[listIndex].content,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
