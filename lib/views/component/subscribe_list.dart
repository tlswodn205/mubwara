import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/controller/customer/subscribe_controller.dart';
import 'package:mubwara/dto/response/shop_resp_dto.dart';
import 'package:mubwara/views/component/model/subscribe_list_model.dart';
import 'package:mubwara/views/component/subscribe_list_item.dart';

class ShopList extends ConsumerStatefulWidget {
  const ShopList({Key? key}) : super(key: key);

  @override
  ConsumerState<ShopList> createState() => _ShopListState();
}

class _ShopListState extends ConsumerState<ShopList> {
  @override
  Widget build(BuildContext context) {
    final sm = ref.watch(subscribeListModel);
    final sc = ref.read(subscribecontroller);
    if (sm.length == 0) {
      return Center(
        child: Text("등록한 구독이 없습니다."),
      );
    }
    return RefreshIndicator(
      onRefresh: () => sc.refresh(),
      child: ListView.builder(
        itemCount: sm.length,
        itemBuilder: (context, index) {
          return ShopListItem(
            listIndex: index,
            rm: sm,
          );
        },
      ),
    );
  }
}
