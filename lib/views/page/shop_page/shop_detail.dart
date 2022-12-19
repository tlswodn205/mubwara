import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/dto/response/shop_resp_dto.dart';
import 'package:mubwara/views/layout/default_layout.dart';
import 'package:mubwara/views/page/search_page/component/restaurant_card.dart';
import 'package:mubwara/views/page/shop_page/component/shop_detail_bottomnavbar.dart';
import 'package:mubwara/views/page/shop_page/component/shop_info.dart';
import 'package:mubwara/views/page/shop_page/component/shop_menu.dart';
import 'package:mubwara/views/page/search_page/search_page_model.dart';
import 'package:mubwara/views/page/shop_page/shop_detail_model.dart';

import '../../../controller/shop_controller.dart';
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
    final sm = ref.watch(shopDetailPageModel(widget.shopId));
    if (sm == null) {
      return Container(
        child: Center(),
      );
    } else {
      return DefaultLayout(
          title: '${sm.shopName}',
          bottomNavigationBar: bottomNavBar(
            shopId: widget.shopId,
            perPrice: sm.perPrice,
            name: '${sm.shopName}',
          ),
          child: Column(
            children: [
              _buildShop(sm),
              SizedBox(height: 30),
              PreferredSize(
                preferredSize: _buildTabBar().preferredSize,
                child: ColoredBox(
                  color: Colors.grey,
                  child: _buildTabBar(),
                ),
              ),
              Expanded(child: _buildTabBarView(sm)),
            ],
          ));
    }
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

  Widget _buildTabBarView(ShopDetailRespDto sm) {
    return TabBarView(
      controller: _tabController,
      children: [
        ShopInfo(),
        ShopMenu(
          menuRespDtoList: sm.menu,
        ),
        ReviewList()
      ],
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

  Widget _buildShop(ShopDetailRespDto sm) {
    if (sm.imageFileDto == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return GestureDetector(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GestureDetector(
            child: RestaurantCard(
              image: Image.memory(
                base64Decode(sm.imageFileDto.image),
                fit: BoxFit.contain,
                width: 350,
                height: 200,
              ),
              shop_name: '${sm.shopName}',
              tags: [sm.category],
              address: '${sm.address}',
              telephone: '${sm.phoneNumber}',
              open_time: '10:00',
              close_time: '22:00',
              scoreAvg: sm.scoreAvg,
              review_count: 1,
              information: '${sm.information}',
            ),
          ),
        ),
      );
    }
  }
}
