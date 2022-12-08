import 'dart:io';
//주의 ★★★★★ file이라는 type에서 바로 import를 넣어주면 dart.html이 import선언 되는데 그러면 에러 걸림.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// image_picker: ^0.8.6 <<yaml에 넣으면 됨.

class MultiImageUploader extends StatefulWidget {
  const MultiImageUploader({Key? key}) : super(key: key);

  @override
  State<MultiImageUploader> createState() => _MultiImageUploaderState();
}

class _MultiImageUploaderState extends State<MultiImageUploader> {
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
      body: Container(
        child: _builderImageUploader(),
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
