import 'image_file_dto.dart';

class OptionListRespDto{
   int id;
   String name;
   ImageFileDto image;

   OptionListRespDto({required this.id,required this.name,required this.image});

   factory OptionListRespDto.fromJson(Map<String, dynamic> json) => OptionListRespDto(
     id : json["id"],
     name: json["name"],
     image: ImageFileDto.fromJson(json["image"]),
   );
}