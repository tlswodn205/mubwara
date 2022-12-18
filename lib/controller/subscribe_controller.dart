import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:mubwara/controller/user_controller.dart';
import 'package:mubwara/domain/shop/shop_http_repository.dart';
import 'package:mubwara/domain/subscribe/subscribe_http_repository.dart';
import 'package:mubwara/dto/request/shop_req_dto.dart';
import 'package:mubwara/dto/response/shop_resp_dto.dart';
import 'package:mubwara/views/page/search_page/search_page.dart';
import 'package:mubwara/views/page/search_page/search_page_model.dart';
import 'package:mubwara/views/page/shop_page/shop_detail_model.dart';
import '../main.dart';

final subscribeController = Provider<SubscribeController>((ref) {
  return SubscribeController(ref);
});

class SubscribeController {
  Ref _ref;
  SubscribeController(this._ref);

  void subscribeButtonClick(int? subscribeId, int shopId) async {
    if (subscribeId == 0) {
      int newSubscribeId = await _ref.read(subscribeHttpRepository).insertSubscribe(shopId);
      _ref.read(shopDetailPageModel(shopId).notifier).subscribe(newSubscribeId);
    } else {
      _ref.read(subscribeHttpRepository).deleteSubscribe(subscribeId);
      _ref.read(shopDetailPageModel(shopId).notifier).subscribe(0);
    }
  }
}
