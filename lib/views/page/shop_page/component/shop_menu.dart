import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/controller/menu_controller.dart';
import 'package:mubwara/dto/response/menu_resp_dto.dart';
import 'package:mubwara/views/page/reservation_management_page/model/menu_model.dart';

class ShopMenu extends ConsumerStatefulWidget {
  const ShopMenu({required this.menuRespDtoList ,Key? key}) : super(key: key);
  final List<MenuRespDto> menuRespDtoList;
  @override
  ConsumerState<ShopMenu> createState() => _ShopMenuState();
}

class _ShopMenuState extends ConsumerState<ShopMenu> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.menuRespDtoList.length,
      itemBuilder: (context, ListIndex) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Row(
              children: [
                Container(
                  child: Center(
                    child: Image.memory(
                      base64Decode(widget.menuRespDtoList[ListIndex].imageFileDto.image),
                      width: 110,
                      height: 110,
                      fit: BoxFit.cover,
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
                    children: [
                      Text(
                        '${widget.menuRespDtoList[ListIndex].name}',
                        style: TextStyle(fontSize: 17),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        '가격 : ${widget.menuRespDtoList[ListIndex].price}원',
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
