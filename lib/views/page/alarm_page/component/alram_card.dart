import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/controller/reservation_controller.dart';
import 'package:mubwara/views/common/const/color.dart';

class AlramCard extends ConsumerStatefulWidget {
  // 예약자 이름
  final String customer_name;

  // 주소
  final String reservation_date;

  // 가게 소개
  final String reservation_time;

  // 전화번호
  final String table_max_people;

  final bool isCheck;

  final String AlarmId;
  AlramCard({
    required this.AlarmId,
    required this.customer_name,
    required this.reservation_date,
    required this.reservation_time,
    required this.table_max_people,
    required this.isCheck,
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<AlramCard> createState() => _AlramCardState();
}

class _AlramCardState extends ConsumerState<AlramCard> {
  late bool _isSelected = widget.isCheck;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '예약자 성함 : ${widget.customer_name}',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isSelected = true;
                      });

                      _isSelected
                          ? (ref
                              .read(reservationController)
                              .reservationAlarmCheck(widget.AlarmId))
                          : (ref
                              .read(reservationController)
                              .reservationAlarmCheck(widget.AlarmId));
                    },
                    child: Container(
                      width: 66,
                      color: _isSelected ? SELECTED_COLOR : PRIMARY_COLOR,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _isSelected
                              ? Icon(Icons.notifications,
                                  color: Body_TEXT_COLOR1)
                              : Icon(Icons.notifications_active,
                                  color: Body_TEXT_COLOR1),
                          Text(
                            _isSelected ? "읽음" : "안읽음",
                            style: TextStyle(
                              color: Body_TEXT_COLOR1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  _IconText(
                    icon: Icons.calendar_month_outlined,
                    label: '예약 날짜 : ${widget.reservation_date}',
                  ),
                  renderDot(),
                  _IconText(
                    icon: Icons.timelapse_outlined,
                    label: '예약 시간 : ${widget.reservation_time} ',
                  ),
                  renderDot(),
                  _IconText(
                    icon: Icons.people,
                    label: '${widget.table_max_people} 명',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget renderDot() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Text(
        '·',
        style: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _IconText extends StatelessWidget {
  final IconData icon;
  final String label;

  const _IconText({required this.icon, required this.label, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: PRIMARY_COLOR,
          size: 14.0,
        ),
        const SizedBox(width: 8.0),
        Text(
          label,
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
