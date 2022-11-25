import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mubwara/views/page/join_page/join_page.dart';
import 'package:remedi_kopo/remedi_kopo.dart';

import '../../common/const/color.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _loginPage createState() => _loginPage();
}

class _loginPage extends State<LoginPage> {
  TextEditingController _AddressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 20),
          _buildTextFeild(feildName: "아이디"),
          SizedBox(height: 20),
          _buildTextFeild(feildName: "비밀번호"),
          SizedBox(height: 60),
          _buildButton(
              buttonName: "로그인 ",
              buttonBackgroundColor: Colors.blue,
              fontColor: Colors.white),
          SizedBox(height: 20),
          _buildButton(
              buttonName: "회원 가입",
              buttonBackgroundColor: Colors.grey,
              fontColor: Colors.white),
          SizedBox(height: 30),
          _buildButton(
              buttonName: "카카오로 로그인하기",
              buttonBackgroundColor: Colors.yellow,
              fontColor: Colors.black),
        ],
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => JoinPage(),
            ),
          );
        },
        child: Text("${buttonName}",
            style: TextStyle(fontSize: 20, color: fontColor)),
      ),
    );
  }

  Widget _buildTextFeild({required String feildName}) {
    return Center(
      child: SizedBox(
        width: 330,
        child: TextField(
          decoration: InputDecoration(
            labelText: '${feildName}',
            hintText: '${feildName}를 입력하세요',
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
