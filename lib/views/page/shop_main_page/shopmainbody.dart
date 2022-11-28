import 'package:flutter/material.dart';
import 'package:mubwara/views/page/alarm_page/alarm_page.dart';
import 'package:mubwara/views/page/reservation_management_page/reservation_management_page.dart';
import 'package:mubwara/views/page/shop_analysis_page/shop_analysis_page.dart';
import 'package:mubwara/views/page/shop_management_page/shop_management_page.dart';
import 'package:mubwara/views/page/shop_my_page/shop_my_page.dart';

class ShopMainBody extends StatelessWidget {
  const ShopMainBody({required this.selectedIndex, Key? key}) : super(key: key);
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: selectedIndex,
      children: [
        ShopManagementPage(),
        ReservationManagementPage(),
        ShopAnalysisPage(),
        AlarmPage(),
        ShopMyPage(),
      ],
    );
  }
}
