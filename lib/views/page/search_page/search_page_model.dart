import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/domain/shop/shop_http_repository.dart';
import 'package:mubwara/dto/response/board_resp_dto.dart';
import 'package:mubwara/dto/response/shop_resp_dto.dart';

final searchPageModel =
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

  void categoryOption() async {
    List<ShopSearchListDto> shopSearchDtoList =
        await _ref.read(shopHttpRepository).shopOption();
    state = shopSearchDtoList;
  }

  void categoryModel(String categoryName) async {
    List<ShopSearchListDto> shopSearchDtoList =
        await _ref.read(shopHttpRepository).shopCategory(categoryName);
    state = shopSearchDtoList;
  }
  
  void regionModel(String region) async {
    List<ShopSearchListDto> shopSearchDtoList =
    await _ref.read(shopHttpRepository).shopRegionList(region);
    state = shopSearchDtoList;
  }
  
  void popularModel() async {
    List<ShopSearchListDto> shopPopularList =
        await _ref.read(shopHttpRepository).shopPopularList();
    state = shopPopularList;
  }

  void ViewModel(String value) async {
    List<ShopSearchListDto> priceList =
        await _ref.read(shopHttpRepository).shopPriceList(value);
    print(priceList.toString());

    state = priceList;
  }

  //
  void refresh(List<ShopSearchListDto> shopSearchDtoList) {
    state = shopSearchDtoList;
    print(shopSearchDtoList.length);
  }

  void shopSearch(List<ShopSearchListDto> shopSearchDtoList) {
    state = shopSearchDtoList;
    print(shopSearchDtoList.length);
  }
}
