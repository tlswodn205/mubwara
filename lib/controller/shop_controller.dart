import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/domain/shop/shop_http_repository.dart';
import 'package:mubwara/dto/response/shop_resp_dto.dart';
import 'package:mubwara/views/page/search_page/search_page_model.dart';
import 'package:flutter/material.dart';

import '../dto/response/shop_resp_dto.dart';
import '../main.dart';

final shopController = Provider<ShopController>((ref) {
  return ShopController(ref);
});

class ShopController {
  final context = navigatorKey.currentContext!;
  final Ref _ref;
  ShopController(this._ref);

  void searchShopList() async {
    List<ShopSearchList> shopSearchList =
        await _ref.read(shopHttpRepository).searchShopList();
    _ref.read(searchPageModel.notifier).initViewModel();
  }
}
