import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/domain/shop/shop_http_repository.dart';
import 'package:mubwara/dto/response/shop_resp_dto.dart';

final searchPageModel =
    StateNotifierProvider<SearchPageModel, List<ShopSearchList>>((ref) {
  return SearchPageModel([], ref)..initViewModel();
});

class SearchPageModel extends StateNotifier<List<ShopSearchList>> {
  Ref _ref;
  SearchPageModel(super.state, this._ref);

  void initViewModel() async {
    List<ShopSearchList> shopSearchList =
        await _ref.read(shopHttpRepository).searchShopList();
    state = shopSearchList;
    print(shopSearchList[0].shopName);
  }
  //
  // void refresh(List<Product> productsDto) {
  //   state = productsDto;
  // }
  //
  // void addProduct(Product productRespDto) {
  //   state = [...state, productRespDto];
  // }
  //
  // void removeProduct(int id) {
  //   state = state.where((product) => product.id != id).toList();
  // }
  //
  // void updateProduct(Product productRespDto) {
  //   state = state.map((product) {
  //     if (product.id == productRespDto.id) {
  //       return productRespDto;
  //     } else {
  //       return product;
  //     }
  //   }).toList();
  // }
}
