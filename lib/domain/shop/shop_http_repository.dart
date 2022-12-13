import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/dto/request/shop_req_dto.dart';
import 'package:mubwara/dto/response/shop_resp_dto.dart';
import '../../dto/response/response_dto.dart';
import '../http_connector.dart';
import 'package:http/http.dart';

final shopHttpRepository = Provider<ShopHttpRepository>((ref) {
  return ShopHttpRepository(ref);
});

class ShopHttpRepository {
  Ref _ref;
  ShopHttpRepository(this._ref);

  Future<List<ShopSearchListDto>> searchShopList() async {
    Response response = await _ref.read(httpConnector).get("/list");
    ResponseDto responseDto = ResponseDto.fromJson(jsonDecode(response.body));
    List<dynamic> dataList = responseDto.data;
    List<ShopSearchListDto> ShopSearchDtoList =
        dataList.map((x) => ShopSearchListDto.fromJson(x)).toList();
    return ShopSearchDtoList;
  }

  Future<ShopDetailRespDto> shopDetail(int id) async {
    Response response = await _ref.read(httpConnector).get("/detail/${id}");
    ResponseDto responseDto = ResponseDto.fromJson(jsonDecode(response.body));
    dynamic data = responseDto.data;
    print(data);
    return ShopDetailRespDto.fromJson(data);
  }
  Future<MyShopDetailRespDto> myshopDetail(int id) async {
    Response response =
    await _ref.read(httpConnector).get("/myshopdetail");
    ResponseDto responseDto = ResponseDto.fromJson(jsonDecode(response.body));
    dynamic data = responseDto.data;
    return MyShopDetailRespDto.fromJson(data);
  }

  Future<void> joinshop(JoinShopReqDto joinShopReqDto) async {
    String body = jsonEncode(joinShopReqDto.toJson());
    print(joinShopReqDto.phoneNumber);
    Response response = await _ref.read(httpConnector).post("/user/save", body);
  }
//   await _ref.read(httpConnector).get("/api/product/${id}");
//   Product product = Product.fromJson(jsonDecode(response.body));
//   return product;
// }
//
// Future<List<Product>> findAll() async {
//   Response response = await _ref.read(httpConnector).get("/api/product");
//   List<dynamic> dataList = jsonDecode(response.body)["data"];
//   return dataList.map((e) => Product.fromJson(e)).toList();
}
