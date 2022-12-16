import 'package:mubwara/dto/response/menu_resp_dto.dart';
import 'package:mubwara/dto/response/review_resp_dto.dart';
import 'package:mubwara/dto/response/subscribe_resp_dto.dart';

import 'image_file_dto.dart';

class shopListRespDto {
  int shop_id;
  String image;
  String shop_name;
  String information;
  double review_score;
  int reviewer_count;
  String category;
  String address;
  int telephone;
  int price;

  shopListRespDto(
      {required this.shop_id,
      required this.image,
      required this.shop_name,
      required this.information,
      required this.review_score,
      required this.reviewer_count,
      required this.category,
      required this.address,
      required this.telephone,
      required this.price});
}

List<shopListRespDto> shopList = [
  shopListRespDto(
      shop_id: 1,
      image: "ddeok_bok_gi.jpg",
      shop_name: "쉐프의 떡볶이",
      information: "어린이 간식, 아빠 술 안주로 좋아요!",
      review_score: 5.0,
      reviewer_count: 140,
      category: "화명동",
      address: "부산어딘가",
      telephone: 01024102957,
      price: 40000),
  shopListRespDto(
      shop_id: 2,
      image: "shop1.jpg",
      shop_name: "밥집",
      information: "밥집입니다~~",
      review_score: 3.7,
      reviewer_count: 190,
      category: "한식",
      address: "부산어딘가",
      telephone: 01000000000,
      price: 20000),
  shopListRespDto(
      shop_id: 3,
      image: "shop2.jpg",
      shop_name: "양식집",
      information: "양식집입니다~~",
      review_score: 4.6,
      reviewer_count: 200,
      category: "양식",
      address: "부산어딘가",
      telephone: 01011111111,
      price: 30000),
  shopListRespDto(
      shop_id: 4,
      image: "shop3.jpg",
      shop_name: "일식집",
      information: "일식집입니다~~",
      review_score: 4.0,
      reviewer_count: 130,
      category: "일식",
      address: "부산어딘가",
      telephone: 01022222222,
      price: 40000),
];

class ShopSearchListDto {
  ShopSearchListDto({
    required this.id,
    required this.shopName,
    required this.address,
    required this.category,
    required this.information,
    required this.openTime,
    required this.closeTime,
    required this.phoneNumber,
    required this.imageFileDto,
    required this.scoreAvg,
  });

  int id;
  String shopName;
  String address;
  String category;
  String information;
  String openTime;
  String closeTime;
  String phoneNumber;
  ImageFileDto imageFileDto;
  double scoreAvg;

  factory ShopSearchListDto.fromJson(Map<String, dynamic> json) =>
      ShopSearchListDto(
        id: json["id"],
        shopName: json["shopName"],
        address: json["address"],
        category: json["category"],
        information: json["information"],
        openTime: json["openTime"],
        closeTime: json["closeTime"],
        phoneNumber: json["phoneNumber"],
        imageFileDto: ImageFileDto.fromJson(
          Map<String, dynamic>.from(json["imageFileDto"]),
        ),
        scoreAvg: json["scoreAvg"],
      );
}

class ShopDetailRespDto {
  ShopDetailRespDto(
      {required this.id,
      required this.shopName,
      required this.address,
      required this.category,
      required this.information,
      required this.openTime,
      required this.closeTime,
      required this.phoneNumber,
      required this.imageFileDto,
      required this.review,
        required this.menu,
      required this.scoreAvg,
      required this.subscribeId});

  int? id;
  String shopName;
  String address;
  String category;
  String information;
  String openTime;
  String closeTime;
  String phoneNumber;
  ImageFileDto imageFileDto;
  List<ReviewRespDto> review;
  List<MenuRespDto> menu;
  double scoreAvg;
  int subscribeId;

  factory ShopDetailRespDto.fromJson(Map<String, dynamic> json) =>
      ShopDetailRespDto(
        menu: List<MenuRespDto>.from(json["menu"].map((x) => MenuRespDto.fromJson(x))),
        id: json["id"],
        shopName: json["shopName"],
        address: json["address"],
        category: json["category"],
        information: json["information"],
        openTime: json["openTime"],
        closeTime: json["closeTime"],
        phoneNumber: json["phoneNumber"],
        imageFileDto: ImageFileDto.fromJson(json["imageFile"]),
        review: List<ReviewRespDto>.from(
            json["review"].map((x) => ReviewRespDto.fromJson(x))),
        scoreAvg: json["scoreAvg"].toDouble(),
        subscribeId: json["subscribeId"],
      );
}

class MyShopDetailRespDto {
  MyShopDetailRespDto({
    required this.shop_name,
    required this.address,
    required this.phoneNumber,
    required this.information,
    required this.perhour,
    required this.perprice,
    required this.closetime,
    required this.opentime,
  });
  String? shop_name;
  String? address;
  String? phoneNumber;
  String? information;
  String? opentime;
  String? closetime;
  String? perhour;
  String? perprice;

  factory MyShopDetailRespDto.fromJson(Map<String, dynamic> json) =>
      MyShopDetailRespDto(
        shop_name: json["shop_name"],
        address: json["address"],
        phoneNumber: json["phoneNumber"],
        information: json["information"],
        opentime: json["opentime"],
        perhour: json["closetime"],
        closetime: json["perhour"],
        perprice: json["perprice"],
      );
}

class ReviewAboutShopDto {
  int id;
  String shopName;
  String category;
  String address;
  ImageFileDto imageFileDto;
  String phoneNumber;

  ReviewAboutShopDto(
      {required this.id,
      required this.shopName,
      required this.category,
      required this.address,
      required this.imageFileDto,
      required this.phoneNumber});

  factory ReviewAboutShopDto.fromJson(Map<String, dynamic> json) =>
      ReviewAboutShopDto(
        id: json["id"],
        shopName: json["shopName"],
        category: json["category"],
        address: json["address"],
        phoneNumber: json["phoneNumber"],
        imageFileDto: ImageFileDto.fromJson(json["imageFile"]),
      );
}
