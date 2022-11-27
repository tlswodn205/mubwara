import 'package:flutter/material.dart';
import 'package:mubwara/dto/response/shop_resp_dto.dart';

import '../../component/review_list.dart';
import '../../component/shop_list.dart';
import '../profile_update_page/profile_update_page.dart';
import '../review_write_page/review_write_page.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildButton(buttonName: "프로필 수정", buttonBackgroundColor: Colors.red),
        SizedBox(height: 30),
        _buildButton(buttonName: "내 가게 등록", buttonBackgroundColor: Colors.blue),
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
    );
  }

  Widget _buildButton(
      {required String buttonName, required Color buttonBackgroundColor}) {
    return Container(
      width: double.infinity,
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: buttonBackgroundColor,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ReviewWritePage(),
            ),
          );
        },
        child: Text("${buttonName}",
            style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
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
            "예약리스트",
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
        Tab(
          child: Text(
            "구독리스트",
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

  Widget _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [ShopList(), ReviewList(), ReviewList()],
    );
  }
}
