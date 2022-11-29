import 'package:flutter/material.dart';
import 'package:mubwara/views/common/const/color.dart';

class ReservationCard extends StatefulWidget {
  final int personal;
  final String reservation_date;
  final String reservation_time;
  final String customer_name;
  final String Shop_name;
  final int reservation_pay;

  const ReservationCard(
      {required this.personal,
      required this.reservation_time,
      required this.reservation_date,
      required this.customer_name,
      required this.Shop_name,
      required this.reservation_pay,
      Key? key})
      : super(key: key);

  @override
  State<ReservationCard> createState() => _ReservationCardState();
}

class _ReservationCardState extends State<ReservationCard> {
  bool _isChecked = false;
  bool _isChecked1 = false;

  @override
  Widget build(BuildContext context) {
    var reservation_paynent = widget.reservation_pay * widget.personal;
    return Column(
      children: [
        const SizedBox(height: 16.0),
        Text(
          '방문 일정을 확인해 주세요.',
          style: TextStyle(
            color: PRIMARY_COLOR,
            fontSize: 25.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 16.0),
        const SizedBox(height: 16.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '가게 명 : ${widget.Shop_name}',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                '예약자 성함 : ${widget.customer_name}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                '예약금 : $reservation_paynent원',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8.0),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Body_TEXT_COLOR2,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    _IconText(
                      icon: Icons.people,
                      label: '${widget.personal}명',
                    ),
                    renderDot(),
                    _IconText(
                      icon: Icons.calendar_month_outlined,
                      label: '날짜 : ${widget.reservation_date}',
                    ),
                    renderDot(),
                    _IconText(
                      icon: Icons.timelapse_rounded,
                      label: '시간 : ${widget.reservation_time}',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '레스토랑 유의 사항',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  _IconText(
                    icon: Icons.check,
                    label: '예약 시 꼭 확인해 주세요!',
                  ),
                  const SizedBox(height: 8.0),
                  const SizedBox(height: 8.0),
                  Text('예약 시간 30분 이내 방문하지 않을 시 자동으로 예약이 취소됨을 알려드립니다.'),
                  const SizedBox(height: 8.0),
                  Text(
                    '확인해주세요',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _isChecked,
                        onChanged: (value) {
                          setState(() {
                            _isChecked = value!;
                          });
                        },
                      ),
                      Text(
                        '당일 예약 변동은 매장으로 전화주세요.'
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _isChecked1,
                        onChanged: (value) {
                          setState(() {
                            _isChecked1 = value!;
                          });
                        },
                      ),
                      Text(
                          '예약시간을 꼭 지켜주세요.'
                      )
                    ],
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
          size: 15.0,
        ),
        const SizedBox(width: 8.0),
        Text(
          label,
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
