import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/views/layout/default_layout.dart';
import 'package:mubwara/views/page/reservation_management_page/component/order_cancle_card.dart';

class ReservationCanclePage extends ConsumerWidget {
  const ReservationCanclePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      title: '예약 취소리스트',
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: SingleChildScrollView(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: OrderCancleCard(
                    reservation_date: DateTime.now(),
                    image: Image.asset('assets/images/review/ddeok_bok_gi.jpg',
                      fit: BoxFit.cover,width: 50,height: 50,),
                    reservation_time: '19:00',
                    personal: 6,
                    customer_name: '박동훈',
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
