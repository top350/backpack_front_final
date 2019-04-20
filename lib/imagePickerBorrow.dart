import 'package:flutter/material.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImagePickerBorrow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ImagePickerBorrowState();
  }
}

class ImagePickerBorrowState extends State<ImagePickerBorrow> {
  File imageFile;

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
      print("You selected gallery image : " + imageFile.path);
      setState(() {});
    }

    //display image selected from camera
    imageSelectorCamera() async {
      imageFile = await ImagePicker.pickImage(
        source: ImageSource.camera,
        // maxHeight: 50.0,
        // maxWidth: 50.0,
      );
      print("You selected camera image : " + imageFile.path);
      setState(() {});
    }

    return new Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        displaySelectedFile(imageFile),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: screenSize/3,
              child: new RaisedButton(
                color: Colors.pink[200],
                textColor: Colors.white,
                child: new Text('Select from Gallery',textAlign: TextAlign.center,),
                onPressed: imageSelectorGallery,
              ),
            ),
            Container(
              width: screenSize/3,
              child: new RaisedButton(
                color: Colors.pink[200],
                textColor: Colors.white,
                child: new Text('Select from Camera',textAlign: TextAlign.center,),
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
          : new SizedBox(
              height: 300.0,
              width: 300.0,
              child: Image.file(file),
            ),
    );
  }
}

