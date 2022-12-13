import 'package:flutter/material.dart';
import 'package:mubwara/views/common/const/color.dart';
import 'package:mubwara/views/page/shop_my_page/shop_my_page.dart';
import 'package:mubwara/views/page/shop_my_page/shop_my_page_update.dart';

class ShopMyPageManagement extends StatelessWidget {
  const ShopMyPageManagement({

    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => ShopMyPage(),
                    ),
                  );
                },
                child: Container(
                  height: 56,
                  width: 300,
                  alignment: Alignment.center,
                  color: PRIMARY_COLOR,
                  child: Text("신규등록",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Body_TEXT_COLOR1)),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => ShopMyPageUpdate(),
                    ),
                  );
                },
                child: Container(
                  height: 56,
                  width: 300,
                  alignment: Alignment.center,
                  color: PRIMARY_COLOR,
                  child: Text("내 가게 정보 확인",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Body_TEXT_COLOR1)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

