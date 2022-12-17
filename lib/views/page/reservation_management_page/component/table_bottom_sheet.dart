import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mubwara/controller/table_controller.dart';
import 'package:mubwara/dto/request/table_type_req_dto.dart';
import 'package:mubwara/views/common/components/number_text_from_field.dart';
import 'package:mubwara/views/common/components/toastzip.dart';
import 'package:mubwara/views/page/reservation_management_page/component/reservation_text_field.dart';

class TableBottomSheet extends ConsumerStatefulWidget {
  const TableBottomSheet({Key? key}) : super(key: key);

  @override
  ConsumerState<TableBottomSheet> createState() => _TableBottomSheetState();
}

class _TableBottomSheetState extends ConsumerState<TableBottomSheet> {
  final ImagePicker imgpicker = ImagePicker();
  List<XFile>? imagefiles;
  TableReqDto tableReqDto = TableReqDto.origin();

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
    final cc = ref.read(tableController);

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
                      child: NumberCustomTextFormField(
                    onChanged: (value) {
                      tableReqDto.maxPeople = value;
                      print(value);
                    },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '인원수를 입력해주세요';
                          }
                          return null;
                        },
                        hintText: '인원 수',
                  )),
                  SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: NumberCustomTextFormField(
                      onChanged: (value) {
                        tableReqDto.qty = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '테이블 갯수를 입력해주세요';
                        }
                        return null;
                      },
                      hintText: '테이블 갯수',
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 30.0,
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        cc.tableupdate(tableReqDto);
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
}
