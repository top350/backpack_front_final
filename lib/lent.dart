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
  // final formats = {
  //   InputType.both: DateFormat("EEEE, MMMM d, yyyy 'at' h:mma"),
  //   InputType.date: DateFormat('yyyy-MM-dd'),
  //   InputType.time: DateFormat("HH:mm"),
  // };


  List _category = ["Electronic", "Clothing", "Stationary", "Other"];
  String titleValue = ''; //user input
  int tokenValue; // user input

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _selectedCategory;

  DateTime _date = new DateTime.now();
  TimeOfDay _time = new TimeOfDay.now();

  InputType inputType = InputType.both;
  bool editable = true;
  DateTime date;

  

  @override
  void initState() {
    _dropDownMenuItems = buildAndGetDropDownMenuItems(_category);
    _selectedCategory = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> buildAndGetDropDownMenuItems(List category) {
    List<DropdownMenuItem<String>> items = new List();
    for (String fruit in category) {
      items.add(new DropdownMenuItem(value: fruit, child: new Text(fruit)));
    }
    return items;
  }

  void changedDropDownItem(String selectedFruit) {
    setState(() {
      _selectedCategory = selectedFruit;
    });
  }

  Future<Null> _pickupDate(BuildContext context) async {
    //pick up date
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2022),
    );
    if (picked != null && picked != _date) {
      print('Date Selected : ${_date.toString()}');
      setState(() {
        _date = picked;
      });
    }
  }

  Future<Null> _pickupTime(BuildContext context) async {
    //pick up time
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: _time);
    if (picked != null && picked != _time) {
      print('Time selected: ${_time.toString()}');
      setState(() {
        _time = picked;
      });
    }
  }

  Future<Null> _returnDate(BuildContext context) async {
    //return date
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2022),
    );
    if (picked != null && picked != _date) {
      print('Date Selected : ${_date.toString()}');
      setState(() {
        _date = picked;
      });
    }
  }

  Future<Null> _returnTime(BuildContext context) async {
    //return time
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: _time);
    if (picked != null && picked != _time) {
      print('Time selected: ${_time.toString()}');
      setState(() {
        _time = picked;
      });
    }
  }

  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(15.0),
        child: ListView(children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Item Name'),
            onChanged: (String value) {
              setState(() {
                titleValue = value;
              });
            },
          ),
          Text("Choose Category"),
          Center(
            child: DropdownButton(
              value: _selectedCategory,
              items: _dropDownMenuItems,
              onChanged: changedDropDownItem,
            ),
          ),
          Container(
            //pick up
            padding: EdgeInsets.all(10.0), //inside
            margin: EdgeInsets.all(5.0), // outside
            decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0)),
            child: Column(
              children: <Widget>[
                new Text(
                  'Pick-Up Time',
                  textAlign: TextAlign.left,
                  style: new TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                new Text(
                  'Date Selected : ${_date.toString()}',
                  textAlign: TextAlign.left,
                ),
                new RaisedButton(
                  child: Text('Select Date'),
                  onPressed: () {
                    _pickupDate(context);
                  },
                ),
                new Text(
                  'Time selected: ${_time.toString()}',
                  textAlign: TextAlign.left,
                ),
                new RaisedButton(
                    child: new Text('Select Time'),
                    onPressed: () {
                      _pickupTime(context);
                    }),
              ],
            ),
          ),
          Container(
            // Return
            padding: EdgeInsets.all(10.0), //inside
            margin: EdgeInsets.all(5.0), // outside
            decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0)),
            child: Column(
              children: <Widget>[
                new Text(
                  'Return Time',
                  textAlign: TextAlign.left,
                  style: new TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                new Text(
                  'Date Selected : ${_date.toString()}',
                  textAlign: TextAlign.left,
                ),
                new RaisedButton(
                  child: Text('Select Date'),
                  onPressed: () {
                    _returnDate(context);
                  },
                ),
                new Text(
                  'Time selected: ${_time.toString()}',
                  textAlign: TextAlign.left,
                ),
                new RaisedButton(
                    child: new Text('Select Time'),
                    onPressed: () {
                      _returnTime(context);
                    }),
              ],
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Tokens Offer'),
            onChanged: (String value) {
              setState(() {
                tokenValue = int.parse(value);
              });
            },
          ),
          DateTimePickerFormField(
            inputType: inputType,
            format: DateFormat("EEEE, MMMM d, yyyy 'at' h:mma"),
            editable: editable,
            decoration: InputDecoration(
                labelText: 'Date/Time', hasFloatingPlaceholder: false),
            onChanged: (dt) => setState(() => date = dt),
          ),
          RaisedButton(
            child: Text('Submit'),
            onPressed: () {},
          ),
        ]));
  }
}
