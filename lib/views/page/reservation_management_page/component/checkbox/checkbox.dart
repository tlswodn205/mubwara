import 'package:flutter/material.dart';
import 'package:mubwara/views/common/const/color.dart';
import 'package:mubwara/views/page/reservation_management_page/component/checkbox/checkboxlist.dart';

class CheckBoxListTileDemo extends StatefulWidget {
  @override
  CheckBoxListTileDemoState createState() => new CheckBoxListTileDemoState();
}

class CheckBoxListTileDemoState extends State<CheckBoxListTileDemo> {
  List<CheckBoxListTileModel> checkBoxListTileModel =
      CheckBoxListTileModel.getUsers();

  late List<int> checklist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '편의시설',
          style: TextStyle(color: Body_TEXT_COLOR2, fontSize: 18),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop(itemChange); //뒤로가기
            },
            color: Body_TEXT_COLOR2,
            icon: Icon(Icons.arrow_back)),
      ),
      body: ListView.builder(
        itemCount: checkBoxListTileModel.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                CheckboxListTile(
                  activeColor: PRIMARY_COLOR,
                  dense: true,
                  //font change
                  title: Text(
                    checkBoxListTileModel[index].title,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5),
                  ),
                  value: checkBoxListTileModel[index].isCheck,
                  secondary: Container(
                    height: 50,
                    width: 50,
                    child: Image.asset(
                      checkBoxListTileModel[index].img,
                      fit: BoxFit.cover,
                    ),
                  ),
                  onChanged: (bool? val) {
                    itemChange(val!, index);
                    if (val) {
                      checklist.add(checkBoxListTileModel[index].optionId);
                    } else {
                      checklist.remove(checkBoxListTileModel[index].optionId);
                    }
                    print(checklist.toString());
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void itemChange(bool val, int index) {
    setState(() {
      checkBoxListTileModel[index].isCheck = val;
    });
  }
}
