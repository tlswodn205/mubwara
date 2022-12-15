import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/controller/option_controller.dart';
import 'package:mubwara/views/common/const/color.dart';
import 'package:mubwara/views/page/reservation_management_page/component/checkbox/checkboxlist.dart';

class CheckBoxListTileDemo extends ConsumerStatefulWidget {
  @override
  CheckBoxListTileDemoState createState() => new CheckBoxListTileDemoState();
}

class CheckBoxListTileDemoState extends ConsumerState<CheckBoxListTileDemo> {
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
      body: Column(
        children: [
          Container(
            height: 70.0 * checkBoxListTileModel.length,
            child: ListView.builder(
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
                                checklist
                                    .add(checkBoxListTileModel[index].optionId);
                              } else {
                                checklist.remove(
                                    checkBoxListTileModel[index].optionId);
                              }
                              print(checklist.toString());
                            }),
                      ],
                    ),
                  );
                }),
          ),
          Container(
            width: 330,
            height: 50,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: PRIMARY_COLOR,
              ),
              onPressed: () {
                ref.read(optionController).optionSave(checklist);
              },
              child: Text("편의 시설 저장",
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  void itemChange(bool val, int index) {
    setState(() {
      checkBoxListTileModel[index].isCheck = val;
    });
  }
}
