import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mubwara/dto/response/shop_resp_dto.dart';

class ReviewWritePage extends StatelessWidget {
  const ReviewWritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            Text("${shopList[0].shop_name} 리뷰 작성하기",
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildButton(
                    buttonName: "이미지 추가 하기",
                    buttonBackgroundColor: Colors.grey,
                    fontColor: Colors.white,
                    widthSize: 120),
              ],
            ),
            SizedBox(height: 10),
            _buildTextFeild("리뷰내용", "null"),
            SizedBox(height: 30),
            _buildButton(
                buttonName: "리뷰 작성 완료",
                buttonBackgroundColor: Colors.grey,
                fontColor: Colors.white,
                widthSize: 330)
          ],
        ),
      ),
    );
  }

  Widget _buildTextFeild(String feildName, String defaultText) {
    return Center(
      child: SizedBox(
        width: 330,
        child: TextField(
          decoration: InputDecoration(
            labelText: '${feildName}',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.multiline,
          minLines: 5,
          maxLines: 10,
        ),
      ),
    );
  }

  Widget _buildButton(
      {required String buttonName,
      required Color buttonBackgroundColor,
      required Color fontColor,
      required double widthSize}) {
    return Container(
      width: widthSize,
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: buttonBackgroundColor,
        ),
        onPressed: () {},
        child: Text("${buttonName}",
            style: TextStyle(fontSize: 20, color: fontColor)),
      ),
    );
  }
}
