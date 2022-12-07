import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/domain/shop/shop_http_repository.dart';
import 'package:mubwara/dto/response/shop_resp_dto.dart';

final shopDetailPage =
    StateNotifierProvider<SearchPageModel, List<ShopSearchListDto>>((ref) {
  return SearchPageModel([], ref)..initViewModel();
});

class SearchPageModel extends StateNotifier<List<ShopSearchListDto>> {
  Ref _ref;

  SearchPageModel(super.state, this._ref);

  void initViewModel() async {
    List<ShopSearchListDto> shopSearchDtoList =
        await _ref.read(shopHttpRepository).searchShopList();
    state = shopSearchDtoList;
  }
}
