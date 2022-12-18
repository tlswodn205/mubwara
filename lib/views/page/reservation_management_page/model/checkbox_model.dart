import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/domain/menu/menu_http_repository.dart';
import 'package:mubwara/dto/response/menu_resp_dto.dart';

final checkListModel =
StateNotifierProvider<CheckListModel, List<int>>((ref) {
  return CheckListModel([], ref)..initViewModel();
});

class CheckListModel extends StateNotifier<List<int>> {
  Ref _ref;
  CheckListModel(super.state, this._ref);

  void initViewModel() async {
    List<int> checkList =[];
    state = checkList;
  }
  void refresh(List<int> checkList) {
    state = checkList;
  }
}

