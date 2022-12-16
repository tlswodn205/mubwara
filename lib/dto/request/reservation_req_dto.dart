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

class ReservationSaveReqDto {
  int? shopId;
  String? date;
  String? time;
  int? maxPeople;

  ReservationSaveReqDto.origin();

  ReservationSaveReqDto(
      {required this.maxPeople,
      required this.shopId,
      required this.date,
      required this.time});

  Map<String, dynamic> toJson() => {
        "maxPeople": maxPeople,
        "shopId": shopId,
        "reservationDate": date,
        "reservationTime": time,
      };
}
