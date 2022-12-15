import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/controller/user_controller.dart';
import 'package:mubwara/dto/request/user_req_dto.dart';
import 'package:mubwara/views/common/components/toastzip.dart';
import 'package:mubwara/views/page/login_page/login_page_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../join_page/join_page.dart';
import 'component/kakao_login.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginPage> createState() => _loginPage();
}

class _loginPage extends ConsumerState<LoginPage> {
  @override
  late LoginReqDto loginReqDto = LoginReqDto.origin();
  Widget build(BuildContext context) {
    final us = ref.watch(loginPageModel);
    final uc = ref.read(userController);
    return Container(
      child: Column(
        children: [
          SizedBox(height: 20),
          _buildTextFeild(
              feildName: "아이디",
              onChanged: (value) {
                loginReqDto.username = value;
              },
              hideText: false),
          SizedBox(height: 20),
          _buildTextFeild(
              feildName: "비밀번호",
              onChanged: (value) {
                loginReqDto.password = value;
              },
              hideText: true),
          SizedBox(height: 60),
          _buildLoginButton(
              buttonName: "로그인 ",
              buttonBackgroundColor: Colors.blue,
              fontColor: Colors.white,
              userController: uc,
              loginReqDto: loginReqDto),
          SizedBox(height: 20),
          _buildButton(
              buttonName: "회원 가입",
              buttonBackgroundColor: Colors.grey,
              fontColor: Colors.white),
          Kakaobutton(),
        ],
      ),
    );
  }

  Widget _buildLoginButton(
      {required String buttonName,
      required Color buttonBackgroundColor,
      required Color fontColor,
      required UserController userController,
      required LoginReqDto loginReqDto}) {
    return Container(
      width: 330,
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: buttonBackgroundColor,
        ),
        onPressed: () {
          userController.Login(loginReqDto: loginReqDto);
          showLoginToast();
        },
        child: Text("${buttonName}",
            style: TextStyle(fontSize: 20, color: fontColor)),
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

  Widget _buildTextFeild(
      {required String feildName,
      required ValueChanged<String>? onChanged,
      required bool hideText}) {
    return Center(
      child: SizedBox(
        width: 330,
        child: TextField(
          onChanged: onChanged,
          obscureText: hideText,
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
