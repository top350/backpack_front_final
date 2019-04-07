import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  @override
  _State createState() => new _State();
}

//State is information of the application that can change over time or when some actions are taken.
class _State extends State<Category> {
  bool _value1 = false;
  bool _value2 = false;
  bool _value3 = false;
  bool _value4 = false;
  bool _value5 = false;
  bool _value6 = false;


  //we omitted the brackets '{}' and are using fat arrow '=>' instead, this is dart syntax
  void _value1Changed(bool value) => setState(() => _value1 = value);
  void _value2Changed(bool value) => setState(() => _value2 = value);
  void _value3Changed(bool value) => setState(() => _value3 = value);
  void _value4Changed(bool value) => setState(() => _value4 = value);
  void _value5Changed(bool value) => setState(() => _value5 = value);
  void _value6Changed(bool value) => setState(() => _value6 = value);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Category you can offer'),
        backgroundColor: Colors.pink[200],
      ),
      //hit Ctrl+space in intellij to know what are the options you can use in flutter widgets

      body: new ListView(
        shrinkWrap: true,
        padding: new EdgeInsets.all(32.0),
        children: <Widget>[
          // new Checkbox(value: _value1, onChanged: _value1Changed),
          new CheckboxListTile(
            value: _value1,
            onChanged: _value1Changed,
            title: new Text('Stationery'),
            controlAffinity: ListTileControlAffinity.leading,
            subtitle: new Text('Pen, Pencil, Eraser,etc.'),
            secondary: new Icon(Icons.archive),
            activeColor: Colors.red,
          ),
          new CheckboxListTile(
            value: _value2,
            onChanged: _value2Changed,
            title: new Text('Clothing'),
            controlAffinity: ListTileControlAffinity.leading,
            subtitle: new Text('Student Uniform, Belt, etc.'),
            secondary: new Icon(Icons.archive),
            activeColor: Colors.red,
          ),
          new CheckboxListTile(
            value: _value3,
            onChanged: _value3Changed,
            title: new Text('Sport Equip'),
            controlAffinity: ListTileControlAffinity.leading,
            subtitle: new Text('Balls, Racquet, Bats, etc.'),
            secondary: new Icon(Icons.archive),
            activeColor: Colors.red,
          ),
          new CheckboxListTile(
            value: _value4,
            onChanged: _value4Changed,
            title: new Text('Electronics'),
            controlAffinity: ListTileControlAffinity.leading,
            subtitle: new Text('Laptop, Tablet, etc.'),
            secondary: new Icon(Icons.archive),
            activeColor: Colors.red,
          ),
          new CheckboxListTile(
            value: _value5,
            onChanged: _value5Changed,
            title: new Text('Book'),
            controlAffinity: ListTileControlAffinity.leading,
            subtitle: new Text('Textbook, Novels, etc.'),
            secondary: new Icon(Icons.archive),
            activeColor: Colors.red,
          ),
          new CheckboxListTile(
            value: _value6,
            onChanged: _value6Changed,
            title: new Text('Others'),
            controlAffinity: ListTileControlAffinity.leading,
            subtitle: new Text('Tools, Lab Equipment, etc.'),
            secondary: new Icon(Icons.archive),
            activeColor: Colors.red,
          ),
          new MaterialButton(
            height: 40.0,
            minWidth: 300.0,
            color: Colors.pink[400],
            textColor: Colors.white,
            child: new Text("Finish"),
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/signup'));
              Navigator.of(context).pushReplacementNamed("/login");
            },
            splashColor: Colors.pink[200],
          ),
        ],
      ),
    );
  }
}
