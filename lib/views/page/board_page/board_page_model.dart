import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controller/review_controller.dart';
import '../../../dto/response/review_resp_dto.dart';

final boardPageModel =
    StateNotifierProvider<BoardPageModel, List<ReviewListRespDto>>((ref) {
  return BoardPageModel([], ref)..initViewModel();
});

class BoardPageModel extends StateNotifier<List<ReviewListRespDto>> {
  Ref _ref;
  BoardPageModel(super.state, this._ref);

  void initViewModel() async {
    List<ReviewListRespDto> dataList =
        await _ref.read(reviewController).reviewList();
    state = dataList;
  }

  void refresh(List<ReviewListRespDto> dataList) async {
    state = dataList;
  }

  void login(List<ReviewListRespDto> data) async {
    state = data;
  }
}
