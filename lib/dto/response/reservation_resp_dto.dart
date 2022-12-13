class ReservationShopViewAllRespDto {
  ReservationShopViewAllRespDto({
    required this.reservationTime,
    required this.reservationDate,
    required this.name,
    required this.phoneNumber,
    required this.maxPeople,
  });
  String name;
  String phoneNumber;
  String maxPeople;
  String reservationTime;
  DateTime reservationDate;

  factory ReservationShopViewAllRespDto.fromJson(
      Map<String, dynamic> json) =>
      ReservationShopViewAllRespDto(
        reservationTime: json["reservationTime"],
        phoneNumber: json["phoneNumber"],
        name: json["name"],
        maxPeople: json["maxPeople"],
        reservationDate: json["reservationDate"],
      );
}