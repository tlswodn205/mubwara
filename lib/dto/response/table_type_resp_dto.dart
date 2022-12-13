class AllShopTableRespDto {
  AllShopTableRespDto({
    required this.maxPeople,
    required this.qty,
  });

  String maxPeople;
  int qty;

  factory AllShopTableRespDto.fromJson(Map<String, dynamic> json) =>
      AllShopTableRespDto(
        maxPeople: json["maxPeople"],
        qty: json["qty"],
      );
}
