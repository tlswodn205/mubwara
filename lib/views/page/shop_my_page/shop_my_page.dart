import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mubwara/controller/shop_controller.dart';
import 'package:mubwara/dto/request/shop_req_dto.dart';
import 'package:mubwara/views/common/components/custom_text_form_field.dart';
import 'package:mubwara/views/common/components/number_text_from_field.dart';
import 'package:mubwara/views/common/const/color.dart';
import 'package:mubwara/views/layout/default_layout.dart';
import 'package:remedi_kopo/remedi_kopo.dart';

class ShopMyPage extends ConsumerStatefulWidget {
  ShopMyPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ShopMyPage> createState() => _ShopMyPageState();
}

class _ShopMyPageState extends ConsumerState<ShopMyPage> {
  final ImagePicker imgpicker = ImagePicker();
  XFile? imagefile;
  TextEditingController _AddressController = TextEditingController();
  JoinShopReqDto joinShopReqDto = JoinShopReqDto.origin();

  openImages() async {
    try {
      var pickedfile = await imgpicker.pickImage(source: ImageSource.gallery);
      //you can use ImageCourse.camera for Camera capture
      if (pickedfile != null) {
        imagefile = pickedfile;
        setState(() {});
        Uint8List data = await imagefile!.readAsBytes();
        List<String> shopImage = [base64Encode(data)];
        joinShopReqDto.imageFile = shopImage;
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
      title: '신규등록',
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
                _builderImageUploader(),
                const SizedBox(height: 16.0),
                CustomTextFormField(
                  onChanged: (value) {
                    joinShopReqDto.shop_name = value;
                  },
                  hintText: '가게의 상호명을 입력해주세요.',
                  obscureText: false,
                ),
                const SizedBox(height: 16.0),
                NumberCustomTextFormField(
                  onChanged: (value) {
                    joinShopReqDto.phoneNumber = value;
                  },
                  hintText: '가게의 전화번호를 입력해주세요.',
                  obscureText: false,
                ),
                const SizedBox(height: 16.0),
                AddressText(),
                const SizedBox(height: 16.0),
                DropdownButtonFormField<String?>(
                  decoration: InputDecoration(
                    labelText: '성별',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelStyle: TextStyle(
                      fontSize: 15,
                      color: Color(0xffcfcfcf),
                    ),
                  ),
                  // underline: Container(height: 1.4, color: Color(0xffc0c0c0)),
                  onChanged: (String? newValue) {
                    joinShopReqDto.category = newValue;
                    print(newValue);
                  },
                  items: [null, '한식', '중식', '양식', '일식']
                      .map<DropdownMenuItem<String?>>((String? i) {
                    return DropdownMenuItem<String?>(
                      value: i,
                      child: Text({
                            '한식': '한식',
                            '중식': '중식',
                            '양식': '양식',
                            '일식': '일식'
                          }[i] ??
                          '미선택'),
                    );
                  }).toList(),
                ),
                Row(
                  children: [
                    Expanded(
                      child: NumberCustomTextFormField(
                        onChanged: (value) {
                          joinShopReqDto.opentime = value;
                        },
                        hintText: '오픈시간',
                        obscureText: false,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Expanded(
                      child: NumberCustomTextFormField(
                        onChanged: (value) {
                          joinShopReqDto.closetime = value;
                        },
                        hintText: '닫는 시간',
                        obscureText: false,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: NumberCustomTextFormField(
                        onChanged: (value) {
                          joinShopReqDto.perhour = value;
                        },
                        hintText: '예약 받을 간격',
                        obscureText: false,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Expanded(
                      child: NumberCustomTextFormField(
                        onChanged: (value) {
                          joinShopReqDto.perprice = value;
                        },
                        hintText: '예약금',
                        obscureText: false,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                CustomTextFormField(
                  onChanged: (value) {
                    joinShopReqDto.information = value;
                  },
                  hintText: '가게소개를 입력해주세요.',
                  obscureText: false,
                ),
                _submitButton(),
                // 가게 신청한 이후부터 신청가능하게 만들기
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
              onChanged: (value) {
                joinShopReqDto.address = value;
                print(value);
              },
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
    ValueChanged<String>? onChanged,
    String? hintText,
    String? errorText,
  }) {
    final baseBorder = OutlineInputBorder(
        borderSide: BorderSide(color: INPUT_BORDER_COLOR, width: 1.0));

    return TextFormField(
      onChanged: onChanged,
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
        enabledBorder: baseBorder,
        // 선택되지 않는 폼을 색 옅게 하기
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

  Widget _submitButton() {
    final cc = ref.read(shopController);
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextButton(
        onPressed: () async {
          _showDialog(sc: cc);
        },
        style: TextButton.styleFrom(
          backgroundColor: PRIMARY_COLOR,
          primary: Body_TEXT_COLOR1,
        ),
        child: Text(
          '가게 신청하기',
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
                  ),
                )
              : Container(),
          Divider(),

          SizedBox(
            height: 50,
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

  void _showDialog({required ShopController sc}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("확인창"),
          content: SingleChildScrollView(child: Text("가게 신청을 하시겠습니까?")),
          actions: [
            ElevatedButton(
              child: Text("닫기"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              child: Text("신청하기"),
              onPressed: () {
                joinShopReqDto.address = _AddressController.text;
                sc.joinShop(joinShopReqDto);
              },
            ),
          ],
        );
      },
    );
  }
}
