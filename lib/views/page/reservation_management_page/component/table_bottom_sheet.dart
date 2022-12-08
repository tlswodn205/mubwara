import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mubwara/views/page/reservation_management_page/component/reservation_text_field.dart';

class TableBottomSheet extends StatefulWidget {
  const TableBottomSheet({Key? key}) : super(key: key);

  @override
  State<TableBottomSheet> createState() => _TableBottomSheetState();
}

class _TableBottomSheetState extends State<TableBottomSheet> {
  final ImagePicker imgpicker = ImagePicker();
  List<XFile>? imagefiles;

  openImages() async {
    try {
      var pickedfiles = await imgpicker.pickMultiImage();
      //you can use ImageCourse.camera for Camera capture
      if (pickedfiles != null) {
        imagefiles = pickedfiles;
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
              _tableInfo(),
              SizedBox(
                width: 30.0,
                height: 30,
              ),
              _SaveButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _tableInfo extends StatelessWidget {
  const _tableInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: ReservationTextField(
              label: '인원 수',
            )),
        SizedBox(
          width: 16.0,
        ),
        Expanded(
            child: ReservationTextField(
              label: '갯수',
            )),
      ],
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            child: Text('저장'),
          ),
        ),
      ],
    );
  }
}
