import 'package:mubwara/dto/response/image_file_dto.dart';

class MenuRespDto {
  MenuRespDto(
      {required this.name,
        required this.id,
      required this.price,
      required this.recommanded,
      required this.imageFileDto});

  String? name;
  int? id;
  int? price;
  int? recommanded;
  ImageFileDto imageFileDto;


  factory MenuRespDto.fromJson(Map<String, dynamic> json) => MenuRespDto(
    id : json["id"],
        name: json["name"],
        price: json["price"],
        recommanded: json["recommanded"],
        imageFileDto: ImageFileDto.fromJson(json["imageFile"]),
      );
}
