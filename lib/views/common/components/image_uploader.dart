import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageUploader extends StatefulWidget {
  @override
  State<ImageUploader> createState() => _ImageUploaderState();
}

class _ImageUploaderState extends State<ImageUploader> {
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
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
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
          ElevatedButton(
              onPressed: () {
                openImages();
              },
              child: Text("Open Images")),
          Divider(),
          Text("Picked Files:"),
          Divider(),
        ],
      ),
    );
  }
}
