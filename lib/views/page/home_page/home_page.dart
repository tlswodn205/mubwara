import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../component/shop_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Image.asset(
              "assets/images/shop/shop1.jpg",
              height: 270,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMainPageButton(icon: "🥘", text: "한식"),
              _buildMainPageButton(icon: "🍣", text: "일식"),
              _buildMainPageButton(icon: "🍝", text: "양식"),
              _buildMainPageButton(icon: "🍜", text: "중식"),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMainPageButton(icon: "⭐", text: "인기"),
              _buildMainPageButton(icon: "🗺︎", text: "지역"),
              _buildMainPageButton(icon: "🪙", text: "가격"),
              _buildMainPageButton(icon: "🗄️", text: "편의"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMainPageButton({
    required String icon,
    required String text,
  }) {
    return Container(
      height: 70,
      width: 70,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35.0),
          )),
        ),
        onPressed: () {},
        child: Column(
          children: [
            Text(
              "${icon}",
              style: TextStyle(fontSize: 25),
            ),
            Text(
              "${text}",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
