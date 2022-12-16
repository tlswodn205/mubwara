import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/controller/shop_controller.dart';
import 'package:mubwara/views/common/components/toastzip.dart';
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
              _buildMainPageButton(
                  icon: "🥘",
                  text: "한식",
                  onPressed: () {
                    uc.shopCategory("한식");
                    showHomeButtonToast();
                  }),
              _buildMainPageButton(
                  icon: "🍣",
                  text: "일식",
                  onPressed: () {
                    uc.shopCategory("일식");
                    showHomeButtonToast();
                  }),
              _buildMainPageButton(
                  icon: "🍝",
                  text: "양식",
                  onPressed: () {
                    uc.shopCategory("양식");
                    showHomeButtonToast();
                  }),
              _buildMainPageButton(
                  icon: "🍜",
                  text: "중식",
                  onPressed: () {
                    uc.shopCategory("중식");
                    showHomeButtonToast();
                  }),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMainPageButton(
                  icon: "⭐",
                  text: "인기",
                  onPressed: () {
                    uc.shopPopularList();
                    showHomeButtonToast();
                  }),
              _buildMainPageButton(
                  icon: "🗺︎",
                  text: "지역",
                  onPressed: () {
                    _showbusanDialog(sc: uc);
                    showHomeButtonToast();
                  }),
              _buildMainPageButton(
                  icon: "🪙",
                  text: "가격",
                  onPressed: () {
                    _showDialog(sc: uc);
                  }),
              _buildMainPageButton(
                  icon: "🗄️",
                  text: "편의",
                  onPressed: () {
                    uc.shopOption();
                    showHomeButtonToast();
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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(12),
            child: Row(
              children: <Widget>[
                NewShopPage(
                  image: Image.asset(
                    'assets/images/review/cow.jpg',
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                  ),
                  shop_name: '태백한우',
                ),
                NewShopPage(
                  image: Image.asset(
                    'assets/images/review/duck.jpg',
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                  ),
                  shop_name: '북구오리',
                ),
                NewShopPage(
                  image: Image.asset(
                    'assets/images/review/Foiegras.jpg',
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                  ),
                  shop_name: 'CHOI',
                ),
                NewShopPage(
                  image: Image.asset(
                    'assets/images/review/pasta.jpg',
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                  ),
                  shop_name: 'chefMuseum',
                ),
                NewShopPage(
                  image: Image.asset(
                    'assets/images/review/steak.jpg',
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                  ),
                  shop_name: 'OUTBACK',
                ),
                NewShopPage(
                  image: Image.asset(
                    'assets/images/review/sushi.jpg',
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                  ),
                  shop_name: '스시투어',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainPageButton(
      {required String icon, required String text, required onPressed}) {
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

  void _showDialog({required ShopController sc}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  child: Text("비싼 순으로"),
                  onPressed: () {
                    sc.shopPriceList("higher");
                    showHomeButtonToast();
                  },
                ),
                ElevatedButton(
                  child: Text("저렴한 순으로"),
                  onPressed: () {
                    sc.shopPriceList("lower");
                    showHomeButtonToast();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void _showbusanDialog({required ShopController sc}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          height: 200,
          child: AlertDialog(
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    child: Text("중구",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      sc.shopPriceList("higher");
                      showHomeButtonToast();
                    },
                  ),
                  ElevatedButton(
                    child: Text("서구",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      sc.shopPriceList("higher");
                      showHomeButtonToast();
                    },
                  ),
                  ElevatedButton(
                    child: Text("동구",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      sc.shopPriceList("higher");
                      showHomeButtonToast();
                    },
                  ),
                  ElevatedButton(
                    child: Text("영도구",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      sc.shopPriceList("higher");
                      showHomeButtonToast();
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    child: Text("진구",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      sc.shopRegionList("부산진구");
                      showHomeButtonToast();
                    },
                  ),
                  ElevatedButton(
                    child: Text("동래구",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      sc.shopPriceList("higher");
                      showHomeButtonToast();
                    },
                  ),
                  ElevatedButton(
                    child: Text("남구",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      sc.shopPriceList("higher");
                      showHomeButtonToast();
                    },
                  ),
                  ElevatedButton(
                    child: Text("북구",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      sc.shopPriceList("higher");
                      showHomeButtonToast();
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    child: Text("해운대",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      sc.shopPriceList("higher");
                      showHomeButtonToast();
                    },
                  ),
                  ElevatedButton(
                    child: Text(
                      "사하구",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      sc.shopPriceList("higher");
                      showHomeButtonToast();
                    },
                  ),
                  ElevatedButton(
                    child: Text("금정구",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      sc.shopPriceList("higher");
                      showHomeButtonToast();
                    },
                  ),
                  ElevatedButton(
                    child: Text("강서구",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      sc.shopPriceList("higher");
                      showHomeButtonToast();
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    child: Text("연제구",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      sc.shopPriceList("higher");
                      showHomeButtonToast();
                    },
                  ),
                  ElevatedButton(
                    child: Text("수영구",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      sc.shopPriceList("higher");
                      showHomeButtonToast();
                    },
                  ),
                  ElevatedButton(
                    child: Text("사상구",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      sc.shopPriceList("higher");
                      showHomeButtonToast();
                    },
                  ),
                  ElevatedButton(
                    child: Text("기장군",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      sc.shopPriceList("higher");
                      showHomeButtonToast();
                    },
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
