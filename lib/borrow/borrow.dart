import 'package:flutter/material.dart';

import 'dart:io';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'imagePickerBorrow.dart';
import '../database/db_request.dart';
import '../database/db_account.dart';

class BorrowPage extends StatefulWidget {
  AccountObject currentUser; //Recieve from home
  BorrowPage(this.currentUser);

  //Page Where user can input data to create new request

  @override
  State<StatefulWidget> createState() {
    return _BorrowPageState(currentUser);
  }
}

class _BorrowPageState extends State<BorrowPage> {
  AccountObject currentUser;
  _BorrowPageState(this.currentUser);

  String sendItemName = ''; //Send to Backend 
  String sendItemType = '';
  DateTime sendPickUpTime;
  DateTime sendReturnTime;
  String sendKioskLocation = '';
  int sendTokenUsed = 0;
  String sendNote = '';
  int reqByAcc = 0;  //Send to Backend

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
    //No need when connect with backend
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
        child: ListView(
          children: <Widget>[
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
                  //Send/Receive when press this
                  sendItemName = newRequest.itemName;
                  sendItemType = newRequest.itemCategory;
                  sendPickUpTime = newRequest.pickUpTime;
                  sendReturnTime = newRequest.returnTime;
                  sendKioskLocation = newRequest.kioskLocation;
                  sendTokenUsed = newRequest.tokenUsed;
                  sendNote = newRequest.note;
                  reqByAcc = newRequest.reqByAccountNo;
                  Navigator.of(context).pushReplacementNamed("/Home");
                  _addItem();
                },
                splashColor: Colors.pink[200],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


  String sendItemName = '';
  String sendItemType = '';
  DateTime sendPickUpTime;
  DateTime sendReturnTime;
  String sendKioskLocation = ''; 
  int sendTokenUsed = 0;
  String sendNote = '';
  int reqByAcc = 0;
