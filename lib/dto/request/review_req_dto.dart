class ReviewReqDto{
  int? score;
  String? content;
  List<String>? imageFile;
  int? shopId;
  ReviewReqDto.origin();

  ReviewReqDto(
      // this.image,
      this.score, this.content,this.imageFile,this.shopId);
  Map<String, dynamic> toJson() => {
    "score": score,
    "content": content,
    "imageFile": imageFile,
  };
}
