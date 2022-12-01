import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remedi_kopo/remedi_kopo.dart';

import '../../layout/default_layout.dart';

class JoinPage extends StatefulWidget {
  JoinPage({Key? key}) : super(key: key);

  @override
  _joinPage createState() => _joinPage();
}

class _joinPage extends State<JoinPage> {
  TextEditingController _AddressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: "회원가입",
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            _buildTextFeild("아이디", "null"),
            Row(
              children: [
                SizedBox(
                  width: 240,
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: Text(
                    '아이디 중복 체크',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            _buildTextFeild("비밀번호", "null"),
            SizedBox(height: 30),
            _buildTextFeild("비밀번호 확인", "null"),
            SizedBox(height: 30),
            _buildTextFeild("이름", "null"),
            SizedBox(height: 30),
            AddressText(),
            SizedBox(height: 10),
            _buildTextFeild("전화번호", "null"),
            SizedBox(height: 30),
            _buildButton(
                buttonName: "회원 정보 변경",
                buttonBackgroundColor: Colors.blue,
                fontColor: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget AddressText() {
    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        _addressAPI(); // 카카오 주소 API
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SizedBox(
              width: 330,
              child: TextField(
                decoration: InputDecoration(
                  labelText: '주소',
                  border: OutlineInputBorder(),
                  isDense: false,
                ),
                controller: _AddressController,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 287,
              ),
              TextButton(
                onPressed: () {
                  HapticFeedback.mediumImpact();
                  _addressAPI();
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: Text(
                  '주소 검색',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _addressAPI() async {
    KopoModel model = await Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => RemediKopo(),
      ),
    );
    _AddressController.text = '${model.address!} ${model.buildingName!}';
  }

  Widget _buildTextFeild(String feildName, String defaultText) {
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
}
