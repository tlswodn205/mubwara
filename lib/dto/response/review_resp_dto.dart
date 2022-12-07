class ReviewRespDto {
  ReviewRespDto({
    required this.id,
    required this.score,
    required this.content,
  });

  int id;
  int score;
  String content;

  factory ReviewRespDto.fromJson(Map<String, dynamic> json) => ReviewRespDto(
        id: json["id"],
        score: json["score"],
        content: json["content"],
      );
}
