import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:mubwara/domain/http_connector.dart';
import 'package:mubwara/dto/request/table_type_req_dto.dart';
import 'package:mubwara/dto/response/response_dto.dart';
import 'package:mubwara/dto/response/table_type_resp_dto.dart';

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
  Future<List<AllShopTableRespDto>> allShopTableList() async {
    Response response = await _ref.read(httpConnector).get("/shop/table");
    ResponseDto responseDto = ResponseDto.fromJson(jsonDecode(response.body));
    List<dynamic> dataList = responseDto.data;
    List<AllShopTableRespDto> AllShopTableDtoList =
    dataList.map((x) => AllShopTableRespDto.fromJson(x)).toList();
    return AllShopTableDtoList;
  }
}