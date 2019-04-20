import 'package:flutter/material.dart';


import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'items/item_object.dart';
import 'items/itemlists_data.dart';
import 'imagePickerBorrow.dart';

class BorrowPage extends StatefulWidget {
  //Page Where user can input data to create new request
  @override
  State<StatefulWidget> createState() {
    return _BorrowPageState();
  }
}

class _BorrowPageState extends State<BorrowPage> {
  String itemName = '';
  String _selectedCategory = '';
  DateTime pickupTime;
  DateTime returnTime;
  String _selectedKiosk = '';
  int token;
  String note = '';
  String imageurl = 'assets/logo.png';
  String who = 'Patsornchai W.';

  String pickuptimeString = '';
  String returntimeString = '';


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
    if (_selectedCategory == "Stationery") {
      stationeryList.add(ItemObject(
          this.itemName,
          this._selectedCategory,
          this.pickupTime,
          this.returnTime,
          this._selectedKiosk,
          this.token,
          this.note,
          this.imageurl,
          this.who));
    } else if (_selectedCategory == "Clothing") {
      clothingList.add(ItemObject(
          this.itemName,
          this._selectedCategory,
          this.pickupTime,
          this.returnTime,
          this._selectedKiosk,
          this.token,
          this.note,
          this.imageurl,
          this.who));
    } else if (_selectedCategory == "Sport Equipment") {
      sportEquipmentList.add(ItemObject(
          this.itemName,
          this._selectedCategory,
          this.pickupTime,
          this.returnTime,
          this._selectedKiosk,
          this.token,
          this.note,
          this.imageurl,
          this.who));
    } else if (_selectedCategory == "Electronics") {
      electronicsList.add(ItemObject(
          this.itemName,
          this._selectedCategory,
          this.pickupTime,
          this.returnTime,
          this._selectedKiosk,
          this.token,
          this.note,
          this.imageurl,
          this.who));
    } else if (_selectedCategory == "Books") {
      booksList.add(ItemObject(
          this.itemName,
          this._selectedCategory,
          this.pickupTime,
          this.returnTime,
          this._selectedKiosk,
          this.token,
          this.note,
          this.imageurl,
          this.who));
    } else {
      othersList.add(ItemObject(
          this.itemName,
          this._selectedCategory,
          this.pickupTime,
          this.returnTime,
          this._selectedKiosk,
          this.token,
          this.note,
          this.imageurl,
          this.who));
    }
  }

  @override
  void initState() {
    _dropDownMenuCategory = buildAndGetDropDownMenuList(_category);
    _selectedCategory = _dropDownMenuCategory[0].value;
    _dropDownMenuKiosk = buildAndGetDropDownMenuList(_kiosk);
    _selectedKiosk = _dropDownMenuKiosk[0].value;
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
      _selectedCategory = selectedItem;
    });
  }

  void changedDropDownKiosk(String selectedItem) {
    setState(() {
      _selectedKiosk = selectedItem;
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
                  itemName = inputName;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text("Choose Category",
                    style: TextStyle(fontSize: 18, color: Colors.pink)),
                DropdownButton(
                  value: _selectedCategory,
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
                        pickupTime = dt;
                        pickuptimeString = DateFormat.yMd().add_jm().format(dt);
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
                        returnTime = dt;
                        returntimeString = DateFormat.yMd().add_jm().format(dt);
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
                  value: _selectedKiosk,
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
                  token = int.parse(value);
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Note',
                  labelStyle: TextStyle(fontSize: 15, color: Colors.pink)),
              onChanged: (String value) {
                setState(() {
                  note = value;
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
              child: ImagePickerBorrow(),
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

// Date Format
//   InputType.both: DateFormat("EEEE, MMMM d, yyyy 'at' h:mma"),
//   InputType.date: DateFormat('yyyy-MM-dd'),
//   InputType.time: DateFormat("HH:mm"),

//DateTime now = DateTime.now();
//String formattedDate = DateFormat("d EEEE MMMM 'at' h:mma").format(now);
