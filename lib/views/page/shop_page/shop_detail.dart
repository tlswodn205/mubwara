import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mubwara/views/layout/default_layout.dart';
import 'package:mubwara/views/page/search_page/component/restaurant_card.dart';
import 'package:mubwara/views/page/shop_page/component/shop_detail_bottomNabBar.dart';
import 'package:mubwara/views/page/shop_page/component/shop_info.dart';
import 'package:mubwara/views/page/shop_page/component/shop_menu.dart';
import '../../component/review_list.dart';

class ShopDetailScreen extends StatefulWidget {
  const ShopDetailScreen({Key? key}) : super(key: key);

  @override
  State<ShopDetailScreen> createState() => _ShopDetailScreenState();
}

class _ShopDetailScreenState extends State<ShopDetailScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '불타는 떡볶이',
      bottomNavigationBar: bottomNavBar(),
      child: Column(
        children: [
          RestaurantCard(
            image: Image.asset(
              'assets/images/review/ddeok_bok_gi.jpg',
              width: 300,
              fit: BoxFit.cover,
            ),
            shop_name: '쉐프의 떡볶이',
            tags: ['떡볶이', '치즈', '매운맛'],
            address: '화명동',
            telephone: '01024102957',
            open_time: '10:00',
            close_time: '22:00',
            information: '어린이 간식, 아빠 술 안주로 좋아요!',
          ),
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
      ),
    );
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
}
