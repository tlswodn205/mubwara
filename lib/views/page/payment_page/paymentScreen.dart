import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mubwara/views/common/const/color.dart';
import 'package:mubwara/views/component/bottom_nav_bar.dart';
import 'package:mubwara/views/layout/default_layout.dart';
import 'package:mubwara/views/page/main_page/main_page.dart';
import 'package:mubwara/views/page/shop_page/shop_detail.dart';

class paymentScreen extends StatelessWidget {
  const paymentScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '결제 확인 페이지',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.thumb_up_alt_outlined,
              color: PRIMARY_COLOR,
              size: 50.0,
            ),
            const SizedBox(height: 32.0),
            Text(
              '결제가 완료되었습니다.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => RootTab()));
              },
              style: ElevatedButton.styleFrom(
                primary: PRIMARY_COLOR,
              ),
              child: Text(
                '가게 상세페이지로',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
