import 'package:flutter/material.dart';

import 'dart:io';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'imagePickerBorrow.dart';
import '../database/db_request.dart';
import '../database/db_account.dart';

class BorrowPage extends StatefulWidget {
  //Page Where user can input data to create new request
  String sendItemName = '';
  String sendItemType = '';
  DateTime sendPickUpTime;
  DateTime sendReturnTime;
  String sendKioskLocation = ''; 
  int sendTokenUsed = 0;
  String sendNote = '';
  int reqByAcc = 0;
  @override
  State<StatefulWidget> createState() {
    return _BorrowPageState();
  }
}

class _BorrowPageState extends State<BorrowPage> {
  
  RequestObject newRequest = RequestObject(
      1,
      'itemName',
      'itemCategory',
      sampleTime,
      sampleTime,
      'KioskLocation',
      0,
      'Note',
      'assets/logo.png',
      false,
      user1.accountNo,
      sampleTime,
      sampleTime,
      emptyFile);


  List<DropdownMenuItem<String>> _dropDownMenuCategory;
  List _category = [
    // Dropdown Category
    "Stationery",
    "Clothing",
    "Sport Equipment",
    "Electronics",
    "Books",
    "Others"
  ];

  List<DropdownMenuItem<String>> _dropDownMenuKiosk;
  List _kiosk = [
    // Dropdown Kiosk
    "Engineering",
    "Arts",
    "Science",
    "Siam",
  ];

  void _addItem() {
    if (newRequest.itemCategory == "Stationery") {
      requestList.add(newRequest);
    } else if (newRequest.itemCategory == "Clothing") {
      requestList.add(newRequest);
    } else if (newRequest.itemCategory == "Sport Equipment") {
      requestList.add(newRequest);
    } else if (newRequest.itemCategory == "Electronics") {
      requestList.add(newRequest);
    } else if (newRequest.itemCategory == "Books") {
      requestList.add(newRequest);
    } else {
      requestList.add(newRequest);
    }
  }

