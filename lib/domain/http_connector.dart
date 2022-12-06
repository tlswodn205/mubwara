import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

Provider<HttpConnector> httpConnector = Provider<HttpConnector>((ref) {
  return HttpConnector();
});

class HttpConnector {
  final host = "http://192.168.0.125:8000";
  Map<String, String> headers = {
    "Content-Type": "application/json; charset=utf-8"
  };
  final Client _client = Client();

  void AddJWT(String authorization) {
    headers = {
      "Content-Type": "application/json; charset=utf-8",
      "authorization": "${authorization}",
    };
  }

  Future<Response> get(String path) async {
    Uri uri = Uri.parse("${host}${path}");
    Response response = await _client.get(uri, headers: headers);
    print(headers);
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
    print(headers);
    return response;
  }
}
