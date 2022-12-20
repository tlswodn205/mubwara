import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/reservation/reservation_firestore_repository.dart';
import '../../dto/response/reservation_resp_dto.dart';

class DefaultLayout extends ConsumerWidget {
  final Color? backgroundColor;
  final Widget child;
  final String? title;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  late int count;
  DefaultLayout({
    required this.child,
    this.backgroundColor,
    this.title,
    this.bottomNavigationBar,
    this.floatingActionButton,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataList = ref.watch(countAlarm);
    dataList.when(
        data: (reservationAlarmRespDto) {
          if (reservationAlarmRespDto.isEmpty) {
            count = 0;
          } else {
            count = reservationAlarmRespDto.length;
          }
        },
        error: (Object error, StackTrace stackTrace) {},
        loading: () {});
    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.white,
      appBar: renderAppBar(count: count),
      body: child,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }

  AppBar? renderAppBar({required int count}) {
    if (title == null) {
      return null;
    } else {
      return AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: 25, right: 5),
                child: Icon(
                  Icons.notifications,
                  size: 30,
                ),
              ),
              // count == 0
              //     ? Container()
              //     : Container(
              //         child: Positioned(
              //           top: 30,
              //           right: -1,
              //           child: Badge(
              //             shape: BadgeShape.circle,
              //             badgeColor: Colors.red,
              //             borderRadius: BorderRadius.circular(
              //               5,
              //             ),
              //             badgeContent: Text(
              //               '${count}',
              //               style: TextStyle(
              //                 color: Colors.white,
              //               ),
              //             ),
              //           ),
              //         ),
              //       )
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
