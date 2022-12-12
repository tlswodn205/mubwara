class TableReqDto{
  String? name;
  String? price;
  int? recommanded;
  // String? image;

  TableReqDto.origin();

  TableReqDto(
      // this.image,
      this.name, this.price, this.recommanded);
  Map<String, dynamic> toJson() => {
    "name": name,
    "price": price,
    "recommanded": recommanded,
    // "image": image,
  };
}