import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/controller/user_controller.dart';
import 'package:mubwara/domain/shop/shop_http_repository.dart';
import 'package:mubwara/domain/subscribe/subscribe_http_repository.dart';
import 'package:mubwara/dto/request/shop_req_dto.dart';
import 'package:mubwara/dto/response/shop_resp_dto.dart';
import 'package:mubwara/views/page/search_page/search_page.dart';
import 'package:mubwara/views/page/search_page/search_page_model.dart';
import '../main.dart';

final subscribeController = Provider<SubscribeController>((ref) {
  return SubscribeController(ref);
});

class SubscribeController {
  Ref _ref;
  SubscribeController(this._ref);

  void subscribeButtonClick(bool isSubscribe, int shopId) {
    if (isSubscribe) {
      _ref.read(subscribeHttpRepository).deleteSubscribe(shopId);
    } else {
      _ref.read(subscribeHttpRepository).insertSubscribe(shopId);
    }
  }
}
