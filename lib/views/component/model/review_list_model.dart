import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/domain/customer/customer_http_repository.dart';
import 'package:mubwara/dto/response/customer_resp_dto.dart';

final reviewListModel =
    StateNotifierProvider<ReviewListModel, List<CustomerMyPageReviewRespDto>>(
        (ref) {
  return ReviewListModel([], ref)..initViewModel();
});

class ReviewListModel extends StateNotifier<List<CustomerMyPageReviewRespDto>> {
  Ref _ref;
  ReviewListModel(super.state, this._ref);

  void initViewModel() async {
    List<CustomerMyPageReviewRespDto> mypageReviewDtoList =
        await _ref.read(customerHttpRepository).myPageReviewList();
    state = mypageReviewDtoList;
  }

  //
  void refresh(List<CustomerMyPageReviewRespDto> mypageReviewDtoList) {
    state = mypageReviewDtoList;
  }
}
