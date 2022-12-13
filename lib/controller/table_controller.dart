import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/domain/shop_table/shop_table_http_repository.dart';
import 'package:mubwara/dto/request/table_type_req_dto.dart';
import 'package:mubwara/dto/response/table_type_resp_dto.dart';
import 'package:mubwara/main.dart';
import 'package:mubwara/views/page/reservation_management_page/model/table_page_model.dart';

final tableController = Provider<TableController>((ref) {
  return TableController(ref);
});

class TableController {
  final context = navigatorKey.currentContext!;
  final Ref _ref;

  TableController(this._ref);

  Future<void> tableupdate(TableReqDto tableReqDto) async {
    print(tableReqDto.maxPeople);
    ShopTableUpdateReqDto shopTableUpdateReqDto = new ShopTableUpdateReqDto( [tableReqDto]);
    _ref.read(tableHttpsRespository).tableUpdate(shopTableUpdateReqDto);
  }

  void allShopTableList() async {
    _ref.read(tablePageModel.notifier).initViewModel();
  }

  Future<void> allShopTableListRefresh() async {
    List<AllShopTableRespDto> allShopTableList =
    await _ref.read(tableHttpsRespository).allShopTableList();
    _ref.read(tablePageModel.notifier).refresh(allShopTableList);
    return null;
  }
}