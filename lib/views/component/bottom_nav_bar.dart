import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mubwara/views/common/const/color.dart';
import 'package:mubwara/views/layout/default_layout.dart';
import 'package:mubwara/views/page/board_page/board_page.dart';
import 'package:mubwara/views/page/home_page/home_page.dart';
import 'package:mubwara/views/page/login_page/login_page.dart';
import 'package:mubwara/views/page/map_page/map_page.dart';
import 'package:mubwara/views/page/my_page/my_page.dart';
import 'package:mubwara/views/page/search_page/search_page.dart';

class RootTab extends StatefulWidget {
  static String get routeName => 'home';

  const RootTab({index, Key? key}) : super(key: key);

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin {
  late TabController controller;

  int index = 0;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 5, vsync: this);

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
      title: '무바라',
      child: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          HomePage(),
          MapPage(),
          SearchPage(),
          BoardPage(),
          MyPage(),
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
          _buildButtomNavigatorBarButton("홈", CupertinoIcons.home),
          _buildButtomNavigatorBarButton("지도", CupertinoIcons.map),
          _buildButtomNavigatorBarButton("검색", CupertinoIcons.search),
          _buildButtomNavigatorBarButton("게시판", FontAwesomeIcons.table),
          _buildButtomNavigatorBarButton("마이페이지", FontAwesomeIcons.user),
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
