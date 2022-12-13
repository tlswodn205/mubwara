import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:mubwara/domain/http_connector.dart';
import 'package:mubwara/dto/response/reservation_resp_dto.dart';
import 'package:mubwara/dto/response/response_dto.dart';

final reservationHttpRepository = Provider<ReservationHttpRepository>((ref) {
  return ReservationHttpRepository(ref);
});

class ReservationHttpRepository {
  Ref _ref;

  ReservationHttpRepository(this._ref);

  Future<List<ReservationShopViewAllRespDto>> ShopReservationList() async {
    Response response =
    await _ref.read(httpConnector).get("/shop/reservation");
    ResponseDto responseDto = ResponseDto.fromJson(jsonDecode(response.body));
    if (responseDto.data == null) {
      return [];
    }
    List<dynamic> dataList = responseDto.data;
    List<ReservationShopViewAllRespDto> reservationShopViewAllRespDto = dataList
        .map((x) => ReservationShopViewAllRespDto.fromJson(x))
        .toList();
    return reservationShopViewAllRespDto;
  }
}