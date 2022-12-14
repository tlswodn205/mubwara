class ReservationShopViewAllRespDto {
  ReservationShopViewAllRespDto({
    required this.reservationTime,
    required this.reservationDate,
    required this.shopTableDto,
    required this.customerDto,
  });

  String reservationTime;
  String reservationDate;
  ShopTableDto shopTableDto;
  CustomerDto customerDto;
  factory ReservationShopViewAllRespDto.fromJson(Map<String, dynamic> json) =>
      ReservationShopViewAllRespDto(
        reservationTime: json["reservationTime"],
        shopTableDto: ShopTableDto.fromJson(json["shopTable"]),
        customerDto: CustomerDto.fromJson(json["customer"]),
        reservationDate: json["reservationDate"],
      );
}

class ReservationSelectRespDto {
  List<int>? date;
  List<dynamic> maxPeopleList;

  ReservationSelectRespDto({required this.date, required this.maxPeopleList});

  factory ReservationSelectRespDto.fromJson(Map<String, dynamic> json) =>
      ReservationSelectRespDto(
        date: json["date"],
        maxPeopleList: json["table"],
      );
}

class ShopTableDto {
  ShopTableDto({
    required this.maxPeople,
  });
  int maxPeople;
  factory ShopTableDto.fromJson(Map<String, dynamic> json) => ShopTableDto(
        maxPeople: json["maxPeople"],
      );
}

class CustomerDto {
  CustomerDto({
    required this.name,
    required this.phoneNumber,
  });
  String name;
  String phoneNumber;
  factory CustomerDto.fromJson(Map<String, dynamic> json) => CustomerDto(
        phoneNumber: json["phoneNumber"],
        name: json["name"],
      );
}

class ReviewAboutCustomerDto {
  int id;
  String name;

  ReviewAboutCustomerDto({required this.id, required this.name});

  factory ReviewAboutCustomerDto.fromJson(Map<String, dynamic> json) =>
      ReviewAboutCustomerDto(
        id: json["id"],
        name: json["name"],
      );
}
