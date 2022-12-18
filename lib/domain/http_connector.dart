import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:mubwara/provider/auth_provider.dart';

Provider<HttpConnector> httpConnector = Provider<HttpConnector>((ref) {
  return HttpConnector();
});

class HttpConnector {
  final host = "http://192.168.123.102:8000";
  // 다른 아이피 : http://192.168.0.125:8000
  //"http://192.168.0.86:8000"
  Map<String, String> headers = {
    "Content-Type": "application/json; charset=utf-8"
  };
  final Client _client = Client();

  void login(String jwtToken) {
    headers = {
      "Content-Type": "application/json; charset=utf-8",
      "Authorization": "${jwtToken}",
    };
    print("머리임:" + headers.toString());
  }

  void logout() {
    headers = {"Content-Type": "application/json; charset=utf-8"};
  }

  void kakaoLodin(String kakaoToken) {
    headers = {
      "Content-Type": "application/json; charset=utf-8",
      "access-token": "${kakaoToken}",
    };
  }

  Future<Response> get(String path) async {
    Uri uri = Uri.parse("${host}${path}");
    Response response = await _client.get(uri, headers: headers);
    return response;
  }

  Future<Response> delete(String path) async {
    Uri uri = Uri.parse("${host}${path}");
    Response response = await _client.delete(uri, headers: headers);
    return response;
  }

  Future<Response> put(String path, String body) async {
    Uri uri = Uri.parse("${host}${path}");
    Response response = await _client.put(uri, body: body, headers: headers);
    return response;
  }

  Future<Response> post(String path, String body) async {
    Uri uri = Uri.parse("${host}${path}");
    Response response = await _client.post(uri, body: body, headers: headers);
    return response;
  }
}
