import 'package:flutter/material.dart';
import 'package:mubwara/controller/menu_controller.dart';
import 'package:mubwara/views/common/const/color.dart';

class MenuCard extends StatefulWidget {
  final int? id;
  final String menu_name;
  final String menu_price;
  final Image image;
  final MenuController mc;

  const MenuCard(
      {required this.image,
        required this.id,
        required this.mc,
        required this.menu_name,
      required this.menu_price,
      Key? key})
      : super(key: key);

  @override
  State<MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  var is_recommanded = false;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: widget.image,
            ),
            const SizedBox(
              width: 16.0,
            ),
            Column(
              children: [
                Text(
                  widget.menu_name,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  '${widget.menu_price}원',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Body_TEXT_COLOR,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(
              width: 40,
            ),
            Column(
              children: [
                Text('추천메뉴'),
                Checkbox(
                  value: is_recommanded,
                  onChanged: (value) {
                    setState(() {
                      is_recommanded = value!;
                    });
                  },
                ),
                SizedBox(height: 20,),
              ],
            ),
            Container(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      widget.mc.deleteMenu(widget.id!);
                    },
                    icon: Icon(Icons.delete),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
