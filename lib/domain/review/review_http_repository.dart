import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:mubwara/domain/http_connector.dart';
import 'package:mubwara/dto/request/review_req_dto.dart';

final reviewHttpRepository = Provider<ReviewHttpRepository>((ref) {
  return ReviewHttpRepository(ref);
});

class ReviewHttpRepository {
  Ref _ref;

  ReviewHttpRepository(this._ref);

  Future<void> reviewsave(ReviewReqDto reviewReqDto) async {
    String body = jsonEncode(reviewReqDto.toJson());
    print(reviewReqDto.content);
    Response response =
    await _ref.read(httpConnector).post("/user/review", body);
  }
}