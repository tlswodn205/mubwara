import 'package:flutter/material.dart';
import 'package:mubwara/views/common/components/custom_text_form_field.dart';
import 'package:mubwara/views/common/const/color.dart';

// 검색창 입력내용 controller
TextEditingController searchTextEditingController = TextEditingController();

// X 아이콘 클릭시 검색어 삭제
emptyTheTextFormField() {
  searchTextEditingController.clear();
}

AppBar searchBar() {
  return AppBar(
    automaticallyImplyLeading: true,
    backgroundColor: INPUT_BG_COLOR,
    title: TextFormField(
      controller: searchTextEditingController,
      decoration: InputDecoration(
          hintText: '검색어를 입력해주세요.',
          hintStyle: TextStyle(
            color: Body_TEXT_COLOR,
          ),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: INPUT_BORDER_COLOR,
          )),
          filled: true,
          prefixIcon:
              Icon(Icons.search_rounded, color: Body_TEXT_COLOR2, size: 30),
          suffixIcon: IconButton(
              icon: Icon(
                Icons.clear,
                color: Body_TEXT_COLOR,
              ),
              onPressed: emptyTheTextFormField)),
      style: TextStyle(
        fontSize: 18,
        color: Body_TEXT_COLOR2,
      ),
      // onFieldSubmitted: controlSearching,
    ),
  );
}
