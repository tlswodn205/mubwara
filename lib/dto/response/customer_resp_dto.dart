
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
    required this.score,
    required this.content,
    // required this.imageFileDto,
    required this.liviewShopDto,
  });
  LiviewShopDto liviewShopDto;
  int score;
  String content;
  // ImageFileDto imageFileDto;

  factory CustomerMyPageReviewRespDto.fromJson(Map<String, dynamic> json) =>
      CustomerMyPageReviewRespDto(
        liviewShopDto : LiviewShopDto.fromJson(
            Map<String, dynamic>.from(json["shop"])),
        score: json["score"],
        content: json["content"],
        // imageFileDto: ImageFileDto.fromJson(
        //     Map<String, dynamic>.from(json["imagefile"])),
      );
}


class CustomerMyPageReservationRespDto {
  CustomerMyPageReservationRespDto({
    required this.reservationTime,
    required this.reservationDate,
    required this.address,
    required this.category,
    required this.shopName,
    required this.imageFileDto,
  });
  String shopName;
  String category;
  String address;
  String reservationTime;
  String reservationDate;
  ImageFileDto imageFileDto;

  factory CustomerMyPageReservationRespDto.fromJson(
          Map<String, dynamic> json) =>
      CustomerMyPageReservationRespDto(
        reservationTime: json["reservationTime"],
        reservationDate: json["reservationDate"],
        shopName: json["shopName"],
        address: json["address"],
        category: json["category"],
        imageFileDto: ImageFileDto.fromJson(
            Map<String, dynamic>.from(json["storeFilename"])),
      );
}
class LiviewShopDto {
  LiviewShopDto({
    required this.id,
    required this.shopName,
  });

  String shopName;
  int id;

  factory LiviewShopDto.fromJson(Map<String, dynamic> json) => LiviewShopDto(
    id: json["id"],
    shopName: json["shopName"],
  );
}