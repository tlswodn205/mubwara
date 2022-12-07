import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/domain/customer/customer_http_repository.dart';
import 'package:mubwara/dto/response/customer_resp_dto.dart';
import 'package:mubwara/main.dart';
import 'package:mubwara/views/component/model/review_list_model.dart';

final reviewController = Provider<ReviewController>((ref) {
  return ReviewController(ref);
});

class ReviewController {
  final context = navigatorKey.currentContext!;
  final Ref _ref;
  ReviewController(this._ref);

  void myReviewList() async {
    _ref.read(reviewListModel.notifier).initViewModel();
  }

  Future<void> refresh() async {
    List<CustomerMyPageReviewRespDto> myReviewDtoList =
    await _ref.read(customerHttpRepository).myPageReviewList();
    _ref.read(reviewListModel.notifier).refresh(myReviewDtoList);
    return null;
  }
}