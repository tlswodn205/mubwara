import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/dto/response/shop_resp_dto.dart';
import '../../dto/response/response_dto.dart';
import '../http_connector.dart';
import 'package:http/http.dart';

final shopHttpRepository = Provider<ShopHttpRepository>((ref) {
  return ShopHttpRepository(ref);
});

//
class ShopHttpRepository {
  Ref _ref;
  ShopHttpRepository(this._ref);
//
//   Future<Product> findById(int id) async {
//     Response response =
//         await _ref.read(httpConnector).get("/api/product/${id}");
//     Product product = Product.fromJson(jsonDecode(response.body));
//     return product;
//   }
//
  Future<List<ShopSearchList>> searchShopList() async {
    Response response = await _ref.read(httpConnector).get("/shop/list");
    ResponseDto responseDto = jsonDecode(response.body);
    print("몰?루 : " + responseDto.msg);
    List<ShopSearchList> dataList =
        responseDto.data.map((x) => ShopSearchList.fromJson(x)).toList();
    return dataList;
  }
//
//   Future<Product> insert(Product productReqDto) async {
//     String body = jsonEncode(productReqDto.toJson());
//     Response response =
//         await _ref.read(httpConnector).post("/api/product", body);
//     Product product = Product.fromJson(jsonDecode(response.body)["data"]);
//     return product;
//   }
//
//   Future<int> deleteById(int id) async {
//     Response response =
//         await _ref.read(httpConnector).delete("/api/product/${id}");
//     return jsonDecode(response.body)["code"];
//   }
//
//   Future<Product> updateById(int id, Product productReqDto) async {
//     String body = jsonEncode(productReqDto.toJson());
//     Response response =
//         await _ref.read(httpConnector).put("/api/product/${id}", body);
//     Product product = Product.fromJson(jsonDecode(response.body)["data"]);
//     return product;
//   }
}
