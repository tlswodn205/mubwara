import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/dto/response/customer_resp_dto.dart';
import 'package:mubwara/views/component/boundary.dart';


import '../../dto/response/shop_resp_dto.dart';
import '../common/const/color.dart';

class ReservationListItem extends ConsumerWidget {
  const ReservationListItem({required this.listIndex,
    required this.rm, Key? key})
      : super(key: key);
  final int listIndex;
  final List<CustomerMyPageReservationRespDto> rm;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  child: Center(
                    // child: Image.memory(
                    //     base64.decode(rm[listIndex].imageFileDto.image),
                    //   width: 100,
                    //   height: 100,
                    //   fit: BoxFit.fill,),
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
                        rm[listIndex].shopName,
                        style: TextStyle(fontSize: 19),
                      ),
                      SizedBox(height: 7),
                      Row(
                        children: [
                          _IconText(
                            icon: Icons.timelapse_outlined,
                            label: rm[listIndex].reservationTime,
                          ),
                          renderDot(),
                          _IconText(
                            icon: Icons.calendar_month,
                            label: rm[listIndex].reservationDate,
                          ),
                        ],
                      ),
                      SizedBox(height: 7),
                      Row(
                        children: [
                          _IconText(
                            icon: Icons.home,
                            label: rm[listIndex].address,
                          ),
                          renderDot(),
                          _IconText(
                            icon: Icons.phone,
                            label: rm[listIndex].category,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Boundary()
        ],
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
