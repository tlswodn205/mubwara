class SubscribeDto {
  int? id;

  SubscribeDto({required this.id});

  factory SubscribeDto.fromJson(Map<String, dynamic> json) =>
      SubscribeDto(id: json["id"]);
}
