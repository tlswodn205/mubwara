import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mubwara/views/common/components/custom_text_form_field.dart';
import 'package:mubwara/views/common/const/color.dart';
import 'package:mubwara/views/layout/default_layout.dart';
import 'package:mubwara/views/page/shop_my_page/checkbox/checkbox.dart';
import 'package:remedi_kopo/remedi_kopo.dart';

class ShopMyPage extends StatefulWidget {
  const ShopMyPage({Key? key}) : super(key: key);

  @override
  State<ShopMyPage> createState() => _ShopMyPageState();
}

class _ShopMyPageState extends State<ShopMyPage> {
  final ImagePicker imgpicker = ImagePicker();
  XFile? imagefile;
  TextEditingController _AddressController = TextEditingController();

  openImages() async {
    try {
      var pickedfile = await imgpicker.pickImage(source: ImageSource.gallery);
      //you can use ImageCourse.camera for Camera capture
      if (pickedfile != null) {
        imagefile = pickedfile;
        setState(() {});
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }

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
                AddressText(),
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

                _builderImageUploader(),
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
            child: AddressTextFormField(
              hintText: '가게의 주소를 입력해주세요.',
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 280,
              ),
              SizedBox(
                height: 50,
                width: 80,
                child: TextButton(
                  onPressed: () {
                    HapticFeedback.mediumImpact();
                    _addressAPI();
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: PRIMARY_COLOR,
                    primary: Body_TEXT_COLOR1,
                  ),
                  child: Text(
                    '주소 검색',
                  ),
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

  @override
  Widget AddressTextFormField({
    String? hintText,
    String? errorText,
  }) {
    final baseBorder = OutlineInputBorder(
        borderSide: BorderSide(color: INPUT_BORDER_COLOR, width: 1.0));

    return TextFormField(
      cursorColor: PRIMARY_COLOR,
      controller: _AddressController,
      // 비밀번호 입력할때만 사용 obscureText\
      decoration: InputDecoration(
        // 입력폼 데코레이션
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
        focusedBorder: baseBorder.copyWith(
          // copyWith 대상의 모든 속성을 복사하고 이어받음
          borderSide: baseBorder.borderSide.copyWith(
            //baseborder의 borderline 색을 바꾼다.
            color: PRIMARY_COLOR,
          ),
        ),
      ),
    );
  }

  Widget _builderImageUploader() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          //open button ----------------
          Text("선택한 이미지:"),
          Divider(),
          imagefile != null
              ? Container(
                  child: Card(
                  child: Container(
                    width: double.infinity,
                    child: Image.file(
                      File(imagefile!.path),
                    ),
                  ),
                ))
              : Container(),
          Divider(),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  openImages();
                },
                style: TextButton.styleFrom(
                  backgroundColor: PRIMARY_COLOR,
                  primary: Body_TEXT_COLOR1,
                ),
                child: Text("가게 이미지 선택")),
          ),
        ],
      ),
    );
  }
}
