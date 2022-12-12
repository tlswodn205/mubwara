import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/domain/review/review_http_repository.dart';
import 'package:mubwara/dto/request/review_req_dto.dart';
import 'package:mubwara/main.dart';

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
}