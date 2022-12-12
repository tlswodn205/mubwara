import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/dto/response/customer_resp_dto.dart';
import 'package:mubwara/dto/response/response_dto.dart';
import '../../dto/request/customer_req_dto.dart';
import '../http_connector.dart';
import 'package:http/http.dart';

final customerHttpRepository = Provider<CustomerHttpRepository>((ref) {
  return CustomerHttpRepository(ref);
});

class CustomerHttpRepository {
  Ref _ref;
  CustomerHttpRepository(this._ref);

  Future<void> joinCustomer(JoinCustomerReqDto joinCustomerReqDto) async {
    String body = jsonEncode(joinCustomerReqDto.toJson());
    print(joinCustomerReqDto.phoneNumber);
    Response response =
        await _ref.read(httpConnector).post("/customer/join", body);
  }

  Future<List<CustomerMyPageSubscribeRespDto>> myPageSubscribeList() async {
    Response response =
        await _ref.read(httpConnector).get("/user/mypage/subscribe");
    ResponseDto responseDto = ResponseDto.fromJson(jsonDecode(response.body));
    List<dynamic> dataList = responseDto.data;
    List<CustomerMyPageSubscribeRespDto> CustomerMyPageSubscribeList = dataList
        .map((x) => CustomerMyPageSubscribeRespDto.fromJson(x))
        .toList();
    return CustomerMyPageSubscribeList;
  }

  Future<List<CustomerMyPageReviewRespDto>> myPageReviewList() async {
    Response response =
        await _ref.read(httpConnector).get("/user/mypage/review");
    ResponseDto responseDto = ResponseDto.fromJson(jsonDecode(response.body));
    List<dynamic> dataList = responseDto.data;
    List<CustomerMyPageReviewRespDto> CustomerMyPageReviewList =
        dataList.map((x) => CustomerMyPageReviewRespDto.fromJson(x)).toList();
    return CustomerMyPageReviewList;
  }

  Future<List<CustomerMyPageReservationRespDto>> myPageReservationList() async {
    Response response =
        await _ref.read(httpConnector).get("/user/mypage/reservation");
    ResponseDto responseDto = ResponseDto.fromJson(jsonDecode(response.body));
    List<dynamic> dataList = responseDto.data;
    print(dataList.toString());
    List<CustomerMyPageReservationRespDto> CustomerMyPageReservationList =
        dataList
            .map((x) => CustomerMyPageReservationRespDto.fromJson(x))
            .toList();
    return CustomerMyPageReservationList;
  }
}
