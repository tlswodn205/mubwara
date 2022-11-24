class shopListRespDto {
  int shop_id;
  String image;
  String shop_name;
  String information;
  double review_score;
  int reviewer_count;
  String category;
  String address;
  int price;

  shopListRespDto(
      {required this.shop_id,
      required this.image,
      required this.shop_name,
      required this.information,
      required this.review_score,
      required this.reviewer_count,
      required this.category,
      required this.address,
      required this.price});
}

List<shopListRespDto> shopList = [
  shopListRespDto(
      shop_id: 1,
      image: "shop1.jpg",
      shop_name: "밥집",
      information: "밥집입니다~~",
      review_score: 3.7,
      reviewer_count: 190,
      category: "한식",
      address: "부산어딘가",
      price: 20000),
  shopListRespDto(
      shop_id: 2,
      image: "shop2.jpg",
      shop_name: "양식집",
      information: "양식집입니다~~",
      review_score: 4.6,
      reviewer_count: 200,
      category: "양식",
      address: "부산어딘가",
      price: 30000),
  shopListRespDto(
      shop_id: 3,
      image: "shop3.jpg",
      shop_name: "일식집",
      information: "일식집입니다~~",
      review_score: 4.0,
      reviewer_count: 130,
      category: "일식",
      address: "부산어딘가",
      price: 40000),
];
