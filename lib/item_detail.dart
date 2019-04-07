import 'package:flutter/material.dart';

class ItemDetail extends StatelessWidget {
  _showWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('This action cannot be undone!'),
            actions: <Widget>[
              FlatButton(
                child: Text('DISCARD'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text('CONTINUE'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.popUntil(context, ModalRoute.withName('/Home'));
                  // other alternative Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
                  Navigator.of(context).pushReplacementNamed("/Home");
                  
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          'Item Detail',
        )),
        body: ListView(
          children: <Widget>[
            Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Image.asset('assets/laptop.jpg'),
                      Padding(
                        padding: EdgeInsets.all(5),
                      ),
                      Text('Laptop',
                          style: TextStyle(fontSize: 30, color: Colors.pink)),
                      Padding(
                        padding: EdgeInsets.all(10),
                      ),
                      Row(
                        // mainAxisSize: MainAxisSize.max,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.account_circle, size: 30),
                          Padding(
                            padding: EdgeInsets.all(10),
                          ),
                          Text('Posted by: Patsornchai Wiboontanasarn',
                              style: TextStyle(fontSize: 15))
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                      ),
                      Row(
                        // mainAxisSize: MainAxisSize.max,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.access_time, size: 30),
                          Padding(
                            padding: EdgeInsets.all(10),
                          ),
                          Text('Pickup : 10 AM',
                              style: TextStyle(fontSize: 15)),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 30),
                          ),
                          Icon(Icons.access_time, size: 30),
                          Padding(
                            padding: EdgeInsets.all(10),
                          ),
                          Text('Return : 10 AM',
                              style: TextStyle(fontSize: 15)),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                      ),
                      Row(
                        // mainAxisSize: MainAxisSize.max,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.location_on, size: 30),
                          Padding(
                            padding: EdgeInsets.all(10),
                          ),
                          Text('Location : Engineering',
                              style: TextStyle(fontSize: 15))
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                      ),
                      Row(
                        // mainAxisSize: MainAxisSize.max,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.attach_money, size: 30),
                          Padding(
                            padding: EdgeInsets.all(10),
                          ),
                          Text('Offer 20 Token', style: TextStyle(fontSize: 15))
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.all(10.0),
                        child: MaterialButton(
                          height: 40.0,
                          // minWidth: 300.0,
                          color: Colors.pink[400],
                          textColor: Colors.white,
                          child: new Text("Lent!!"),
                          onPressed: () {
                            _showWarningDialog(context);
                          },
                          splashColor: Colors.pink[200],
                        ),
                      ),
                    ]))
          ],
        ));
  }
}
