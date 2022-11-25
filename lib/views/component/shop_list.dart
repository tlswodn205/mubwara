import 'package:flutter/material.dart';
import 'package:mubwara/dto/response/shop_resp_dto.dart';
import 'package:mubwara/views/component/shop_list_item.dart';

class ShopList extends StatelessWidget {
  const ShopList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: shopList.length,
      itemBuilder: (context, index) {
        return ShopListItem(listIndex: index);
      },
    );
  }
}
