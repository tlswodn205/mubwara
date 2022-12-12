import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/controller/menu_controller.dart';
import 'package:mubwara/views/page/reservation_management_page/model/menu_model.dart';

class ShopMenu extends ConsumerStatefulWidget {
  const ShopMenu({Key? key}) : super(key: key);

  @override
  ConsumerState<ShopMenu> createState() => _ShopMenuState();
}

class _ShopMenuState extends ConsumerState<ShopMenu> {
  @override
  Widget build(BuildContext context) {
    final mr = ref.watch(menuListModel);
    final mc = ref.read(menuController);
    return RefreshIndicator(
      onRefresh: () => mc.refresh(),
      child: ListView.builder(
        itemCount: mr.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Row(
                children: [
                  Container(
                    child: Center(
                      child: Image.asset(
                        'assets/images/review/ddeok_bok_gi.jpg',
                        width: 110,
                        height: 110,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '떡볶이\n',
                          style: TextStyle(fontSize: 17),
                        ),
                        Text(
                          '가격 : 15000',
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
