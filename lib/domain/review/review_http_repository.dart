import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:mubwara/domain/http_connector.dart';
import 'package:mubwara/dto/request/review_req_dto.dart';
import 'package:mubwara/dto/response/review_resp_dto.dart';

import '../../dto/response/response_dto.dart';

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

  Future<List<ReviewListRespDto>> reviewList() async {
    Response response = await _ref.read(httpConnector).get("/list/review");
    ResponseDto responseDto = ResponseDto.fromJson(jsonDecode(response.body));
    List<dynamic> dataList = responseDto.data;
    List<ReviewListRespDto> reviewListRespDto =
        dataList.map((x) => ReviewListRespDto.fromJson(x)).toList();
    return reviewListRespDto;
  }

  Future<List<ReviewListRespDto>> boardRefresh() async {
    Response response = await _ref.read(httpConnector).get("/list/review");
    ResponseDto responseDto = ResponseDto.fromJson(jsonDecode(response.body));
    List<dynamic> dataList = responseDto.data;
    List<ReviewListRespDto> reviewListRespDto =
        dataList.map((x) => ReviewListRespDto.fromJson(x)).toList();
    return reviewListRespDto;
  }
}
