import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/dto/request/shop_req_dto.dart';
import 'package:mubwara/dto/response/board_resp_dto.dart';
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

  Future<List<ShopSearchListDto>> shopSearchList(String keyword) async {
    Response response =
        await _ref.read(httpConnector).get("/list/search/${keyword}");
    ResponseDto responseDto = ResponseDto.fromJson(jsonDecode(response.body));
    List<dynamic> dataList = responseDto.data;
    List<ShopSearchListDto> ShopsearchDtoList =
        dataList.map((x) => ShopSearchListDto.fromJson(x)).toList();
    print(keyword);
    return ShopsearchDtoList;
  }

  Future<ShopDetailRespDto> shopDetail(int id) async {
    Response response = await _ref.read(httpConnector).get("/detail/${id}");
    ResponseDto responseDto = ResponseDto.fromJson(jsonDecode(response.body));
    dynamic data = responseDto.data;
    ShopDetailRespDto shop = ShopDetailRespDto.fromJson(data);
    return shop;
  }

  Future<MyShopDetailRespDto> myshopDetail(int id) async {
    Response response = await _ref.read(httpConnector).get("/myshopdetail");
    ResponseDto responseDto = ResponseDto.fromJson(jsonDecode(response.body));
    dynamic data = responseDto.data;
    return MyShopDetailRespDto.fromJson(data);
  }

  Future<List<ShopSearchListDto>> shopPriceList(String value) async {
    Response response =
        await _ref.read(httpConnector).get("/list/price/${value}");
    print(response);
    ResponseDto responseDto = ResponseDto.fromJson(jsonDecode(response.body));
    List<dynamic> dataList = responseDto.data;
    print(dataList.toString());
    List<ShopSearchListDto> PriceList =
        dataList.map((x) => ShopSearchListDto.fromJson(x)).toList();

    return PriceList;
  }

  Future<List<ShopSearchListDto>> shopRegionList(String region) async {
    Response response = await _ref
        .read(httpConnector)
        .get("/list/location?city=부산&region=${region}");
    ResponseDto responseDto = ResponseDto.fromJson(jsonDecode(response.body));
    List<dynamic> dataList = responseDto.data;
    print(dataList.toString());
    List<ShopSearchListDto> RegionList =
        dataList.map((x) => ShopSearchListDto.fromJson(x)).toList();
    return RegionList;
  }

  Future<List<ShopSearchListDto>> shopCategory(String categoryName) async {
    Response response =
        await _ref.read(httpConnector).get("/list/${categoryName}");
    print(response);
    ResponseDto responseDto = ResponseDto.fromJson(jsonDecode(response.body));
    List<dynamic> dataList = responseDto.data;
    print(dataList.toString());
    List<ShopSearchListDto> categoryList =
        dataList.map((x) => ShopSearchListDto.fromJson(x)).toList();
    return categoryList;
  }

  Future<List<ShopSearchListDto>> shopOption() async {
    Response response = await _ref.read(httpConnector).get("/list/option");
    print(response);
    ResponseDto responseDto = ResponseDto.fromJson(jsonDecode(response.body));
    List<dynamic> dataList = responseDto.data;
    print(dataList.toString());
    List<ShopSearchListDto> optionList =
        dataList.map((x) => ShopSearchListDto.fromJson(x)).toList();
    return optionList;
  }

  Future<List<ShopSearchListDto>> shopPopularList() async {
    Response response = await _ref.read(httpConnector).get("/list/popular");
    ResponseDto responseDto = ResponseDto.fromJson(jsonDecode(response.body));
    List<dynamic> dataList = responseDto.data;
    print(dataList.toString());
    List<ShopSearchListDto> popularList =
        dataList.map((x) => ShopSearchListDto.fromJson(x)).toList();

    return popularList;
  }

  Future<List<ShopSearchListDto>> shopSearch(String keyword) async {
    Response response =
        await _ref.read(httpConnector).get("/list/search/${keyword}");
    ResponseDto responseDto = ResponseDto.fromJson(jsonDecode(response.body));
    List<dynamic> dataList = responseDto.data;
    List<ShopSearchListDto> searchList =
        dataList.map((x) => ShopSearchListDto.fromJson(x)).toList();

    return searchList;
  }

  Future<void> joinshop(JoinShopReqDto joinShopReqDto) async {
    String body = jsonEncode(joinShopReqDto.toJson());
    Response response =
        await _ref.read(httpConnector).post("/user/shop/save", body);
  }

  Future<List<AnalysisDateRespDto>> dayAnalysis(
      AnalysisDateReqDto analysisDateReqDto) async {
    print('작동됨');
    String body = jsonEncode(analysisDateReqDto.toJson());
    Response response =
        await _ref.read(httpConnector).post("/shop/analysis/date", body);
    ResponseDto responseDto = ResponseDto.fromJson(jsonDecode(response.body));
    List<dynamic> dataList = responseDto.data;
    List<AnalysisDateRespDto> analysisDateRespDto =
        dataList.map((x) => AnalysisDateRespDto.fromJson(x)).toList();
    return analysisDateRespDto;
  }

  Future<List<AnalysisDateRespDto>> weekAnalysis(
      AnalysisWeekReqDto analysisWeekReqDto) async {
    print('작동됨');
    String body = jsonEncode(analysisWeekReqDto.toJson());
    Response response =
        await _ref.read(httpConnector).post("/shop/analysis/week", body);
    ResponseDto responseDto = ResponseDto.fromJson(jsonDecode(response.body));
    List<dynamic> dataList = responseDto.data;
    List<AnalysisDateRespDto> analysisDateRespDto =
        dataList.map((x) => AnalysisDateRespDto.fromJson(x)).toList();
    return analysisDateRespDto;
  }
}
