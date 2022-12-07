import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/domain/http_connector.dart';
import 'package:mubwara/dto/response/shop_resp_dto.dart';
import 'package:mubwara/dto/response/user_resp_dto.dart';
import 'package:mubwara/views/page/login_page/login_page_model.dart';
import 'package:mubwara/views/page/search_page/search_page_model.dart';

import '../domain/user/user_http_repository.dart';
import '../dto/response/shop_resp_dto.dart';
import '../main.dart';

final userController = Provider<UserController>((ref) {
  return UserController(ref);
});

class UserController {
  final context = navigatorKey.currentContext!;
  final Ref _ref;
  UserController(this._ref);

  void Login() async {
    String data = await _ref.read(userHttpRepository).login();
    _ref.read(loginPageModel.notifier).login(data);
    print(data);
    _ref.read(httpConnector).AddJWT(data);
  }

  void LoginTest() {
    _ref.read(userHttpRepository).loginTest();
  }
}
