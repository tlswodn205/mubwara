import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import '../../dto/response/response_dto.dart';
import 'package:mubwara/domain/http_connector.dart';

import '../../dto/response/subscribe_resp_dto.dart';

final subscribeHttpRepository = Provider<SubscribeHttpRepository>((ref) {
  return SubscribeHttpRepository(ref);
});

class SubscribeHttpRepository {
  Ref _ref;
  SubscribeHttpRepository(this._ref);

  Future<int> insertSubscribe(int shopId) async {
    Response response =
    await _ref.read(httpConnector).get("/auth/${shopId}/subscribe");
    ResponseDto responseDto = ResponseDto.fromJson(jsonDecode(response.body));
    SubscribeDto data = SubscribeDto.fromJson(responseDto.data);
    return data.id;
  }

  void deleteSubscribe(int? subscribeId) {
    _ref.read(httpConnector).delete("/auth/subscribe/${subscribeId}");
  }
}
