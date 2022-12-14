import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/domain/review/review_http_repository.dart';
import 'package:mubwara/dto/request/review_req_dto.dart';
import 'package:mubwara/main.dart';
import 'package:mubwara/views/page/board_page/board_page_model.dart';

import '../dto/response/review_resp_dto.dart';

final reviewController = Provider<ReviewController>((ref) {
  return ReviewController(ref);
});

class ReviewController {
  final context = navigatorKey.currentContext!;
  final Ref _ref;

  ReviewController(this._ref);

  Future<void> reviewsave(ReviewReqDto reviewReqDto) async {
    _ref.read(reviewHttpRepository).reviewsave(reviewReqDto);
  }

  Future<List<ReviewListRespDto>> reviewList() async {
    List<ReviewListRespDto> ReviewRespDtoList =
        await _ref.read(reviewHttpRepository).reviewList();
    return ReviewRespDtoList;
  }

  Future<void> boardRefresh() async {
    List<ReviewListRespDto> ReviewRespDtoList =
        await _ref.read(reviewHttpRepository).boardRefresh();
    _ref.read(boardPageModel.notifier).refresh(ReviewRespDtoList);
  }
}
