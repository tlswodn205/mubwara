import 'package:mubwara/dto/response/image_file_dto.dart';

class PriceListRespDto  {
  PriceListRespDto ({
    required this.shopName,
    required this.address,
    required this.category,
    required this.imageFileDto,
    required this.id,
    required this.phoneNumber,
    required this.closeTime,
    required this.openTime,
    required this.optionList,
    required this.priceAvg,
  });

   int id;
   String shopName;
   String address;
   String category;
   String openTime;
   String closeTime;
   String phoneNumber;
   ImageFileDto imageFileDto;
  int priceAvg = 0;
   List<int> optionList;

  factory PriceListRespDto .fromJson(Map<String, dynamic> json) =>
      PriceListRespDto (
        shopName: json["shopName"],
        address: json["address"],
        category: json["category"],
          openTime : json["openTime"],
        closeTime: json["closeTime"],
        phoneNumber: json["phoneNumber"],
        priceAvg: json["priceAvg"],
        id: json["id"],
        imageFileDto: ImageFileDto.fromJson(
            Map<String, dynamic>.from(json["imageFileDto"])), optionList: [],
      );
}