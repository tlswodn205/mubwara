import 'dart:io';
//주의 ★★★★★ file이라는 type에서 바로 import를 넣어주면 dart.html이 import선언 되는데 그러면 에러 걸림.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// image_picker: ^0.8.6 <<yaml에 넣으면 됨.

class SingleImageUploader extends StatefulWidget {
  const SingleImageUploader({Key? key}) : super(key: key);

  @override
  State<SingleImageUploader> createState() => _SingleImageUploaderState();
}

class _SingleImageUploaderState extends State<SingleImageUploader> {
  final ImagePicker imgpicker = ImagePicker();
  XFile? imagefile;

  shootImages() async {
    try {
      var pickedfile = await imgpicker.pickImage(source: ImageSource.camera);
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
    return Scaffold(
      body: Container(
        child: _builderImageUploader(),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      shootImages();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      primary: Colors.blue,
                    ),
                    child: Icon(
                      CupertinoIcons.camera,
                      color: Colors.white,
                    )),
              ),
              SizedBox(width: 100),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      openImages();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      primary: Colors.blue,
                    ),
                    child: Icon(
                      CupertinoIcons.photo,
                      color: Colors.white,
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
