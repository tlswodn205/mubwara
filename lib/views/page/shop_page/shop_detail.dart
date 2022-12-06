import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/dto/response/shop_resp_dto.dart';
import 'package:mubwara/views/layout/default_layout.dart';
import 'package:mubwara/views/page/search_page/component/restaurant_card.dart';
import 'package:mubwara/views/page/shop_page/component/shop_detail_bottomNabBar.dart';
import 'package:mubwara/views/page/shop_page/component/shop_info.dart';
import 'package:mubwara/views/page/shop_page/component/shop_menu.dart';
import 'package:mubwara/views/page/search_page/search_page_model.dart';

import '../../component/review_list.dart';

class ShopDetailScreen extends ConsumerStatefulWidget {
  const ShopDetailScreen({required this.shopId, Key? key}) : super(key: key);
  final int shopId;
  @override
  ConsumerState<ShopDetailScreen> createState() => _ShopDetailScreenState();
}

class _ShopDetailScreenState extends ConsumerState<ShopDetailScreen>
    with SingleTickerProviderStateMixin {

  TabController? _tabController;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    int ListIndex =
        shopList.indexWhere((element) => element.shop_id == widget.shopId);
    return DefaultLayout(
        title: '${shopList[ListIndex].shop_name}',
        bottomNavigationBar: bottomNavBar(),
        child: Column(
          children: [
            _buildShop(ListIndex),
            SizedBox(height: 30),
            PreferredSize(
              preferredSize: _buildTabBar().preferredSize,
              child: ColoredBox(
                color: Colors.grey,
                child: _buildTabBar(),
              ),
            ),
            Expanded(child: _buildTabBarView()),
          ],
        ));
  }

  Widget _buildButton({required String buttonName, required Color Color}) {
    return Container(
      width: double.infinity,
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Color,
        ),
        onPressed: () {},
        child: Text("${buttonName}",
            style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [ShopInfo(), ShopMenu(), ReviewList()],
    );
  }

  TabBar _buildTabBar() {
    return TabBar(
      controller: _tabController,
      unselectedLabelColor: Colors.lightBlue[100],
      labelColor: const Color(0xFF3baee7),
      indicatorWeight: 2,
      indicatorColor: Colors.blue[100],
      indicator: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.blue),
      tabs: [
        Tab(
          child: Text(
            "가게정보",
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
        Tab(
          child: Text(
            "메뉴",
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
        Tab(
          child: Text(
            "리뷰리스트",
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
      ],
    );
  }

  Widget _buildShop(int ListIndex) {
    final sm = ref.watch(searchPageModel);
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GestureDetector(
          child: RestaurantCard(
            image: Image.file(
              File(sm[ListIndex].imageFileDto.image),
            ),
            shop_name: '${sm[ListIndex].shopName}',
            tags: ['떡볶이${ListIndex}', '치즈', '매운맛'],
            address: '${sm[ListIndex].address}',
            telephone: '${shopList[ListIndex].telephone}',
            open_time: '10:00',
            close_time: '22:00',
            review_score: shopList[ListIndex].review_score,
            review_count: shopList[ListIndex].reviewer_count,
            information: '${sm[ListIndex].information}',
          ),
        ),
      ),
    );
  }
}
