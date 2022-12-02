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

class ShopSearchList {
  ShopSearchList({
    required this.shopName,
    required this.address,
    required this.category,
    required this.information,
    required this.openTime,
    required this.closeTime,
    required this.imageFileDto,
  });

  String shopName;
  String address;
  String category;
  String information;
  String openTime;
  String closeTime;
  ImageFileDto imageFileDto;

  factory ShopSearchList.fromJson(Map<String, dynamic> json) => ShopSearchList(
        shopName: json["shopName"],
        address: json["address"],
        category: json["category"],
        information: json["information"],
        openTime: json["openTime"],
        closeTime: json["closeTime"],
        imageFileDto: ImageFileDto.fromJson(
            Map<String, dynamic>.from(json["imageFileDto"])),
      );

  Map<String, dynamic> toJson() => {
        "shopName": shopName,
        "address": address,
        "category": category,
        "information": information,
        "openTime": openTime,
        "closeTime": closeTime,
        "imageFileDto": imageFileDto.toJson(),
      };
}
