import 'package:flutter/material.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../database/db_account.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';


class ImagePickerProfile extends StatefulWidget {
  AccountObject currentUser;
  ImagePickerProfile(this.currentUser);

  @override
  State<StatefulWidget> createState() {
    return new ImagePickerProfileState(currentUser);
  }
}
  File imageFile;
  String fileName;

class ImagePickerProfileState extends State<ImagePickerProfile> {
  AccountObject currentUser;
  ImagePickerProfileState(this.currentUser);


  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.width;
    //display image selected from gallery
    imageSelectorGallery() async {
      File image = await ImagePicker.pickImage(
        source: ImageSource.gallery,
        // maxHeight: 50.0,
        // maxWidth: 50.0,
      );
      fileName = basename(image.path);
      print("You selected gallery image : " + image.path);
      setState(() {
        imageFile = image;
      });
    }

    //display image selected from camera
    imageSelectorCamera() async {
      File image = await ImagePicker.pickImage(
        source: ImageSource.camera,
        // maxHeight: 50.0,
        // maxWidth: 50.0,
      );
      fileName = basename(image.path);
      print("You selected camera image : " + image.path);
      setState(() {
        imageFile = image;
      });
    }

    return new Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        displaySelectedFile(imageFile,currentUser),
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

  Widget displaySelectedFile(File file,AccountObject currentUser) {
    return new Container(
      margin: EdgeInsets.all(10),
      // child: new Card(child: new Text('' + galleryFile.toString())),
      // child: new Image.file(galleryFile),
      child: file == null
          ? _buildProfileImage(currentUser)
          //: uploadArea()
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

Widget _buildProfileImage(AccountObject currentUser) {
  return Center(
    child: Container(
      width: 140.0,
      height: 140.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(currentUser.image),
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

Widget uploadArea() {
  return Column(
    children: <Widget>[
      Image.file(
        imageFile,
        width: double.infinity,
      ),
      // RaisedButton(
      //   child: Text('Upload'),
      //   onPressed: () {
      //     uploadImage();
      //   },
      // )
    ],
  );
}

Future<String> uploadImage(String imageUrl) async{
  StorageReference ref = FirebaseStorage.instance.ref().child(fileName);
  StorageUploadTask uploadTask =ref.putFile(imageFile);
  var downUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
  var url = downUrl.toString(); //download url
  imageUrl = url;
  print('Download URL : $url');
  return url;
}
