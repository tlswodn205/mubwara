import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mubwara/provider/auth_provider.dart';
import 'package:mubwara/views/common/const/color.dart';
import 'package:mubwara/views/layout/default_layout.dart';
import 'package:mubwara/views/page/board_page/board_page.dart';
import 'package:mubwara/views/page/home_page/home_page.dart';
import 'package:mubwara/views/page/login_page/login_page.dart';
import 'package:mubwara/views/page/map_page/map_page.dart';
import 'package:mubwara/views/page/my_page/my_page.dart';
import 'package:mubwara/views/page/review_write_page/review_write_page.dart';
import 'package:mubwara/views/page/search_page/search_page.dart';

import '../common/components/address_component.dart';
import '../common/components/multi_image_uploader.dart';
import '../common/components/single_image_uploader.dart';
import '../page/login_page/login_page.dart';

class RootTab extends ConsumerStatefulWidget {
  static String get routeName => 'home';

  RootTab({Key? key}) : super(key: key);

  @override
  ConsumerState<RootTab> createState() => _RootTabState();
}

class _RootTabState extends ConsumerState<RootTab>
    with SingleTickerProviderStateMixin {
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
    if (ref.watch(authProvider).isLogin) {
      return DefaultLayout(
        title: '캐치테이블',
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
    } else {
      return DefaultLayout(
        title: '캐치테이블',
        child: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller,
          children: [
            HomePage(),
            MapPage(),
            SearchPage(),
            ReviewWritePage(),
            LoginPage(),
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
