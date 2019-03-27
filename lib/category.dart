import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    home: new Category(),
  ));
}

class Category extends StatefulWidget {
  @override
  _State createState() => new _State();
}

//State is information of the application that can change over time or when some actions are taken.
class _State extends State<Category>{

  bool _value1 = false;
  bool _value2 = false;
  bool _value3 = false;
  bool _value4 = false;
  bool _value5= false;
  bool _value6= false;
  bool _value7= false;
  bool _value8= false;

  //we omitted the brackets '{}' and are using fat arrow '=>' instead, this is dart syntax
  void _value1Changed(bool value) => setState(() => _value1 = value);
  void _value2Changed(bool value) => setState(() => _value2 = value);
  void _value3Changed(bool value) => setState(() => _value3 = value);
  void _value4Changed(bool value) => setState(() => _value4 = value);
  void _value5Changed(bool value) => setState(() => _value5 = value);
   void _value6Changed(bool value) => setState(() => _value6 = value);
  void _value7Changed(bool value) => setState(() => _value7 = value);
  void _value8Changed(bool value) => setState(() => _value8 = value);
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
                  title: new Text('Stationaries'),
                  controlAffinity: ListTileControlAffinity.leading,
                  subtitle: new Text('pen,pencil,eraser,notebook,etc.'),
                  secondary: new Icon(Icons.archive),
                  activeColor: Colors.red,
              ),
               new CheckboxListTile(
                  value: _value2,
                  onChanged: _value2Changed,
                  title: new Text('Clothes'),
                  controlAffinity: ListTileControlAffinity.leading,
                  subtitle: new Text('Student uniform,belt,etc.'),
                  secondary: new Icon(Icons.archive),
                  activeColor: Colors.red,
              ),
              new CheckboxListTile(
                  value: _value3,
                  onChanged: _value3Changed,
                  title: new Text('Sport Wares'),
                  controlAffinity: ListTileControlAffinity.leading,
                  subtitle: new Text('sport clothes,pants'),
                  secondary: new Icon(Icons.archive),
                  activeColor: Colors.red,
              ),
              new CheckboxListTile(
                  value: _value4,
                  onChanged: _value4Changed,
                  title: new Text('Sport Equipment'),
                  controlAffinity: ListTileControlAffinity.leading,
                  subtitle: new Text('Balls,Racket,Bats,etc.'),
                  secondary: new Icon(Icons.archive),
                  activeColor: Colors.red,
              ),
              new CheckboxListTile(
                  value: _value5,
                  onChanged: _value5Changed,
                  title: new Text('Laptop'),
                  controlAffinity: ListTileControlAffinity.leading,
                  subtitle: new Text('ASUS,ACER,Macbook,etc.'),
                  secondary: new Icon(Icons.archive),
                  activeColor: Colors.red,
              ),
              new CheckboxListTile(
                  value: _value6,
                  onChanged: _value6Changed,
                  title: new Text('Camera'),
                  controlAffinity: ListTileControlAffinity.leading,
                  subtitle: new Text('Mirrorless camera,Dslr,Camera'),
                  secondary: new Icon(Icons.archive),
                  activeColor: Colors.red,
              ),
              new CheckboxListTile(
                  value: _value7,
                  onChanged: _value7Changed,
                  title: new Text('Tablets'),
                  controlAffinity: ListTileControlAffinity.leading,
                  subtitle: new Text('Apple Ipad,Samsung,galaxy,MIpad,etc.'),
                  secondary: new Icon(Icons.archive),
                  activeColor: Colors.red,
              ),
              new CheckboxListTile(
                  value: _value8,
                  onChanged: _value8Changed,
                  title: new Text('Electronic Accessories'),
                  controlAffinity: ListTileControlAffinity.leading,
                  subtitle: new Text('Charging cable,powerbank,etc.'),
                  secondary: new Icon(Icons.archive),
                  activeColor: Colors.red,
              ),
              new CheckboxListTile(
                  value: _value8,
                  onChanged: _value8Changed,
                  title: new Text('Books'),
                  controlAffinity: ListTileControlAffinity.leading,
                  subtitle: new Text('Any Books that you have'),
                  secondary: new Icon(Icons.archive),
                  activeColor: Colors.red,
              ),
              
              new CheckboxListTile(
                  value: _value8,
                  onChanged: _value8Changed,
                  title: new Text('Others'),
                  controlAffinity: ListTileControlAffinity.leading,
                  subtitle: new Text('Other Items that are not listed'),
                  secondary: new Icon(Icons.archive),
                  activeColor: Colors.red,
              ),
              
           
            
                new MaterialButton(
                          height: 40.0,
                          minWidth: 300.0,
                          color: Colors.pink[400],
                          textColor: Colors.white,
                          child: new Text("Finish"),
                          onPressed: ()  {
                          
                          },
                          splashColor: Colors.pink[200],
                        ),
              
              
            ],
          ),
        
      
    );
  }
}

