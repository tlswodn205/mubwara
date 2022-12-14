class JoinShopReqDto {
  String? shop_name;
  String? address;
  String? phoneNumber;
  String? information;
  String? opentime;
  String? closetime;
  String? perhour;
  String? perprice;
  String? category;
  JoinShopReqDto.origin();

  JoinShopReqDto(
      this.perprice,
      this.perhour,
      this.shop_name,
      this.address,
      this.phoneNumber,
      this.information,
      this.closetime,
      this.category,
      this.opentime);

  Map<String, dynamic> toJson() => {
    "category" : category,
    "perHour" : perhour,
    "perPrice" : perprice,
    "shopName": shop_name,
    "address": address,
    "phoneNumber": phoneNumber,
    "openTime" : opentime,
    "closeTime" : closetime,
    "information" : information,
  };
}
