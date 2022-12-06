import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mubwara/views/common/const/color.dart';
import 'package:mubwara/views/layout/default_layout.dart';
import 'package:mubwara/views/page/alarm_page/alarm_page.dart';
import 'package:mubwara/views/page/reservation_management_page/reservation_management_page.dart';
import 'package:mubwara/views/page/shop_analysis_page/shop_analysis_page.dart';
import 'package:mubwara/views/page/shop_management_page/shop_management_page.dart';
import 'package:mubwara/views/page/shop_my_page/shop_my_page.dart';

class ShopMainPage extends StatefulWidget {
  static String get routeName => 'home';
  const ShopMainPage({Key? key}) : super(key: key);

  @override
  State<ShopMainPage> createState() => _ShopMainPageState();
}

class _ShopMainPageState extends State<ShopMainPage> with SingleTickerProviderStateMixin{
  late TabController controller;
  int index = 0;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 4, vsync: this);

    controller.addListener(tabListener);
  }

  @override
  void dispose() {
    controller.removeListener(tabListener);

    super.dispose();
  }

  void tabListener() {
    setState(() {
      index = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '내 가게 관리',
      child: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          ShopMyPage(),
          ShopAnalysisPage(),
          AlarmPage(),
          ReservationManagementPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: PRIMARY_COLOR,
        unselectedItemColor: Body_TEXT_COLOR,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          controller.animateTo(index);
        },
        currentIndex: index,
        items: [
          _buildButtomNavigatorBarButton("마이페이지", FontAwesomeIcons.user),
          _buildButtomNavigatorBarButton("예약 분석", CupertinoIcons.chart_bar_alt_fill),
          _buildButtomNavigatorBarButton("알림", CupertinoIcons.alarm),
          _buildButtomNavigatorBarButton("예약 관리", CupertinoIcons.table_badge_more),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildButtomNavigatorBarButton(text, IconData icons) {
    return BottomNavigationBarItem(
      label: text,
      icon: Icon(
        icons,
        color: Colors.black,
      ),
    );
  }
}
