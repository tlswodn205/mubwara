import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/domain/shop/shop_http_repository.dart';
import 'package:mubwara/dto/request/shop_req_dto.dart';
import 'package:mubwara/dto/response/shop_resp_dto.dart';
import 'package:mubwara/views/page/search_page/search_page.dart';
import 'package:mubwara/views/page/search_page/search_page_model.dart';
import '../main.dart';

final shopController = Provider<ShopController>((ref) {
  return ShopController(ref);
});

class ShopController {
  final context = navigatorKey.currentContext!;
  final Ref _ref;
  ShopController(this._ref);

  void searchShopList() async {
    _ref.read(searchPageModel.notifier).initViewModel();
  }

  Future<void> searchShopListRefresh() async {
    List<ShopSearchListDto> shopSearchDtoList =
        await _ref.read(shopHttpRepository).searchShopList();
    _ref.read(searchPageModel.notifier).refresh(shopSearchDtoList);
    return null;
  }
  void shopSearchList() async {
    _ref.read(searchPageModel.notifier).initViewModel();
  }

  void myshopDetail() async {
    _ref.read(searchPageModel.notifier).initViewModel();
  }
  void shopPriceList(String value) async{
    print("헐111");

    _ref.read(searchPageModel.notifier).ViewModel(value);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchPage(),
      ),
    );
  }
  void shopPopularList() async{
    _ref.read(searchPageModel.notifier).popularModel();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchPage(),
      ),
    );
  }
  void shopCategory(String categoryName) async{
    _ref.read(searchPageModel.notifier).categoryModel(categoryName);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchPage(),
      ),
    );
  }
  void shopOption() async{
    _ref.read(searchPageModel.notifier).categoryOption();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchPage(),
      ),
    );
  }
  Future<void> joinShop(JoinShopReqDto joinShopReqDto) async {
    _ref.read(shopHttpRepository).joinshop(joinShopReqDto);
  }
}
