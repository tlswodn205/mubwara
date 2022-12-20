import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:mubwara/views/common/const/color.dart';

class DefaultLayout extends StatelessWidget {
  final Color? backgroundColor;
  final Widget child;
  final String? title;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;

  const DefaultLayout({
    required this.child,
    this.backgroundColor,
    this.title,
    this.bottomNavigationBar,
    this.floatingActionButton,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? INPUT_BG_COLOR,
      appBar: renderAppBar(),
      body: child,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }

  AppBar? renderAppBar() {
    if (title == null) {
      return null;
    } else {
      return AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        backgroundColor: INPUT_BG_COLOR,
        elevation: 0,
        actions: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 25,
                  right: 5
                ),
                child: Icon(
                  Icons.notifications,
                  size: 30,
                ),
              ),
              Positioned(
                top: 30,
                right: -1,
                child: Badge(
                  shape: BadgeShape.circle,
                  badgeColor: BADGE_COLOR,
                  borderRadius: BorderRadius.circular(
                    5,
                  ),
                  badgeContent: Text(
                    '0',
                    style: TextStyle(
                      color: INPUT_BG_COLOR,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
        title: Text(
          title!,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        foregroundColor: Colors.black,
      );
    }
  }
}
