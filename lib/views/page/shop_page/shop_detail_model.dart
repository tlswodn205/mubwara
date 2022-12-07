import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/domain/shop/shop_http_repository.dart';
import 'package:mubwara/dto/response/shop_resp_dto.dart';

final shopDetailPageModel =
    StateNotifierProvider.family<ShopDetailPageModel, ShopDetailRespDto?, int>(
        (ref, id) {
  return ShopDetailPageModel(ref)..initViewModel(id);
});

class ShopDetailPageModel extends StateNotifier<ShopDetailRespDto?> {
  Ref _ref;

  ShopDetailPageModel(this._ref) : super(null);

  void initViewModel(int id) async {
    ShopDetailRespDto shopDetailRespDto =
        await _ref.read(shopHttpRepository).shopDetail(id);
    state = shopDetailRespDto;
  }
}
