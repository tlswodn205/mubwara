class TableReqDto{
  String? maxPeople;
  String? qty;
  // String? image;

  TableReqDto.origin();

  TableReqDto(
      // this.image,
      this.maxPeople, this.qty,);
  Map<String, dynamic> toJson() => {
    "maxPeople": maxPeople,
    "qty": qty,
  };
}

class ShopTableUpdateReqDto{
  List<TableReqDto> tableReqDtoListDto;

  ShopTableUpdateReqDto(
      this.tableReqDtoListDto
      );
  Map<String, dynamic> toJson() => {
    "shopTableQtyDtoList": tableReqDtoListDto,
  };
}