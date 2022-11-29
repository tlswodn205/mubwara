import 'package:flutter/material.dart';
import 'package:mubwara/views/page/shop_analysis_page/component/day_analysis.dart';
import 'package:mubwara/views/page/shop_analysis_page/component/month_analysis.dart';

import 'component/week_analysis.dart';

class ShopAnalysisPage extends StatefulWidget {
  const ShopAnalysisPage({Key? key}) : super(key: key);

  @override
  State<ShopAnalysisPage> createState() => _ShopAnalysisPageState();
}

class _ShopAnalysisPageState extends State<ShopAnalysisPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
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

  TabBar _buildTabBar() {
    return TabBar(
      controller: _tabController,
      labelColor: const Color(0xFF3baee7),
      indicatorWeight: 2,
      indicator: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.blue),
      tabs: [
        Tab(
          child: Text(
            "일일 분석",
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
        Tab(
          child: Text(
            "주간 분석",
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
        Tab(
          child: Text(
            "월간 분석",
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
      ],
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [DayAnalysis(), WeekAnalysis(), MonthAnalysis()],
    );
  }
}
