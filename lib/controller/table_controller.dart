import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/domain/shop_table/shop_table_http_repository.dart';
import 'package:mubwara/dto/request/table_type_req_dto.dart';
import 'package:mubwara/main.dart';

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
}