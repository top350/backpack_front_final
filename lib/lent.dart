import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

//Pun tum eiei

class LentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LentPageState();
  }
}

class _LentPageState extends State<LentPage> {
  List _category = [
    // Dropdown
    "Stationery",
    "Clothing",
    "Sport Equipment",
    "Electronics",
    "Books",
    "Others"
  ];
  String _selectedCategory;
  List<DropdownMenuItem<String>> _dropDownMenuCategory;
  List _kiosk = [
    // Dropdown
    "Engineering",
    "Arts",
    "Science",
    "Siam",
  ];
  String _selectedKiosk;
  List<DropdownMenuItem<String>> _dropDownMenuKiosk;

  String titleValue = ''; //user input
  int tokenValue;

  InputType inputType = InputType.both; // Date and Time
  bool editable = true;
  DateTime date;

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
              onChanged: (String value) {
                setState(() {
                  titleValue = value;
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
                    inputType: inputType,
                    format: DateFormat("d EEEE MMMM 'at' h:mma"),
                    editable: editable,
                    decoration: InputDecoration(
                        labelText: 'Date/Time', hasFloatingPlaceholder: false),
                    onChanged: (dt) => setState(() => date = dt),
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
                    inputType: inputType,
                    format: DateFormat("d EEEE MMMM 'at' h:mma"),
                    editable: editable,
                    decoration: InputDecoration(
                        labelText: 'Date/Time', hasFloatingPlaceholder: false),
                    onChanged: (dt) => setState(() => date = dt),
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
                  tokenValue = int.parse(value);
                });
              },
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
                  Navigator.of(context).pushNamed("/Home");
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
