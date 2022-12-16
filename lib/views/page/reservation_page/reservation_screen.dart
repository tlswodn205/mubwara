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
import '../payment_page/basket_page.dart';
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
  int maxPeople = 0;
  int time = 0;
  late bool selectedPerson = false;
  late bool selectedTime = false;

  DateTime focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final rm = ref.watch(reservationScreenModel);
    final rc = ref.read(reservationController);

    return _buildReservationPage(rc, rm);
  }

  Widget _buildReservationPage(ReservationController rc, ReservationDmo rm) {
    return DefaultLayout(
      title: '예약페이지',
      bottomNavigationBar: reservationBottomBar(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => BasketPage(
                  shopId: widget.shopId,
                  maxPeople: maxPeople,
                  selectDay: selectedDay,
                  time: time),
            ),
          );
        },
      ),
      child: Column(
        children: [
          Calendar(
            // selectMethod: {
            //   return rc.reservationPerson(selectedDay, widget.shopId);
            // },
            selectMethod: () {
              rc.reservationPerson(selectedDay, widget.shopId);
            },
            selectedDay: selectedDay,
            focusedDay: focusedDay,
            onDaySelected: onDaySelected,
          ),
          SizedBox(
            height: 8.0,
          ),
          TodayBanner(
              selectedDay: selectedDay,
              scheduleCount: rm.reservationTime.length),
          SizedBox(
            height: 8.0,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(12),
            child: Row(children: <Widget>[
              for (int i = 0; i < rm.reservationPerson.length; i++)
                PersonnelCard(
                  maxPeople: maxPeople,
                  personal: rm.reservationPerson[i],
                  onPress: () {
                    rc.reservationTime(
                        selectedDay, widget.shopId, rm.reservationPerson[i]);
                    maxPeople = rm.reservationPerson[i];
                  },
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
                    onPress: () {
                      time = rm.reservationTime[i];
                      print(time);
                      print(maxPeople);
                    },
                    reservation_time: '${rm.reservationTime[i]}:00',
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
