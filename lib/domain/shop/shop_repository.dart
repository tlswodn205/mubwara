// import 'dart:convert';
//
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:http/http.dart';
//
// import '../http_connector.dart';
//
// final productHttpRepository = Provider<ProductHttpRepository>((ref) {
//   return ProductHttpRepository(ref);
// });
//
// class ProductHttpRepository {
//   Ref _ref;
//   ProductHttpRepository(this._ref);
//
//   Future<Product> findById(int id) async {
//     Response response =
//         await _ref.read(httpConnector).get("/api/product/${id}");
//     Product product = Product.fromJson(jsonDecode(response.body));
//     return product;
//   }
//
//   Future<List<Product>> findAll() async {
//     Response response = await _ref.read(httpConnector).get("/api/product");
//     List<dynamic> dataList = jsonDecode(response.body)["data"];
//     return dataList.map((e) => Product.fromJson(e)).toList();
//   }
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
// }
