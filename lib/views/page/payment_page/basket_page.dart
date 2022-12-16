import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/views/layout/default_layout.dart';
import 'package:mubwara/views/page/payment_page/component/payment_nav_bar.dart';
import 'package:mubwara/views/page/payment_page/component/reservation_card.dart';

class BasketPage extends ConsumerWidget {
  const BasketPage(
      {required this.maxPeople,
      required this.selectDay,
      required this.time,
      required this.shopId,
      Key? key})
      : super(key: key);

  final int maxPeople;
  final DateTime selectDay;
  final int? time;
  final int shopId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      title: '결제 화면',
      bottomNavigationBar: PaymentNavBar(
        maxPeople: maxPeople,
        selectDay: selectDay,
        time: time,
        shopId: shopId,
      ),
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ReservationCard(
                      Shop_name: '쉐프의 떡볶이',
                      reservation_time: '${time}:00',
                      reservation_pay: 10000,
                      reservation_date: '${selectDay.month}/${selectDay.day}',
                      personal: maxPeople,
                      customer_name: '박동훈'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
