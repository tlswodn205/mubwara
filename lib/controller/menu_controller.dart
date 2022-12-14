import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/domain/menu/menu_http_repository.dart';
import 'package:mubwara/dto/request/menu_req_dto.dart';
import 'package:mubwara/dto/response/menu_resp_dto.dart';
import 'package:mubwara/main.dart';
import 'package:mubwara/views/page/reservation_management_page/model/menu_model.dart';

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

  void myMenuList() async {
    _ref.read(menuListModel.notifier).initViewModel();
  }

  Future<void> refresh() async {
    List<MenuRespDto> shopMenuList =
    await _ref.read(menuHttpRepository).viewMenu();
    _ref.read(menuListModel.notifier).refresh(shopMenuList);
    return null;
  }
  void deleteMenu(int id) async {
    _ref.watch(menuHttpRepository).deleteMenu(id);
  }
}