class Review {
  int review_id;
  int customer_id;
  int shop_id;
  int review_score;
  String content;
  String image;

  Review(
      {required this.review_id,
      required this.customer_id,
      required this.shop_id,
      required this.review_score,
      required this.content,
      required this.image});
}

List<Review> reviewList = [
  Review(
    review_id: 1,
    customer_id: 1,
    shop_id: 1,
    review_score: 5,
    content: "그저 빛;;;;",
    image: "food1.jpg",
  ),
  Review(
    review_id: 2,
    customer_id: 2,
    shop_id: 1,
    review_score: 4,
    content: "오케이",
    image: "food2.jpg",
  ),
  Review(
    review_id: 3,
    customer_id: 3,
    shop_id: 1,
    review_score: 5,
    content: "추천",
    image: "food3.jpg",
  ),
];
