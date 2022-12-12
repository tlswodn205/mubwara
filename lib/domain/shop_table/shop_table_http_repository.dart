import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:mubwara/domain/http_connector.dart';
import 'package:mubwara/dto/request/table_type_req_dto.dart';

final tableHttpsRespository = Provider<TalbleHttpsRespository>((ref) {
  return TalbleHttpsRespository(ref);
});

class TalbleHttpsRespository {
  Ref _ref;

  TalbleHttpsRespository(this._ref);

  Future<void> tableUpdate(ShopTableUpdateReqDto shopTableUpdateReqDto) async {
    String body = jsonEncode(shopTableUpdateReqDto.toJson());
    Response response =
    await _ref.read(httpConnector).post("/shop/table", body);
  }
}