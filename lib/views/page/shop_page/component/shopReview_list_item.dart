import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/dto/response/customer_resp_dto.dart';
import 'package:mubwara/views/component/review_star_make.dart';

import '../../../../dto/response/review_resp_dto.dart';

class ShopReviewListItem extends ConsumerWidget {
  const ShopReviewListItem(
      {required this.listIndex, required this.reviewList, Key? key})
      : super(key: key);
  final int listIndex;
  final List<ReviewRespDto> reviewList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Row(
            children: [
              Container(
                child: Center(
                  child: Image.memory(
                    base64.decode(reviewList[listIndex].images[0].image),
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
                height: 104,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReviewStarMake(review_score: reviewList[listIndex].score),
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
