import 'package:mubwara/dto/response/image_file_dto.dart';

class CustomerMyPageSubscribeRespDto {
  CustomerMyPageSubscribeRespDto({
    required this.shopName,
    required this.address,
    required this.category,
    required this.imageFileDto,
  });

  String shopName;
  String address;
  String category;
  ImageFileDto imageFileDto;

  factory CustomerMyPageSubscribeRespDto.fromJson(Map<String, dynamic> json) =>
      CustomerMyPageSubscribeRespDto(
        shopName: json["shopName"],
        address: json["address"],
        category: json["category"],
        imageFileDto: ImageFileDto.fromJson(
            Map<String, dynamic>.from(json["imageFileDto"])),
      );
}

class CustomerMyPageReviewRespDto {
  CustomerMyPageReviewRespDto({
    required this.id,
    required this.score,
    required this.content,
    required this.imageFileDto,
    required this.shop,
  });
  int id;
  int score;
  String content;
  ImageFileDto imageFileDto;
  LiviewShopDto shop;

  factory CustomerMyPageReviewRespDto.fromJson(Map<String, dynamic> json) =>
      CustomerMyPageReviewRespDto(
        id: json["id"],
        score: json["score"],
        content: json["content"],
        shop: LiviewShopDto.fromJson(Map<String, dynamic>.from(json["shop"])),
        imageFileDto: ImageFileDto.fromJson(
            Map<String, dynamic>.from(json["imageFileDto"])),
      );
}


class CustomerMyPageReservationRespDto {
  CustomerMyPageReservationRespDto({
    required this.reservationTime,
    required this.reservationDate,
    required this.shop,
  });

  String reservationTime;
  String reservationDate;
  ReservationShopDto shop;

  factory CustomerMyPageReservationRespDto.fromJson(
          Map<String, dynamic> json) =>
      CustomerMyPageReservationRespDto(
        reservationTime: json["reservationTime"],
        reservationDate: json["resrevationDate"],
        shop: ReservationShopDto.fromJson(
            Map<String, dynamic>.from(json["shop"])),
      );
}

class ReservationShopDto {
  ReservationShopDto({
    required this.address,
    required this.category,
    required this.imageFileDto,
    required this.shopName,
  });

  String shopName;
  String category;
  String address;
  ImageFileDto imageFileDto;

  factory ReservationShopDto.fromJson(Map<String, dynamic> json) =>
      ReservationShopDto(
        shopName: json["shopName"],
        address: json["address"],
        category: json["category"],
        imageFileDto: ImageFileDto.fromJson(
            Map<String, dynamic>.from(json["imageFileDto"])),
      );
}

class LiviewShopDto {
  LiviewShopDto({
    required this.shopName,
  });

  String shopName;

  factory LiviewShopDto.fromJson(Map<String, dynamic> json) => LiviewShopDto(
    shopName: json["shopName"],
  );
}