import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mubwara/views/common/const/color.dart';
import 'package:mubwara/views/page/home_page/component/new_shop_page.dart';
import 'package:mubwara/views/page/reservation_page/component/schedule_card.dart';

class HomePage extends StatelessWidget {
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Container(
            height: 270,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: CarouselSlider(
                carouselController: _controller,
                options: CarouselOptions(
                    height: 270,
                    autoPlay: true,
                    scrollDirection: Axis.horizontal,
                    enlargeCenterPage: true,
                    viewportFraction: 1.0),
                items: [1, 2, 3, 4, 5, 6, 7]
                    .map(
                      (e) => Image.asset(
                        'assets/images/notice/notice$e.jpg',
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMainPageButton(icon: "🥘", text: "한식", onPressed: (){}),
              _buildMainPageButton(icon: "🍣", text: "일식",onPressed: (){}),
              _buildMainPageButton(icon: "🍝", text: "양식",onPressed: (){}),
              _buildMainPageButton(icon: "🍜", text: "중식",onPressed: (){}),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMainPageButton(icon: "⭐", text: "인기",onPressed: (){}),
              _buildMainPageButton(icon: "🗺︎", text: "지역",onPressed: (){}),
              _buildMainPageButton(icon: "🪙", text: "가격",onPressed: (){}),
              _buildMainPageButton(icon: "🗄️", text: "편의",onPressed: (){}),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              '에디터 선정 베스트 맛집!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(12),
              child: Row(
                children: <Widget>[
                  NewShopPage(
                    image: Image.asset('assets/images/review/ddeok_bok_gi.jpg',
                      fit: BoxFit.cover,width: 100, height: 100,),
                    shop_name: '엽떡',
                  ),
                  NewShopPage(
                    image: Image.asset('assets/images/review/ddeok_bok_gi.jpg',
                      fit: BoxFit.cover,width: 100, height: 100,),
                    shop_name: '엽떡',
                  ),
                  NewShopPage(
                    image: Image.asset('assets/images/review/ddeok_bok_gi.jpg',
                      fit: BoxFit.cover,width: 100, height: 100,),
                    shop_name: '엽떡',
                  ),
                  NewShopPage(
                    image: Image.asset('assets/images/review/ddeok_bok_gi.jpg',
                      fit: BoxFit.cover,width: 100, height: 100,),
                    shop_name: '엽떡',
                  ),
                  NewShopPage(
                    image: Image.asset('assets/images/review/ddeok_bok_gi.jpg',
                      fit: BoxFit.cover,width: 100, height: 100,),
                    shop_name: '엽떡',
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMainPageButton({
    required String icon,
    required String text,
    required onPressed
  }) {
    return Container(
      height: 70,
      width: 70,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Body_TEXT_COLOR1),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
              side: BorderSide(color: Body_TEXT_COLOR2, width: 3),
            ),
          ),
        ),
        onPressed: () {},
        child: Column(
          children: [
            Text(
              "${icon}",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 5,
              width: 5,
            ),
            Text(
              "${text}",
              style: TextStyle(
                  color: Body_TEXT_COLOR2, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
