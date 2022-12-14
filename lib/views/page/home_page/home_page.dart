import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/controller/shop_controller.dart';
import 'package:mubwara/views/common/const/color.dart';
import 'package:mubwara/views/page/home_page/component/new_shop_page.dart';
import 'package:mubwara/views/page/search_page/search_page_model.dart';

class HomePage extends ConsumerStatefulWidget {
  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final us = ref.watch(searchPageModel);
    final uc = ref.read(shopController);
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
              _buildMainPageButton(icon: "🥘", text: "한식", onPressed: (){
                uc.shopCategory("한식");
              }),
              _buildMainPageButton(icon: "🍣", text: "일식",onPressed: (){
                uc.shopCategory("일식");

              }),
              _buildMainPageButton(icon: "🍝", text: "양식",onPressed: (){
                uc.shopCategory("양식");

              }),
              _buildMainPageButton(icon: "🍜", text: "중식",onPressed: (){
                uc.shopCategory("중식");
              }),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMainPageButton(icon: "⭐", text: "인기",onPressed: (){
                uc.shopPopularList();
              }),
              _buildMainPageButton(icon: "🗺︎", text: "지역",onPressed: (){}),
              _buildMainPageButton(icon: "🪙", text: "가격",onPressed: (){
                uc.shopPriceList("lower");
              }),
              _buildMainPageButton(icon: "🗄️", text: "편의",onPressed: (){
                uc.shopOption();

              }),
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
                    image: Image.asset('assets/images/review/cow.jpg',
                      fit: BoxFit.cover,width: 100, height: 100,),
                    shop_name: '태백한우',
                  ),
                  NewShopPage(
                    image: Image.asset('assets/images/review/duck.jpg',
                      fit: BoxFit.cover,width: 100, height: 100,),
                    shop_name: '북구오리',
                  ),
                  NewShopPage(
                    image: Image.asset('assets/images/review/Foiegras.jpg',
                      fit: BoxFit.cover,width: 100, height: 100,),
                    shop_name: 'CHOI',
                  ),
                  NewShopPage(
                    image: Image.asset('assets/images/review/pasta.jpg',
                      fit: BoxFit.cover,width: 100, height: 100,),
                    shop_name: 'chefMuseum',
                  ),
                  NewShopPage(
                    image: Image.asset('assets/images/review/steak.jpg',
                      fit: BoxFit.cover,width: 100, height: 100,),
                    shop_name: 'OUTBACK',
                  ),
                  NewShopPage(
                    image: Image.asset('assets/images/review/sushi.jpg',
                      fit: BoxFit.cover,width: 100, height: 100,),
                    shop_name: '스시투어',
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
        onPressed: onPressed,
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
