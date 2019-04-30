import 'package:flutter/material.dart';
import 'package:front_backpack_app/profile/imagePickerProfile.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../database/db_request.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class ImagePickerBorrow extends StatefulWidget {
  RequestObject example;

  ImagePickerBorrow(this.example);

  @override
  State<StatefulWidget> createState() {
    return new ImagePickerBorrowState(example);
  }
}

  File imageFile;
  String fileName;


class ImagePickerBorrowState extends State<ImagePickerBorrow> {
  RequestObject example;


  ImagePickerBorrowState(this.example);

  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.width;
    //display image selected from gallery
    imageSelectorGallery() async {
      imageFile = await ImagePicker.pickImage(
        source: ImageSource.gallery,
        // maxHeight: 50.0,
        // maxWidth: 50.0,
      );
      fileName = basename(imageFile.path);
      print("You selected gallery imageeeeee : " + imageFile.path);
      setState(() {
        example.newExamplePic = imageFile;
      });
    }

    //display image selected from camera
    imageSelectorCamera() async {
      imageFile = await ImagePicker.pickImage(
        source: ImageSource.camera,
        // maxHeight: 50.0,
        // maxWidth: 50.0,
      );
      setState(() {
        example.newExamplePic = imageFile;
      });
    }

    return new Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        displaySelectedFile(example.newExamplePic),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: screenSize / 3,
              child: new RaisedButton(
                color: Colors.pink[200],
                textColor: Colors.white,
                child: new Text(
                  'Select from Gallery',
                  textAlign: TextAlign.center,
                ),
                onPressed: imageSelectorGallery,
              ),
            ),
            Container(
              width: screenSize / 3,
              child: new RaisedButton(
                color: Colors.pink[200],
                textColor: Colors.white,
                child: new Text(
                  'Select from Camera',
                  textAlign: TextAlign.center,
                ),
                onPressed: imageSelectorCamera,
              ),
            ),
          ],
        )

        // displaySelectedFile(cameraFile)
      ],
    );
  }

  Widget displaySelectedFile(File file) {
    return new Container(
      margin: EdgeInsets.all(10),
      // child: new Card(child: new Text('' + galleryFile.toString())),
      // child: new Image.file(galleryFile),
      child: file == null
          ? new Column(
              children: <Widget>[
                Icon(
                  Icons.camera_alt,
                  color: Colors.grey,
                ),
                Text('Select an Example Image')
              ],
            )
          : uploadArea()
    );
  }
}
