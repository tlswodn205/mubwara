import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/controller/reservation_controller.dart';
import 'package:mubwara/views/layout/default_layout.dart';
import 'package:mubwara/views/page/reservation_page/component/calenar.dart';
import 'package:mubwara/views/page/reservation_page/component/personnel_card.dart';
import 'package:mubwara/views/page/reservation_page/component/schedule_card.dart';
import 'package:mubwara/views/page/reservation_page/component/today_banner.dart';
import 'package:mubwara/views/page/reservation_page/reservation_screen_model.dart';
import 'package:mubwara/views/page/shop_page/component/reservationbottombar.dart';

import '../../../dto/request/reservation_req_dto.dart';
import '../shop_page/component/reservationbottombar.dart';

class reservationScreen extends ConsumerStatefulWidget {
  const reservationScreen({required this.shopId, Key? key}) : super(key: key);

  final int shopId;
  @override
  ConsumerState<reservationScreen> createState() => _reservationScreenState();
}

class _reservationScreenState extends ConsumerState<reservationScreen> {
  DateTime selectedDay = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  late ReservationSelectReqDto reservationSelectReqDto;
  late int maxPeople;

  DateTime focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final rm = ref.watch(reservationScreenModel);
    final rc = ref.read(reservationController);

    searchTime(int i) {
      rc.reservationTime(selectedDay, widget.shopId, rm.reservationPerson[i]);
      maxPeople = rm.reservationPerson[i];
    }

    return DefaultLayout(
      title: '예약페이지',
      bottomNavigationBar: reservationBottomBar(),
      child: Column(
        children: [
          Calendar(
            selectMethod: rc.reservationPerson(selectedDay, widget.shopId),
            selectedDay: selectedDay,
            focusedDay: focusedDay,
            onDaySelected: onDaySelected,
          ),
          SizedBox(
            height: 8.0,
          ),
          TodayBanner(selectedDay: selectedDay, scheduleCount: 3),
          SizedBox(
            height: 8.0,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(12),
            child: Row(children: <Widget>[
              for (int i = 0; i < rm.reservationPerson.length; i++)
                PersonnelCard(
                  personal: rm.reservationPerson[i],
                  onPress: searchTime(i),
                ),
            ]),
          ),
          SizedBox(
            height: 8.0,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(12),
            child: Row(
              children: <Widget>[
                for (int i = 0; i < rm.reservationTime.length; i++)
                  SceduleCard(
                    reservation_time: '11:00',
                    selectMethod: null,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(
      () {
        this.selectedDay = selectedDay;
        this.focusedDay = selectedDay;
      },
    );
  }
}
