import 'package:mubwara/dto/response/image_file_dto.dart';

class PriceListRespDto {
  PriceListRespDto({
    required this.shopName,
    required this.address,
    required this.category,
    required this.imageFileDto,
    required this.id,
    required this.phoneNumber,
    required this.closeTime,
    required this.openTime,
  });

  int id;
  String shopName;
  String address;
  String category;
  String openTime;
  String closeTime;
  String phoneNumber;
  ImageFileDto imageFileDto;

  factory PriceListRespDto.fromJson(Map<String, dynamic> json) =>
      PriceListRespDto(
        shopName: json["shopName"],
        address: json["address"],
        category: json["category"],
        openTime: json["openTime"],
        closeTime: json["closeTime"],
        phoneNumber: json["phoneNumber"],
        id: json["id"],
        imageFileDto: ImageFileDto.fromJson(
          Map<String, dynamic>.from(
            json["imageFileDto"],
          ),
        ),
      );
}
class ShopPopularListRespDto {
  ShopPopularListRespDto({
    required this.shopName,
    required this.address,
    required this.category,
    required this.imageFileDto,
    required this.id,
    required this.phoneNumber,
    required this.closeTime,
    required this.openTime,
    required this.subscribeCount,
    required this.scoreAvg,
  });

  int id;
  String shopName;
  String address;
  String category;
  String openTime;
  String closeTime;
  String phoneNumber;
  ImageFileDto imageFileDto;
  int subscribeCount;
  double scoreAvg;

  factory ShopPopularListRespDto.fromJson(Map<String, dynamic> json) =>
      ShopPopularListRespDto(
        shopName: json["shopName"],
        address: json["address"],
        category: json["category"],
        openTime: json["openTime"],
        closeTime: json["closeTime"],
        phoneNumber: json["phoneNumber"],
        subscribeCount: json["count"],
        scoreAvg: json["scoreAvg"],
        id: json["shopId"],
        imageFileDto: ImageFileDto.fromJson(
          Map<String, dynamic>.from(
            json["imageFileDto"],
          ),
        ),
      );
}
