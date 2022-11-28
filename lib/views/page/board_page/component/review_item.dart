import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mubwara/dto/response/shop_resp_dto.dart';
import 'package:mubwara/views/component/review_star_make.dart';

import '../../../../domain/review/review.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({required this.listIndex, Key? key}) : super(key: key);
  final int listIndex;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Image.asset(
                  'assets/images/review/${reviewList[listIndex].image}',
                  width: 310,
                  height: 200,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    '${shopList[listIndex].shop_name}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ReviewStarMake(
                      review_score: reviewList[listIndex].review_score)
                ],
              ),
              Text("${reviewList[listIndex].content}"),
              SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/shop/${shopList[listIndex].image}',
                      width: 35,
                      height: 35,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${shopList[listIndex].shop_name}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '${shopList[listIndex].category}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              ' ㆍ ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              '${shopList[listIndex].address}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    Text(
                      '>',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w200),
                    ),
                  ],
                ),
                style: TextButton.styleFrom(backgroundColor: Colors.grey),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
