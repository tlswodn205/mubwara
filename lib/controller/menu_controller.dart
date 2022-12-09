import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/domain/menu/menu_http_repository.dart';
import 'package:mubwara/dto/request/menu_req_dto.dart';
import 'package:mubwara/main.dart';

final menuController = Provider<MenuController>((ref) {
  return MenuController(ref);
});

class MenuController {
  final context = navigatorKey.currentContext!;
  final Ref _ref;
  MenuController(this._ref);

  Future<void> saveMenu(MenuReqDto menuReqDto) async {
    _ref.read(menuHttpRepository).savemenu(menuReqDto);
  }
}