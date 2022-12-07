import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/domain/customer/customer_http_repository.dart';
import 'package:mubwara/dto/response/customer_resp_dto.dart';

final subscribeListModel =
StateNotifierProvider<SubscribeListModel, List<CustomerMyPageSubscribeRespDto>>((ref) {
  return SubscribeListModel([], ref)..initViewModel();
});

class SubscribeListModel extends StateNotifier<List<CustomerMyPageSubscribeRespDto>> {
  Ref _ref;
  SubscribeListModel(super.state, this._ref);

  void initViewModel() async {
    List<CustomerMyPageSubscribeRespDto> mypageSubscribeDtoList =
    await _ref.read(customerHttpRepository).myPageSubscribeList();
    state = mypageSubscribeDtoList;
  }

  //
  void refresh(List<CustomerMyPageSubscribeRespDto> mypageSubscribeDtoList) {
    state = mypageSubscribeDtoList;
  }
}