import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/domain/customer/customer_http_repository.dart';
import 'package:mubwara/dto/response/customer_resp_dto.dart';
import 'package:mubwara/main.dart';
import 'package:mubwara/views/component/model/subscribe_list_model.dart';

final subscribecontroller = Provider<SubscribeController>((ref) {
  return SubscribeController(ref);
});

class SubscribeController {
  final context = navigatorKey.currentContext!;
  final Ref _ref;
  SubscribeController(this._ref);

  void mySubscribeList() async {
    _ref.read(subscribeListModel.notifier).initViewModel();
  }

  Future<void> refresh() async {
    List<CustomerMyPageSubscribeRespDto> mySubscribeDtoList =
    await _ref.read(customerHttpRepository).myPageSubscribeList();
    _ref.read(subscribeListModel.notifier).refresh(mySubscribeDtoList);
    return null;
  }
}