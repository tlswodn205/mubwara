import 'package:flutter/material.dart';
import 'package:mubwara/views/common/const/color.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../controller/customer/reservation_controller.dart';

class Calendar extends StatelessWidget {
  final DateTime? selectedDay;
  final DateTime focusedDay;
  final OnDaySelected? onDaySelected;
  final selectMethod;

  const Calendar(
      {this.selectMethod,
      required this.onDaySelected,
      required this.selectedDay,
      required this.focusedDay,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultBoxDeco = BoxDecoration(
      borderRadius: BorderRadius.circular(6.0),
      color: CALENDAR_BOX_COLOR,
    );
    final defaultTextStyle =
        TextStyle(color: Body_TEXT_COLOR, fontWeight: FontWeight.w700);
    return TableCalendar(
      locale: 'ko_KR',
      focusedDay: focusedDay,
      firstDay: DateTime.now(),
      lastDay: DateTime.utc(DateTime.now().year, DateTime.now().month + 1, 31),
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16.0,
        ),
      ),
      calendarStyle: CalendarStyle(
        isTodayHighlighted: false,
        outsideDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        defaultDecoration: defaultBoxDeco,
        weekendDecoration: defaultBoxDeco,
        selectedDecoration: BoxDecoration(
          color: INPUT_BG_COLOR,
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(
            color: CALENDAR_PRIMARY_COLOR,
            width: 1.0,
          ),
        ),
        defaultTextStyle: defaultTextStyle,
        weekendTextStyle: defaultTextStyle,
        selectedTextStyle: defaultTextStyle.copyWith(
          color: CALENDAR_PRIMARY_COLOR,
        ),
      ),
      onDaySelected: onDaySelected,
      selectedDayPredicate: (DateTime date) {
        if (selectedDay == null) {
          return false;
        }
        return date.year == selectedDay!.year &&
            date.month == selectedDay!.month &&
            date.day == selectedDay!.day;
      },
    );
  }
}
