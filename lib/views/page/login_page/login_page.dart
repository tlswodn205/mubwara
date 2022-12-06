import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/controller/user_controller.dart';
import 'package:mubwara/views/page/login_page/login_page_model.dart';

import '../join_page/join_page.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginPage> createState() => _loginPage();
}

class _loginPage extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final us = ref.watch(loginPageModel);
    final uc = ref.read(userController);
    return Container(
      child: Column(
        children: [
          SizedBox(height: 20),
          _buildTextFeild(feildName: "아이디"),
          SizedBox(height: 20),
          _buildTextFeild(feildName: "비밀번호"),
          SizedBox(height: 60),
          _buildLoginButton(
            buttonName: "로그인 ",
            buttonBackgroundColor: Colors.blue,
            fontColor: Colors.white,
            userController: uc,
          ),
          SizedBox(height: 20),
          _buildButton(
              buttonName: "회원 가입",
              buttonBackgroundColor: Colors.grey,
              fontColor: Colors.white),
          SizedBox(height: 30),
          _buildLoginTestButton(
            buttonName: "카카오로 로그인하기",
            buttonBackgroundColor: Colors.yellow,
            fontColor: Colors.black,
            userController: uc,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginButton(
      {required String buttonName,
      required Color buttonBackgroundColor,
      required Color fontColor,
      required UserController userController}) {
    return Container(
      width: 330,
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: buttonBackgroundColor,
        ),
        onPressed: () {
          userController.Login();
        },
        child: Text("${buttonName}",
            style: TextStyle(fontSize: 20, color: fontColor)),
      ),
    );
  }

  Widget _buildLoginTestButton(
      {required String buttonName,
      required Color buttonBackgroundColor,
      required Color fontColor,
      required UserController userController}) {
    return Container(
      width: 330,
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: buttonBackgroundColor,
        ),
        onPressed: () {
          userController.LoginTest();
        },
        child: Text("${buttonName}",
            style: TextStyle(fontSize: 20, color: fontColor)),
      ),
    );
  }

  Widget _buildButton({
    required String buttonName,
    required Color buttonBackgroundColor,
    required Color fontColor,
  }) {
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
