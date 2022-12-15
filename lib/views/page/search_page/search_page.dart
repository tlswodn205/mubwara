import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/controller/shop_controller.dart';
import 'package:mubwara/dto/response/shop_resp_dto.dart';
import 'package:mubwara/views/common/const/color.dart';
import 'package:mubwara/views/page/search_page/component/restaurant_card.dart';
import 'package:mubwara/views/component/search_bar.dart';
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
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: INPUT_BG_COLOR,
        title: TextFormField(
          controller: searchTextEditingController,
          decoration: InputDecoration(
              hintText: '검색어를 입력해주세요.',
              hintStyle: TextStyle(
                color: Body_TEXT_COLOR,
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: INPUT_BORDER_COLOR,)
              ),
              filled: true,
              prefixIcon: Icon(Icons.search_rounded, color: Body_TEXT_COLOR2, size: 30),
              suffixIcon: IconButton(icon: Icon(Icons.clear, color: Body_TEXT_COLOR,),
                  onPressed: emptyTheTextFormField)
          ),
          style: TextStyle(
            fontSize: 18,
            color: Body_TEXT_COLOR2,
          ),
          // onFieldSubmitted: controlSearching,
        ),
      ),
      body: Center(
        child: RefreshIndicator(
          onRefresh: () => sc.searchShopListRefresh(),
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
                    builder: (_) => ShopDetailScreen(shopId: sm[ListIndex].id),
                  ),
                );
              },
              child: RestaurantCard(
                image: Image.memory(
                    base64.decode(sm[ListIndex].imageFileDto.image),
                  fit: BoxFit.contain,
                  width: 350,
                ),
                shop_name: '${sm[ListIndex].shopName}',
                tags: [sm[ListIndex].category],
                address: '${sm[ListIndex].address}',
                telephone: '${sm[ListIndex].phoneNumber}',
                open_time: '${sm[ListIndex].openTime}:00',
                close_time: '${sm[ListIndex].closeTime}:00',
                scoreAvg: sm[ListIndex].scoreAvg,
                review_count: 0,
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
