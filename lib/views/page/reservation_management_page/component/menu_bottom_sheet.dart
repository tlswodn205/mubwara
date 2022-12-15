import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mubwara/controller/menu_controller.dart';
import 'package:mubwara/dto/request/menu_req_dto.dart';
import 'package:mubwara/views/common/components/toastzip.dart';
import 'package:mubwara/views/page/reservation_management_page/component/reservation_text_field.dart';

class ReservationBottomSheet extends ConsumerStatefulWidget {
  const ReservationBottomSheet({Key? key}) : super(key: key);

  @override
  ConsumerState<ReservationBottomSheet> createState() =>
      _ReservationBottomSheetState();
}

class _ReservationBottomSheetState
    extends ConsumerState<ReservationBottomSheet> {
  final ImagePicker imgpicker = ImagePicker();
  XFile? imagefile;
  MenuReqDto menuReqDto = MenuReqDto.origin();

  openImages() async {
    try {
      var pickedfile = await imgpicker.pickImage(source: ImageSource.gallery);
      //you can use ImageCourse.camera for Camera capture
      if (pickedfile != null) {
        imagefile = pickedfile;
        setState(() {});
        Uint8List data = await imagefile!.readAsBytes();
        List<String> menuImage = [base64Encode(data)];
        menuReqDto.imageFile = menuImage;
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }

  @override
  Widget build(BuildContext context) {
    final cc = ref.read(menuController);

    //viewInset : 시스템 상 가려진 화면
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return Container(
      height: MediaQuery.of(context).size.height / 2 + bottomInset,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomInset),
        child: Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: ReservationTextField(
                    onChanged: (value) {
                      menuReqDto.name = value;
                    },
                    label: '메뉴 이름',
                  )),
                  SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                      child: ReservationTextField(
                    onChanged: (value) {
                      menuReqDto.price = value;
                    },
                    label: '메뉴 가격',
                  )),
                ],
              ),
              Expanded(child: _builderImageUploader()),
              SizedBox(
                width: 16.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        print(menuReqDto.id);
                        cc.saveMenu(menuReqDto);
                        Navigator.pop(context);
                        showSaveToast();
                      },
                      child: Text('저장'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _builderImageUploader() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          //open button ----------------

          Text("선택한 이미지:"),
          Divider(),
          imagefile != null
              ? Container(
                  child: Card(
                      child: Container(
                    height: 70,
                    width: 100,
                    child: Image.file(
                      File(imagefile!.path),
                    ),
                  )),
                )
              : Container(),
          Divider(),
          ElevatedButton(
              onPressed: () {
                openImages();
              },
              child: Text("메뉴 이미지 추가")),
        ],
      ),
    );
  }
}
