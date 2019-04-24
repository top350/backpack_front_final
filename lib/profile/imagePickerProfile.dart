import 'package:flutter/material.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'profile_object.dart';

class ImagePickerProfile extends StatefulWidget {
  Profile example;

  ImagePickerProfile(this.example);
  @override
  State<StatefulWidget> createState() {
    return new ImagePickerProfileState(example);
  }
}

class ImagePickerProfileState extends State<ImagePickerProfile> {
  // File profilepic;
  Profile example;

  File imageFile;

  ImagePickerProfileState(this.example);

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
      setState(() {
        example.profilepic = imageFile;
      });
    }

    //display image selected from camera
    imageSelectorCamera() async {
      imageFile = await ImagePicker.pickImage(
        source: ImageSource.camera,
        // maxHeight: 50.0,
        // maxWidth: 50.0,
      );
      print("You selected camera image : " + imageFile.path);
      setState(() {
        example.profilepic = imageFile;
      });
    }

    return new Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        displaySelectedFile(example.profilepic),
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
          ? _buildProfileImage()
          : new Center(
              child: Container(
                width: 140.0,
                height: 140.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(file),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(80.0),
                  border: Border.all(
                    color: Colors.white,
                    width: 10.0,
                  ),
                ),
                // child: Image.file(file),
              ),
            ),
    );
  }
}

Widget _buildProfileImage() {
  return Center(
    child: Container(
      width: 140.0,
      height: 140.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/profile/profile.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(80.0),
        border: Border.all(
          color: Colors.white,
          width: 10.0,
        ),
      ),
    ),
  );
}
