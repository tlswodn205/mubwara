import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/domain/menu/menu_http_repository.dart';
import 'package:mubwara/dto/response/menu_resp_dto.dart';

final menuListModel =
StateNotifierProvider<MenuListModel, List<MenuRespDto>>((ref) {
  return MenuListModel([], ref)..initViewModel();
});

class MenuListModel extends StateNotifier<List<MenuRespDto>> {
  Ref _ref;
  MenuListModel(super.state, this._ref);

  void initViewModel() async {
    List<MenuRespDto> menuList =
    await _ref.read(menuHttpRepository).viewMenu();
    state = menuList;
  }
  void refresh(List<MenuRespDto> menuList) {
    state = menuList;
  }
}

