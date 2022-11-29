import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mubwara/dto/response/shop_resp_dto.dart';
import 'dart:io';

class ReviewWritePage extends StatefulWidget {
  const ReviewWritePage({Key? key}) : super(key: key);

  @override
  State<ReviewWritePage> createState() => _ReviewWritePageState();
}

class _ReviewWritePageState extends State<ReviewWritePage> {
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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            Text("${shopList[0].shop_name} 리뷰 작성하기",
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            _builderImageUploader(),
            SizedBox(height: 10),
            _buildTextFeild("리뷰내용", "null"),
            SizedBox(height: 30),
            _buildButton(
                buttonName: "리뷰 작성 완료",
                buttonBackgroundColor: Colors.grey,
                fontColor: Colors.white,
                widthSize: 330)
          ],
        ),
      ),
    );
  }

  Widget _buildTextFeild(String feildName, String defaultText) {
    return Center(
      child: SizedBox(
        width: 330,
        child: TextField(
          decoration: InputDecoration(
            labelText: '${feildName}',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.multiline,
          minLines: 5,
          maxLines: 10,
        ),
      ),
    );
  }

  Widget _buildButton(
      {required String buttonName,
      required Color buttonBackgroundColor,
      required Color fontColor,
      required double widthSize}) {
    return Container(
      width: widthSize,
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: buttonBackgroundColor,
        ),
        onPressed: () {},
        child: Text("${buttonName}",
            style: TextStyle(fontSize: 20, color: fontColor)),
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

          imagefiles != null
              ? Wrap(
                  children: imagefiles!.map((imageone) {
                    return Container(
                        child: Card(
                      child: Container(
                        height: 100,
                        width: 100,
                        child: Image.file(
                          File(imageone.path),
                        ),
                      ),
                    ));
                  }).toList(),
                )
              : Container(),
          Divider(),
          ElevatedButton(
              onPressed: () {
                openImages();
              },
              child: Text("Open Images")),
        ],
      ),
    );
  }
}
