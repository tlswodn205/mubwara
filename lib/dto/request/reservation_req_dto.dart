class ReservationSelectReqDto {
  int? shopId;
  int? maxPeople;
  String? date;

  ReservationSelectReqDto.origin();

  ReservationSelectReqDto(
      {required this.shopId, required this.maxPeople, required this.date});

  Map<String, dynamic> toJson() => {
        "shopId": shopId,
        "maxPeople": maxPeople,
        "date": date,
      };
}
