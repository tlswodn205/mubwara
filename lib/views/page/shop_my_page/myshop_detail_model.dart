import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/domain/shop/shop_http_repository.dart';

final myshopDetailModel =
StateNotifierProvider.family<MyShopDetailRespDto, MyShopDetailRespDto?, int>(
        (ref, id) {
      return MyShopDetailRespDto(null, ref)..initViewModel(id);
    });

class MyShopDetailRespDto extends StateNotifier<MyShopDetailRespDto?> {
  Ref _ref;

  MyShopDetailRespDto(super.state, this._ref);

  void initViewModel(int id) async {
    MyShopDetailRespDto myShopDetailRespDto =
    (await _ref.read(shopHttpRepository).myshopDetail(id)) as MyShopDetailRespDto;
    state = myShopDetailRespDto;
  }
}