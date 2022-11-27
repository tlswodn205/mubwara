import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mubwara/dto/response/shop_resp_dto.dart';

class ReviewWritePage extends StatelessWidget {
  const ReviewWritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Column(
      children: [
        SizedBox(height: 60),
        Text("${shopList[0].shop_name} 리뷰 작성하기",),
        SizedBox(height: 30),
        _buildTextFeild("리뷰내용", "null"),
        SizedBox(height: 30),
        _buildButton(
            buttonName: "회원 수정 하기",
            buttonBackgroundColor: Colors.grey,
            fontColor: Colors.white)
      ],
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
        required Color fontColor}) {
    return Container(
      width: 330,
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
