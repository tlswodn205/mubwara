import 'package:flutter/material.dart';
import 'package:mubwara/views/common/components/custom_text_form_field.dart';
import 'package:mubwara/views/common/const/color.dart';
import 'package:mubwara/views/layout/default_layout.dart';
import 'package:mubwara/views/page/shop_my_page/checkbox/checkbox.dart';

class ShopMyPage extends StatefulWidget {
  const ShopMyPage({Key? key}) : super(key: key);

  @override
  State<ShopMyPage> createState() => _ShopMyPageState();
}

class _ShopMyPageState extends State<ShopMyPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          top: true,
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16.0),
                CustomTextFormField(
                  hintText: '사장님의 이름을 입력해주세요.',
                ),
                const SizedBox(height: 16.0),
                CustomTextFormField(
                  hintText: '가게의 상호명을 입력해주세요.',
                  obscureText: false,
                ),
                const SizedBox(height: 16.0),
                CustomTextFormField(
                  hintText: '가게의 전화번호를 입력해주세요.',
                  obscureText: false,
                ),
                const SizedBox(height: 16.0),
                CustomTextFormField(
                  hintText: '가게의 주소를 입력해주세요.',
                  obscureText: false,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        hintText: '오픈시간',
                        obscureText: false,
                      ),
                    ),
                    Expanded(
                      child: CustomTextFormField(
                        hintText: '마감시간',
                        obscureText: false,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16.0),
                _buildButton(
                    buttonName: "편의시설 수정하기",
                    buttonBackgroundColor: Colors.blue,
                    pageName: CheckBoxListTileDemo()),
                const SizedBox(height: 16.0),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TextButton(
                    onPressed: () async {},
                    style: TextButton.styleFrom(
                      backgroundColor: PRIMARY_COLOR,
                      primary: Body_TEXT_COLOR1,
                    ),
                    child: Text(
                      '정보 저장하기',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildButton(
      {required String buttonName,
        required Color buttonBackgroundColor,
        required Widget pageName}) {
    return Container(
      width: double.infinity,
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: buttonBackgroundColor,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => pageName,
            ),
          );
        },
        child: Text(
          "${buttonName}",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
