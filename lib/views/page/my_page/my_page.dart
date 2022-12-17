import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/provider/auth_provider.dart';
import 'package:mubwara/views/common/components/toastzip.dart';
import 'package:mubwara/views/page/shop_main_page/shop_main_page.dart';
import '../../component/bottom_nav_bar.dart';
import '../../component/reservation_list.dart';
import '../../component/review_list.dart';
import '../../component/subscribe_list.dart';

class MyPage extends ConsumerStatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MyPage> createState() => _MyPageState();
}

class _MyPageState extends ConsumerState<MyPage>
    with SingleTickerProviderStateMixin {
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
        _buildButton(
            buttonName: "로그아웃",
            buttonBackgroundColor: Colors.red,
            onPressed: () {
              ref.read(authProvider).logout(ref);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RootTab(),
                ),
              );
              showLogoutToast();
            }),
        SizedBox(height: 30),
        _buildButton(
          buttonName: "내 가게 등록",
          buttonBackgroundColor: Colors.blue,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShopMain(),
              ),
            );
          },
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
    );
  }

  Widget _buildButton(
      {required String buttonName,
      required Color buttonBackgroundColor,
      required onPressed}) {
    return Container(
      width: double.infinity,
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: buttonBackgroundColor,
        ),
        onPressed: onPressed,
        child: Text(
          "${buttonName}",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
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
      children: [ReservationList(), ShopList(), ReviewList()],
    );
  }
}
