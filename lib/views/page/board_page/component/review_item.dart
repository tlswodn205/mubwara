import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mubwara/dto/response/shop_resp_dto.dart';
import 'package:mubwara/views/component/review_star_make.dart';

import '../../../../domain/review/review.dart';
import '../../../../dto/response/review_resp_dto.dart';
import '../../shop_page/shop_detail.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({required this.listIndex, required this.bpm, Key? key})
      : super(key: key);
  final int listIndex;
  final List<ReviewListRespDto> bpm;
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
                child: Image.memory(
                  base64Decode(bpm[listIndex].images[0].image),
                  width: 310,
                  height: 200,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    '${bpm[listIndex].reviewAboutShopDto.shopName}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ReviewStarMake(review_score: bpm[listIndex].score)
                ],
              ),
              Text("${bpm[listIndex].content}"),
              SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => ShopDetailScreen(
                          shopId: bpm[listIndex].reviewAboutShopDto.id),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Image.memory(
                      base64Decode(
                          bpm[listIndex].reviewAboutShopDto.imageFileDto.image),
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
                          '${bpm[listIndex].reviewAboutShopDto.shopName}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '${bpm[listIndex].reviewAboutShopDto.category}',
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
                              '${bpm[listIndex].reviewAboutShopDto.address}',
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
