import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:mubwara/dto/request/user_req_dto.dart';
import 'package:mubwara/provider/auth_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    String? jwtToken = response.headers['access-token'].toString();

    AuthProvider ap = _ref.read(authProvider);
    ap.jwtToken = jwtToken;
    ap.isLogin = true;
    ap.role = responseDto.data;
    _ref.read(httpConnector).login(jwtToken);

    final prefs = await SharedPreferences.getInstance();
    prefs.setString("jwtToken", jwtToken);
    prefs.setString("role", responseDto.data);
    return jwtToken;

    // String jwtToken = response.headers.putIfAbsent('authorization', () => '');
    // if (jwtToken == null) {
    //   return "";
    // }
    // _ref.read(httpConnector).AddJWT(jwtToken);
    // return response.headers.putIfAbsent('authorization', () => '');
  }

  void loginTest() async {
    Response response = await _ref.read(httpConnector).get("/auth/user/test");
  }
}
