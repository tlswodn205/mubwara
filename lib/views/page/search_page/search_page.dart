import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/controller/shop_controller.dart';
import 'package:mubwara/dto/response/shop_resp_dto.dart';
import 'package:mubwara/views/page/search_page/component/restaurant_card.dart';
import 'package:mubwara/views/page/search_page/component/search_bar.dart';
import 'package:mubwara/views/page/search_page/search_page_model.dart';
import 'package:mubwara/views/page/shop_page/shop_detail.dart';

import '../../component/boundary.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final sm = ref.watch(searchPageModel);
    final sc = ref.read(shopController);

    return Scaffold(
      appBar: searchBar(),
      body: Center(
        child: RefreshIndicator(
          onRefresh: () => sc.refresh(),
          child: ListView.builder(
            itemCount: sm.length,
            itemBuilder: (context, index) {
              return _buildShop(index, sm, sc);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildShop(
      int ListIndex, List<ShopSearchListDto> sm, ShopController sc) {
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
                image: Image.memory(
                    base64.decode(sm[ListIndex].imageFileDto.image)),
                shop_name: '${sm[ListIndex].shopName}',
                tags: [sm[ListIndex].category],
                address: '${sm[ListIndex].address}',
                telephone: '${shopList[ListIndex].telephone}',
                open_time: '${sm[ListIndex].openTime}:00',
                close_time: '${sm[ListIndex].closeTime}:00',
                review_score: shopList[ListIndex].review_score,
                review_count: shopList[ListIndex].reviewer_count,
                information: '${sm[ListIndex].information}',
              ),
            ),
          ),
          Boundary(),
        ],
      ),
    );
  }
}
