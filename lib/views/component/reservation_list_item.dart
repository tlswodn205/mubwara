import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mubwara/views/component/review_star_make.dart';

import '../../dto/response/shop_resp_dto.dart';
import '../common/const/color.dart';

class ReservationListItem extends StatelessWidget {
  const ReservationListItem({required this.listIndex, Key? key})
      : super(key: key);
  final int listIndex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Row(
            children: [
              Container(
                child: Center(
                  child: Image.asset(
                    'assets/images/shop/${shopList[listIndex].image}',
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shopList[listIndex].shop_name,
                      style: TextStyle(fontSize: 19),
                    ),
                    SizedBox(height: 7),
                    Row(
                      children: [
                        _IconText(
                          icon: Icons.timelapse_outlined,
                          label: '11:00',
                        ),
                        renderDot(),
                        _IconText(
                          icon: Icons.person,
                          label: '5명',
                        ),
                      ],
                    ),
                    SizedBox(height: 7),
                    Row(
                      children: [
                        _IconText(
                          icon: Icons.home,
                          label: '${shopList[listIndex].address}',
                        ),
                        renderDot(),
                        _IconText(
                          icon: Icons.phone,
                          label: '${shopList[listIndex].telephone}',
                        ),
                      ],
                    ),
                    SizedBox(height: 7),
                    _IconText(
                      icon: Icons.monetization_on,
                      label: '${shopList[listIndex].price}',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget renderDot() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Text(
        '·',
        style: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _IconText extends StatelessWidget {
  final IconData icon;
  final String label;

  const _IconText({required this.icon, required this.label, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: PRIMARY_COLOR,
          size: 14.0,
        ),
        const SizedBox(width: 8.0),
        Text(
          label,
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
