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
  int? shopTableId;
  int? customerId;
  String? date;
  String? time;

  ReservationSaveReqDto.origin();

  ReservationSaveReqDto(
      {required this.shopTableId,
      required this.customerId,
      required this.date,
      required this.time});

  Map<String, dynamic> toJson() => {
        "shopTableId": shopTableId,
        "customerId": customerId,
        "reservationDate": date,
        "reservationTime": time,
      };
}
