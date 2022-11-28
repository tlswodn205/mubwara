import 'package:flutter/material.dart';
import 'package:mubwara/views/common/const/color.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool autofocus;
  const CustomTextFormField({this.hintText, this.errorText,
    this.autofocus = false, this.obscureText = false,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final baseBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: INPUT_BORDER_COLOR,
        width: 1.0
      )
    );
    return TextFormField(
      cursorColor: PRIMARY_COLOR,
      // 비밀번호 입력할때만 사용 obscureText\
      obscureText: obscureText,
      autofocus: autofocus,
      decoration: InputDecoration( // 입력폼 데코레이션
        contentPadding: EdgeInsets.all(20),
        hintText: hintText,
        errorText: errorText,
        hintStyle: TextStyle(
          color: Body_TEXT_COLOR,
          fontSize: 14.0,
        ),
        fillColor: INPUT_BG_COLOR,
        // false = 배경색 없음, true : 있음
        filled: true,
        // baseBorder = 모든 Input 상태의 기본 스타일 세팅
        border: baseBorder,
        enabledBorder: baseBorder, // 선택되지 않는 폼을 색 옅게 하기
        focusedBorder: baseBorder.copyWith( // copyWith 대상의 모든 속성을 복사하고 이어받음
          borderSide: baseBorder.borderSide.copyWith( //baseborder의 borderline 색을 바꾼다.
            color: PRIMARY_COLOR,
          ),
        ),
      ),
    );
  }
}
