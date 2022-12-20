import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/controller/option_controller.dart';
import 'package:mubwara/views/common/components/toastzip.dart';
import 'package:mubwara/views/common/const/color.dart';
import 'package:mubwara/views/component/boundary.dart';
import 'package:mubwara/views/page/reservation_management_page/component/checkbox/checkboxlist.dart';

class ShopOptionList extends ConsumerStatefulWidget {
  @override
  ShopOptionListState createState() => new ShopOptionListState();
}

class ShopOptionListState extends ConsumerState<ShopOptionList> {
  List<CheckBoxListTileModel> checkBoxListTileModel =
      CheckBoxListTileModel.getUsers();

  late List<int> checklist = [2, 1];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 70.0 * checkBoxListTileModel.length,
        child: ListView.builder(
            itemCount: checklist.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      child: Image.asset(
                        checkBoxListTileModel[checklist[index]].img,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 30),
                    Text(
                      checkBoxListTileModel[checklist[index]].title,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }

  void itemChange(bool val, int index) {
    setState(() {
      checkBoxListTileModel[index].isCheck = val;
    });
  }
}
