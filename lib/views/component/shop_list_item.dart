import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mubwara/views/component/review_star_make.dart';

import '../../dto/response/shop_resp_dto.dart';

class ShopListItem extends StatelessWidget {
  const ShopListItem({required this.listIndex, Key? key}) : super(key: key);
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
                    'assets/images/shop/${shopList[listIndex].image}',
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
                    Text(
                      shopList[listIndex].shop_name,
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "${shopList[listIndex].information}",
                      style: TextStyle(fontSize: 10),
                    ),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.star_fill,
                          size: 15,
                          color: Colors.yellow,
                        ),
                        Text(
                          "${shopList[listIndex].review_score}",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "${shopList[listIndex].category}",
                          style: TextStyle(fontSize: 10),
                        ),
                        Text(
                          " ㆍ ",
                          style: TextStyle(fontSize: 10),
                        ),
                        Text(
                          "${shopList[listIndex].address}",
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                    Text(
                      "${shopList[listIndex].price}원",
                      style: TextStyle(fontSize: 10),
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
