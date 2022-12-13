import 'package:flutter/material.dart';

class CheckBoxListTileModel {
  int optionId;
  String img;
  String title;
  bool isCheck;

  CheckBoxListTileModel(
      {required this.optionId,
      required this.img,
      required this.title,
      required this.isCheck});

  static List<CheckBoxListTileModel> getUsers() {
    return <CheckBoxListTileModel>[
      CheckBoxListTileModel(
          optionId: 1,
          img: 'assets/images/feature/24_free.png',
          title: "24시간",
          isCheck: false),
      CheckBoxListTileModel(
          optionId: 2,
          img: 'assets/images/feature/disabled.png',
          title: "장애인석",
          isCheck: false),
      CheckBoxListTileModel(
          optionId: 3,
          img: 'assets/images/feature/dog.png',
          title: "반려동물 가능",
          isCheck: false),
      CheckBoxListTileModel(
          optionId: 4,
          img: 'assets/images/feature/drink.png',
          title: "콜키지",
          isCheck: false),
      CheckBoxListTileModel(
          optionId: 5,
          img: 'assets/images/feature/nokids.png',
          title: "노키즈존",
          isCheck: false),
      CheckBoxListTileModel(
          optionId: 6,
          img: 'assets/images/feature/park.png',
          title: "발렛파킹",
          isCheck: false),
      CheckBoxListTileModel(
          optionId: 7,
          img: 'assets/images/feature/rettering.png',
          title: "레터링",
          isCheck: false),
      CheckBoxListTileModel(
          optionId: 8,
          img: 'assets/images/feature/smoke.png',
          title: "흡연석",
          isCheck: false),
    ];
  }
}