  @override
  void initState() {
    _dropDownMenuCategory = buildAndGetDropDownMenuList(_category);
    newRequest.itemCategory = _dropDownMenuCategory[0].value;
    _dropDownMenuKiosk = buildAndGetDropDownMenuList(_kiosk);
    newRequest.kioskLocation = _dropDownMenuKiosk[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> buildAndGetDropDownMenuList(
      List categorylist) {
    List<DropdownMenuItem<String>> items = new List();
    for (String item in categorylist) {
      items.add(new DropdownMenuItem(value: item, child: new Text(item)));
    }
    return items;
  }

  void changedDropDownCategory(String selectedItem) {
    setState(() {
      newRequest.itemCategory = selectedItem;
      //_selectedCategory = selectedItem;
    });
  }

  void changedDropDownKiosk(String selectedItem) {
    setState(() {
      newRequest.kioskLocation = selectedItem;
      //_selectedKiosk = selectedItem;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Borrow Request"),
      ),
      body: Container(
          // decoration: BoxDecoration(color: Colors.grey),
          margin: EdgeInsets.all(15.0),
          child: ListView(children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  labelText: 'Item Name',
                  labelStyle: TextStyle(fontSize: 20, color: Colors.pink)),
              onChanged: (String inputName) {
                setState(() {
                  newRequest.itemName = inputName;
                  //itemName = inputName;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text("Choose Category",
                    style: TextStyle(fontSize: 18, color: Colors.pink)),
                DropdownButton(
                  value: newRequest.itemCategory,
                  items: _dropDownMenuCategory,
                  onChanged: changedDropDownCategory,
                ),
              ],
            ),
            Container(
              //Pick-up time
              margin: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Pick-up Time",
                      style: TextStyle(fontSize: 18, color: Colors.pink)),
                  DateTimePickerFormField(
                    inputType: InputType.both,
                    format: DateFormat("d EEEE MMMM 'at' h:mma"),
                    decoration: InputDecoration(
                        labelText: 'Date/Time', hasFloatingPlaceholder: false),
                    onChanged: (dt) {
                      setState(() {
                        newRequest.pickUpTime = dt;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              //return time
              margin: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Return Time",
                      style: TextStyle(fontSize: 18, color: Colors.pink)),
                  DateTimePickerFormField(
                    inputType: InputType.both,
                    format: DateFormat("d EEEE MMMM 'at' h:mma"),
                    decoration: InputDecoration(
                        labelText: 'Date/Time', hasFloatingPlaceholder: false),
                    onChanged: (dt) {
                      setState(() {
                        newRequest.returnTime = dt;
                      });
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text("Choose Kiosk",
                    style: TextStyle(fontSize: 18, color: Colors.pink)),
                DropdownButton(
                  value: newRequest.kioskLocation,
                  items: _dropDownMenuKiosk,
                  onChanged: changedDropDownKiosk,
                ),
              ],
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Tokens Offer',
                  labelStyle: TextStyle(fontSize: 15, color: Colors.pink)),
              onChanged: (String value) {
                setState(() {
                  newRequest.tokenUsed = int.parse(value);
                  //token = int.parse(value);
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Note',
                  labelStyle: TextStyle(fontSize: 15, color: Colors.pink)),
              onChanged: (String value) {
                setState(() {
                  newRequest.note = value;
                  //note = value;
                });
              },
            ),
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              child: ImagePickerBorrow(newRequest),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              child: MaterialButton(
                height: 40.0,
                // minWidth: 300.0,
                color: Colors.pink[400],
                textColor: Colors.white,
                child: new Text("Request Item"),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed("/Home");
                  _addItem();
                },
                splashColor: Colors.pink[200],
              ),
            ),
          ])),
    );
  }
}

// class ImagePickerBorrow extends StatefulWidget {
//   ItemObject example;

//   ImagePickerBorrow(this.example);

//   @override
//   State<StatefulWidget> createState() {
//     return new ImagePickerBorrowState(example);
//   }
// }

// class ImagePickerBorrowState extends State<ImagePickerBorrow> {
//   ItemObject example;

//   File imageFile;

//   ImagePickerBorrowState(this.example);

//   @override
//   Widget build(BuildContext context) {
//     double screenSize = MediaQuery.of(context).size.width;
//     //display image selected from gallery
//     imageSelectorGallery() async {
//       imageFile = await ImagePicker.pickImage(
//         source: ImageSource.gallery,
//         // maxHeight: 50.0,
//         // maxWidth: 50.0,
//       );
//       print("You selected gallery imageeeeee : " + imageFile.path);
//       setState(() {
//         example.examplepic = imageFile;
//       });
//     }

//     //display image selected from camera
//     imageSelectorCamera() async {
//       imageFile = await ImagePicker.pickImage(
//         source: ImageSource.camera,
//         // maxHeight: 50.0,
//         // maxWidth: 50.0,
//       );
//       setState(() {
//        example.examplepic = imageFile;
//       });
//     }

//     return new Column(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: <Widget>[
//         displaySelectedFile(example.examplepic),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             Container(
//               width: screenSize / 3,
//               child: new RaisedButton(
//                 color: Colors.pink[200],
//                 textColor: Colors.white,
//                 child: new Text(
//                   'Select from Gallery',
//                   textAlign: TextAlign.center,
//                 ),
//                 onPressed: imageSelectorGallery,
//               ),
//             ),
//             Container(
//               width: screenSize / 3,
//               child: new RaisedButton(
//                 color: Colors.pink[200],
//                 textColor: Colors.white,
//                 child: new Text(
//                   'Select from Camera',
//                   textAlign: TextAlign.center,
//                 ),
//                 onPressed: imageSelectorCamera,
//               ),
//             ),
//           ],
//         )

//         // displaySelectedFile(cameraFile)
//       ],
//     );
//   }

//   Widget displaySelectedFile(File file) {
//     return new Container(
//       margin: EdgeInsets.all(10),
//       // child: new Card(child: new Text('' + galleryFile.toString())),
//       // child: new Image.file(galleryFile),
//       child: file == null
//           ? new Column(
//               children: <Widget>[
//                 Icon(
//                   Icons.camera_alt,
//                   color: Colors.grey,
//                 ),
//                 Text('Select an Example Image')
//               ],
//             )
//           : new SizedBox(
//               height: 300.0,
//               width: 300.0,
//               child: Image.file(file),
//             ),
//     );
//   }
// }

// Date Format
//   InputType.both: DateFormat("EEEE, MMMM d, yyyy 'at' h:mma"),
//   InputType.date: DateFormat('yyyy-MM-dd'),
//   InputType.time: DateFormat("HH:mm"),

//DateTime now = DateTime.now();
//String formattedDate = DateFormat("d EEEE MMMM 'at' h:mma").format(now);
