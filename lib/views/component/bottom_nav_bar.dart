import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar(
      {required this.selectedIndex, required this.onIndexChanged, Key? key})
      : super(key: key);

  final int selectedIndex;

  final void Function(int index)? onIndexChanged;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black54,
      onTap: onIndexChanged,
      currentIndex: selectedIndex,
      items: [
        _buildButtomNavigatorBarButton("홈", CupertinoIcons.home),
        _buildButtomNavigatorBarButton("지도", CupertinoIcons.map),
        _buildButtomNavigatorBarButton("검색", CupertinoIcons.search),
        _buildButtomNavigatorBarButton("게시판", FontAwesomeIcons.table),
        _buildButtomNavigatorBarButton("마이페이지", FontAwesomeIcons.user),
      ],
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
