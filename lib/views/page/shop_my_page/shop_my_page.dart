import 'package:flutter/material.dart';
import 'package:mubwara/views/common/components/custom_text_form_field.dart';
import 'package:mubwara/views/common/const/color.dart';
import 'package:mubwara/views/layout/default_layout.dart';

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
                CustomTextFormField(
                  hintText: '가게 오픈시간을 입력해주세요.',
                  obscureText: false,
                ),
                const SizedBox(height: 16.0),

                CustomTextFormField(
                  hintText: '가게 마감시간을 입력해주세요.',
                  obscureText: false,
                ),
                const SizedBox(height: 16.0),
                TextButton(
                  onPressed: () async {},
                  style: TextButton.styleFrom(
                    backgroundColor: PRIMARY_COLOR,
                    primary: Body_TEXT_COLOR1,
                  ),
                  child: Text(
                    '정보 저장하기',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

