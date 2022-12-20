import 'package:mubwara/dto/response/reservation_resp_dto.dart';
import 'package:mubwara/dto/response/shop_resp_dto.dart';

import 'image_file_dto.dart';

class ReviewRespDto {
  ReviewRespDto({
    required this.id,
    required this.score,
    required this.content,
    required this.images,
  });

  int id;
  int score;
  String content;

  List<ImageFileDto> images;
  factory ReviewRespDto.fromJson(Map<String, dynamic> json) => ReviewRespDto(
      id: json["id"],
      score: json["score"],
      content: json["content"],
      images: List<ImageFileDto>.from(
          json["images"].map((x) => ImageFileDto.fromJson(x))));
}

class ReviewListRespDto {
  int id;
  int score;
  String content;
  ReviewAboutCustomerDto reviewAboutCustomerDto;
  List<ImageFileDto> images;
  ReviewAboutShopDto reviewAboutShopDto;

  ReviewListRespDto(
      {required this.id,
      required this.score,
      required this.content,
      required this.reviewAboutCustomerDto,
      required this.images,
      required this.reviewAboutShopDto});

  factory ReviewListRespDto.fromJson(Map<String, dynamic> json) =>
      ReviewListRespDto(
        id: json["id"],
        score: json["score"],
        content: json["content"],
        reviewAboutCustomerDto:
            ReviewAboutCustomerDto.fromJson(json["customer"]),
        images: List<ImageFileDto>.from(
            json["images"].map((x) => ImageFileDto.fromJson(x))),
        reviewAboutShopDto: ReviewAboutShopDto.fromJson(json["shop"]),
      );
}
