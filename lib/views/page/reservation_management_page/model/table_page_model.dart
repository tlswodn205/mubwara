import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/domain/shop_table/shop_table_http_repository.dart';
import 'package:mubwara/dto/response/table_type_resp_dto.dart';

final tablePageModel =
StateNotifierProvider<TablePageModel, List<AllShopTableRespDto>>((ref) {
  return TablePageModel([], ref)..initViewModel();
});

class TablePageModel extends StateNotifier<List<AllShopTableRespDto>> {
  Ref _ref;
  TablePageModel(super.state, this._ref);

  void initViewModel() async {
    List<AllShopTableRespDto> allShopTableList =
    await _ref.read(tableHttpsRespository).allShopTableList();
    state = allShopTableList;
  }

  //
  void refresh(List<AllShopTableRespDto> allShopTableList) {
    state = allShopTableList;
  }
}