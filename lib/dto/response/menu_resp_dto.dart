class MenuRespDto {
  MenuRespDto(
      {required this.name, required this.price, required this.recommanded});

  String? name;
  String? price;
  int? recommanded;

  factory MenuRespDto.fromJson(Map<String, dynamic> json) => MenuRespDto(
        name: json["name"],
        price: json["price"],
        recommanded: json["recommanded"],
      );
}
