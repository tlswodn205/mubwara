import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/controller/menu_controller.dart';
import 'package:mubwara/dto/response/menu_resp_dto.dart';
import 'package:mubwara/views/layout/default_layout.dart';
import 'package:mubwara/views/page/reservation_management_page/component/menu_bottom_sheet.dart';
import 'package:mubwara/views/page/reservation_management_page/component/menucard.dart';
import 'package:mubwara/views/page/reservation_management_page/model/menu_model.dart';

class ShopMenuPage extends ConsumerStatefulWidget {
  const ShopMenuPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ShopMenuPage> createState() => _ShopMenuPageState();
}

class _ShopMenuPageState extends ConsumerState<ShopMenuPage> {
  @override
  Widget build(BuildContext context) {
    final mr = ref.watch(menuListModel);
    final mc = ref.read(menuController);
    return DefaultLayout(
      title: '메뉴 관리',
      child: Scaffold(
        floatingActionButton: menuaddbutton(),
        body: RefreshIndicator(
          onRefresh: () => mc.refresh(),
          child: ListView.builder(
            itemCount: mr.length,
            itemBuilder: (context, index){
              return _buildMenu(index, mr, mc);
            },
          ),
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

  Widget _buildMenu(int ListIndex, List<MenuRespDto> mr, MenuController mc) {
    return GestureDetector(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: MenuCard(
            image: Image.memory(
              base64Decode(mr[ListIndex].imageFileDto.image),
              width: 110,
              height: 110,
              fit: BoxFit.cover,
            ),
            menu_name: '${mr[ListIndex].name}',
            menu_price: '${mr[ListIndex].price}',
            id: mr[ListIndex].id,
            mc: mc,
          ),
        ),
      ),
    );
  }
}
