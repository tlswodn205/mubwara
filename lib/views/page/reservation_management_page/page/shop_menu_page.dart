import 'package:flutter/material.dart';
import 'package:mubwara/views/layout/default_layout.dart';
import 'package:mubwara/views/page/reservation_management_page/component/menu_bottom_sheet.dart';
import 'package:mubwara/views/page/reservation_management_page/component/menucard.dart';

class ShopMenuPage extends StatefulWidget {
  const ShopMenuPage({Key? key}) : super(key: key);

  @override
  State<ShopMenuPage> createState() => _ShopMenuPageState();
}

class _ShopMenuPageState extends State<ShopMenuPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '메뉴 관리',
      child: Scaffold(
        floatingActionButton: menuaddbutton(),
        body: ListView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: MenuCard(
                  image: Image.asset(
                    'assets/images/review/ddeok_bok_gi.jpg',
                    width: 110,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                  menu_name: '떡볶이',
                  menu_price: 15000,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  FloatingActionButton menuaddbutton() {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) {
            return ReservationBottomSheet();
          },
        );
      },
      child: Icon(Icons.add),
    );
  }
}
