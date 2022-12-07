import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/dto/request/user_req_dto.dart';
import '../../dto/response/response_dto.dart';
import '../http_connector.dart';
import 'package:http/http.dart';

final userHttpRepository = Provider<UserHttpRepository>((ref) {
  return UserHttpRepository(ref);
});

class UserHttpRepository {
  Ref _ref;
  UserHttpRepository(this._ref);

  Future<String> login() async {
    String body =
        jsonEncode(LoginReqDto(username: "ssar", password: "123").toJson());
    Response response = await _ref.read(httpConnector).post("/login", body);
    ResponseDto responseDto = ResponseDto.fromJson(jsonDecode(response.body));
    print(response.headers.putIfAbsent('authorization', () => ''));
    _ref
        .read(httpConnector)
        .AddJWT(response.headers.putIfAbsent('authorization', () => ''));
    return response.headers.putIfAbsent('authorization', () => '');
  }

  void loginTest() async {
    Response response = await _ref.read(httpConnector).get("/auth/user/test");
  }
}
