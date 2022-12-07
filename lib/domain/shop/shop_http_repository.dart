import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    Response response = await _ref.read(httpConnector).get("/shop/list");
    ResponseDto responseDto = ResponseDto.fromJson(jsonDecode(response.body));
    List<dynamic> dataList = responseDto.data;
    List<ShopSearchListDto> ShopSearchDtoList =
        dataList.map((x) => ShopSearchListDto.fromJson(x)).toList();
    print("몰루");
    print(base64.decode(ShopSearchDtoList[0].imageFileDto.image));

    return ShopSearchDtoList;
  }

  Future<ShopDetailRespDto> shopDetail(int id) async {
    Response response =
        await _ref.read(httpConnector).get("/shop/detail/${id}");
    ResponseDto responseDto = ResponseDto.fromJson(jsonDecode(response.body));
    dynamic data = responseDto.data;
    return ShopDetailRespDto.fromJson(data);
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
