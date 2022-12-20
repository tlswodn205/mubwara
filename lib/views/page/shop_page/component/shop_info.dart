import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/controller/customer/review_controller.dart';
import 'package:mubwara/domain/review/review.dart';
import 'package:mubwara/views/component/model/review_list_model.dart';
import 'package:mubwara/views/component/review_list_item.dart';
import 'package:mubwara/views/page/shop_page/component/shop_info_list.dart';

import '../../../../dto/response/option_resp_dto.dart';

class ShopInfo extends ConsumerStatefulWidget {
  const ShopInfo({required this.optionList, Key? key}) : super(key: key);
  final List<OptionListRespDto> optionList;
  @override
  ConsumerState<ShopInfo> createState() => _ShopInfoState();
}

class _ShopInfoState extends ConsumerState<ShopInfo> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return ShopOptionList();
      },
    );
  }
}
