import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/domain/shop/shop_http_repository.dart';
import 'package:mubwara/dto/response/shop_resp_dto.dart';

final shopDetailPageModel =
    StateNotifierProvider.family<ShopDetailPageModel, ShopDetailRespDto?, int>(
        (ref, id) {
  return ShopDetailPageModel(null, ref)..initViewModel(id);
});

class ShopDetailPageModel extends StateNotifier<ShopDetailRespDto?> {
  Ref _ref;

  ShopDetailPageModel(super.state, this._ref);

  void initViewModel(int id) async {
    ShopDetailRespDto shopDetailRespDto =
        await _ref.read(shopHttpRepository).shopDetail(id);
    state = shopDetailRespDto;
    if (state?.menu == null) {
      state?.menu = [];
    }

    if (state?.option == null) {
      state?.option = [];
    }

    if (state?.review == null) {
      state?.review = [];
    }
  }

  void subscribe(int subscribeId) async {
    state?.subscribeId = subscribeId;
  }
}
