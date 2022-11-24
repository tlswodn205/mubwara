import 'package:flutter/material.dart';
import 'package:mubwara/views/page/search_page/component/restaurant_card.dart';
import 'package:mubwara/views/page/search_page/component/search_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: searchBar(),
      body: Column(
        children: [
          Center(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child:
              RestaurantCard(
                image: Image.asset('assets/images/review/ddeok_bok_gi.jpg',
                  fit: BoxFit.cover,),
                shop_name: '쉐프의 떡볶이',
                tags: ['떡볶이', '치즈', '매운맛'],
                address: '화명동',
                telephone:'01024102957',
                open_time:'10:00',
                close_time:'22:00',
                information:'어린이 간식, 아빠 술 안주로 좋아요!',
              ),
            ),
          ),
        )
        ],
      ),
    );
  }
}