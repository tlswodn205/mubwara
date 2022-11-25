import 'package:flutter/material.dart';
import 'package:mubwara/views/page/home_page/home_page.dart';
import 'package:mubwara/views/page/map_page/map_page.dart';
import 'package:mubwara/views/page/my_page/my_page.dart';
import 'package:mubwara/views/page/profile_update_page/profile_update_page.dart';
import 'package:mubwara/views/page/search_page/search_page.dart';

import '../../board_page/board_page.dart';

class MainBody extends StatelessWidget {
  const MainBody({required this.selectedIndex, Key? key}) : super(key: key);
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: selectedIndex,
      children: [
        HomePage(),
        MapPage(),
        SearchPage(),
        ProfileUpdatePage(),
        MyPage()
      ],
    );
  }
}
