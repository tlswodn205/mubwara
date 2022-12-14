import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:mubwara/views/component/boundary.dart';

import '../../dto/response/shop_resp_dto.dart';
import '../page/search_page/component/restaurant_card.dart';
import '../page/shop_page/shop_detail.dart';

class ShopListItem extends StatelessWidget {
  const ShopListItem({required this.listIndex, Key? key}) : super(key: key);
  final int listIndex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: _buildShop(listIndex, context),
    );
  }

  Widget _buildShop(int ListIndex, BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) =>
                        ShopDetailScreen(shopId: shopList[ListIndex].shop_id),
                  ),
                );
              },
              child: RestaurantCard(
                image: Image.asset(
                  'assets/images/shop/${shopList[ListIndex].image}',
                  fit: BoxFit.cover,
                ),
                shop_name: '${shopList[ListIndex].shop_name}',
                tags: ['떡볶이${ListIndex}', '치즈', '매운맛'],
                address: '${shopList[ListIndex].address}',
                telephone: '${shopList[ListIndex].telephone}',
                open_time: '10:00',
                close_time: '22:00',
                scoreAvg: shopList[ListIndex].review_score,
                review_count: shopList[ListIndex].reviewer_count,
                information: '${shopList[ListIndex].information}',
              ),
            ),
          ),
          Boundary(),
        ],
      ),
    );
  }
}
