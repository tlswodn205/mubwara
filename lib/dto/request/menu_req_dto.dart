class MenuReqDto {
  int? id;
  String? name;
  String? price;
  int? recommanded;
  List<String>? imageFile;

  MenuReqDto.origin();

  MenuReqDto(
      // this.image,
      this.id,
      this.name,
      this.price,
      this.recommanded,
      this.imageFile);

  Map<String, dynamic> toJson() => {
        "name": name,
    "shopId" : id,
        "price": price,
        "recommanded": recommanded,
        "imageFile": imageFile,
        // "image": image,
      };
}
