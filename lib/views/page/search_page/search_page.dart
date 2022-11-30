import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mubwara/dto/response/shop_resp_dto.dart';
import 'package:mubwara/views/page/search_page/component/restaurant_card.dart';
import 'package:mubwara/views/page/search_page/component/search_bar.dart';
import 'package:mubwara/views/page/shop_page/shop_detail.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchBar(),
      body: Center(
        child: ListView.builder(
          itemCount: shopList.length,
          itemBuilder: (context, index) {
            return _buildShop(index);
          },
        ),
      ),
    );
  }

  Widget _buildShop(int ListIndex) {
    return GestureDetector(
      child: Padding(
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
            review_score: shopList[ListIndex].review_score,
            review_count: shopList[ListIndex].reviewer_count,
            information: '${shopList[ListIndex].information}',
          ),
        ),
      ),
    );
  }
}
