import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/dto/request/user_req_dto.dart';
import '../../dto/response/response_dto.dart';
import '../../views/page/login_page/login_page_model.dart';
import '../http_connector.dart';
import 'package:http/http.dart';

final userHttpRepository = Provider<UserHttpRepository>((ref) {
  return UserHttpRepository(ref);
});

class UserHttpRepository {
  Ref _ref;
  UserHttpRepository(this._ref);

  Future<String> login({required LoginReqDto loginReqDto}) async {
    String body = jsonEncode(LoginReqDto(
            username: loginReqDto.username, password: loginReqDto.password)
        .toJson());
    Response response = await _ref.read(httpConnector).post("/login", body);
    ResponseDto responseDto = ResponseDto.fromJson(jsonDecode(response.body));
    String token = response.headers.putIfAbsent('authorization', () => '');
    print(token);
    if (token == "") {
      return "";
    }
    _ref.read(httpConnector).AddJWT(token);
    return response.headers.putIfAbsent('authorization', () => '');
  }

  void loginTest() async {
    Response response = await _ref.read(httpConnector).get("/auth/user/test");
  }
}
