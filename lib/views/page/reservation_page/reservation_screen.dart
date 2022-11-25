import 'package:flutter/material.dart';
import 'package:mubwara/views/layout/default_layout.dart';
import 'package:mubwara/views/page/reservation_page/component/calenar.dart';
import 'package:mubwara/views/page/reservation_page/component/personnel_card.dart';
import 'package:mubwara/views/page/reservation_page/component/schedule_card.dart';
import 'package:mubwara/views/page/reservation_page/component/today_banner.dart';
import 'package:mubwara/views/page/shop_page/component/reservationbottombar.dart';

class reservationScreen extends StatefulWidget {
  const reservationScreen({Key? key}) : super(key: key);

  @override
  State<reservationScreen> createState() => _reservationScreenState();
}

class _reservationScreenState extends State<reservationScreen> {
  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day
  );
  DateTime focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '예약페이지',
      bottomNavigationBar: reservationBottomBar(),
      child: Column(
        children: [
          Calendar(
            selectedDay: selectedDay,
            focusedDay: focusedDay,
            onDaySelected: onDaySelected,
          ),
          SizedBox(height: 8.0,),
          TodayBanner(
              selectedDay: selectedDay,
              scheduleCount: 3),
          SizedBox(height: 8.0,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(12),
              child: Row(
                  children: <Widget>[
                    SceduleCard(reservation_time: '11:00',),
                    SceduleCard(reservation_time: '12:00',),
                    SceduleCard(reservation_time: '13:00',),
                    SceduleCard(reservation_time: '14:00',),
                    SceduleCard(reservation_time: '15:00',),
                    SceduleCard(reservation_time: '16:00',),
                    SceduleCard(reservation_time: '17:00',),
                    SceduleCard(reservation_time: '18:00',),
                    SceduleCard(reservation_time: '19:00',),
                    SceduleCard(reservation_time: '20:00',),
                    SceduleCard(reservation_time: '21:00',),
                    SceduleCard(reservation_time: '22:00',),
                    SceduleCard(reservation_time: '23:00',),
                    SceduleCard(reservation_time: '24:00',),
                    SceduleCard(reservation_time: '01:00',),
                    SceduleCard(reservation_time: '02:00',),
                  ]
              ),
          ),
          SizedBox(height: 8.0,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(12),
            child: Row(
                children: <Widget>[
                  PersonnelCard(personal: 1),
                  PersonnelCard(personal: 2),
                  PersonnelCard(personal: 3),
                  PersonnelCard(personal: 4),
                  PersonnelCard(personal: 5),
                  PersonnelCard(personal: 6),
                  PersonnelCard(personal: 7),
                  PersonnelCard(personal: 8),
                  PersonnelCard(personal: 9),
                  PersonnelCard(personal: 10),
                  PersonnelCard(personal: 11),
                ]
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
