import 'package:flutter/material.dart';
import 'package:mubwara/views/layout/default_layout.dart';
import 'package:mubwara/views/page/reservation_management_page/component/schedule_banner.dart';
import 'package:mubwara/views/page/reservation_management_page/component/table_card.dart';
import 'package:mubwara/views/page/reservation_page/component/calenar.dart';
import 'package:mubwara/views/page/reservation_page/component/today_banner.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  DateTime selectedDay = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '스케쥴 관리',
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Calendar(
                selectedDay: selectedDay,
                focusedDay: focusedDay,
                onDaySelected: onDaySelected,
              ),
              SizedBox(
                height: 8.0,
              ),
              ScheduleBanner(selectedDay: selectedDay, scheduleCount: 3),
              SizedBox(
                height: 8.0,
              ),
              _TableList(),
            ],
          ),
        ),
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
class _TableList extends StatelessWidget {
  const _TableList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView.separated(
          itemCount: 3,
          separatorBuilder: (context, index){
            return SizedBox(height: 8.0);
          },
          itemBuilder: (context, index) {
            return TableCard(
              startTime: 11,
              endTime: 24,
              max_people: 5,
            );
          },
        ),
      ),
    );
  }
}
