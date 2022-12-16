import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/controller/subscribe_controller.dart';
import 'package:mubwara/provider/auth_provider.dart';
import 'package:mubwara/views/common/const/color.dart';
import 'package:mubwara/views/page/reservation_page/reservation_screen.dart';

class bottomNavBar extends ConsumerStatefulWidget {
  const bottomNavBar({required this.shopId, Key? key}) : super(key: key);

  final int shopId;

  @override
  ConsumerState<bottomNavBar> createState() => _bottomNavBarState();
}

class _bottomNavBarState extends ConsumerState<bottomNavBar> {
  late bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
    }

    final scc = ref.read(subscribeController);

    final ap = ref.read(authProvider);
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
              scc.subscribeButtonClick(_isSelected, widget.shopId);
              setState(() {
                _isSelected = !_isSelected;
              });
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
