import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/controller/subscribe_controller.dart';
import 'package:mubwara/provider/auth_provider.dart';
import 'package:mubwara/views/common/const/color.dart';
import 'package:mubwara/views/page/reservation_page/reservation_screen.dart';
import 'package:mubwara/views/page/shop_page/shop_detail_model.dart';

class bottomNavBar extends ConsumerStatefulWidget {
  bottomNavBar(
      {required this.name,
      required this.perPrice,
      required this.shopId,
      Key? key})
      : super(key: key);

  final int shopId;
  final String name;
  final int perPrice;

  @override
  ConsumerState<bottomNavBar> createState() => _bottomNavBarState();
}

class _bottomNavBarState extends ConsumerState<bottomNavBar> {
  late bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    int? subscribeId =
        ref.watch(shopDetailPageModel(widget.shopId))?.subscribeId;
    @override
    void initState() {
      super.initState();
    }

    final scc = ref.read(subscribeController);

    final ap = ref.read(authProvider);
    if (subscribeId == 0) {
      _isSelected = false;
    } else {
      _isSelected = true;
    }
    return Container(
      height: 56,
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              width: 66,
              color: Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.phone, color: Body_TEXT_COLOR1),
                  Text(
                    "연락하기",
                    style: TextStyle(color: Body_TEXT_COLOR1),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              scc.subscribeButtonClick(subscribeId, widget.shopId);
              setState(() {
                if (subscribeId == 0) {
                  _isSelected = false;
                } else {
                  _isSelected = true;
                }
              });
              print(subscribeId);
            },
            child: Container(
              width: 66,
              color: _isSelected ? Colors.red : Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _isSelected
                      ? Icon(Icons.notifications, color: Body_TEXT_COLOR1)
                      : Icon(Icons.notifications_active,
                          color: Body_TEXT_COLOR1),
                  Text(
                    _isSelected ? "구독취소" : "구독하기",
                    style: TextStyle(
                      color: Body_TEXT_COLOR1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => reservationScreen(
                      shopId: widget.shopId,
                      name: widget.name,
                      perPrice: widget.perPrice,
                    ),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                color: PRIMARY_COLOR,
                child: Text("예약하러 가기",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Body_TEXT_COLOR1)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
