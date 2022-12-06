class ImageFileDto {
  ImageFileDto({
    required this.id,
    required this.image,
  });

  int id;
  String image;

  factory ImageFileDto.fromJson(Map<String, dynamic> json) => ImageFileDto(
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
      };
}
