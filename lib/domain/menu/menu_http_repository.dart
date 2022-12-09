import 'dart:convert';
import '../../dto/response/response_dto.dart';
import '../http_connector.dart';
import 'package:http/http.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/dto/request/menu_req_dto.dart';

final menuHttpRepository = Provider<MenuHttpRepository>((ref) {
  return MenuHttpRepository(ref);
});

class MenuHttpRepository {
  Ref _ref;
  MenuHttpRepository(this._ref);

  Future<void> savemenu(MenuReqDto menuReqDto) async {
    String body = jsonEncode(menuReqDto.toJson());
    print(menuReqDto.price);
    Response response =
    await _ref.read(httpConnector).post("/shop/menu", body);
  }
}