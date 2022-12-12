import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/domain/shop/shop_http_repository.dart';
import 'package:mubwara/dto/request/shop_req_dto.dart';
import 'package:mubwara/dto/response/shop_resp_dto.dart';
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
  
  void myshopDetail() async {
    _ref.read(searchPageModel.notifier).initViewModel();
  }
  
  Future<void> joinShop(JoinShopReqDto joinShopReqDto) async {
    _ref.read(shopHttpRepository).joinshop(joinShopReqDto);
  }
}
