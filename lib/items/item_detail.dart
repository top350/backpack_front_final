import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'item_object.dart';

class ItemDetail extends StatelessWidget {
//this class will tell detail of a item when click on the item class
  ItemObject item;

  ItemDetail(this.item);

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
                      Image.asset(item.imageurl),
                      Padding(
                        padding: EdgeInsets.all(5),
                      ),
                      Text(item.itemName,
                          style: TextStyle(fontSize: 30, color: Colors.pink)),
                      Padding(
                        padding: EdgeInsets.all(8),
                      ),
                      Row(
                        // mainAxisSize: MainAxisSize.max,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.account_circle, size: 20),
                          Padding(
                            padding: EdgeInsets.all(8),
                          ),
                          Text('Posted by: ' + item.who,
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
                          Icon(Icons.access_time, size: 20),
                          Padding(
                            padding: EdgeInsets.all(8),
                          ),
                          Text(
                              'Pickup : ' +
                                  DateFormat("d EEEE MMMM 'at' h:mma")
                                      .format(item.pickupTime),
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
                          Icon(Icons.access_time, size: 20),
                          Padding(
                            padding: EdgeInsets.all(8),
                          ),
                          Text(
                              'Return : ' +
                                  DateFormat("d EEEE MMMM 'at' h:mma")
                                      .format(item.returnTime),
                              style: TextStyle(fontSize: 15)),                         
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                      ),
                      Row(
                        // mainAxisSize: MainAxisSize.max,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.location_on, size: 20),
                          Padding(
                            padding: EdgeInsets.all(10),
                          ),
                          Text('Location : ' + item.location,
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
                          Icon(Icons.attach_money, size: 20),
                          Padding(
                            padding: EdgeInsets.all(10),
                          ),
                          Text('Offer ' + item.token.toString() + ' Token',
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
                          Icon(Icons.speaker_notes, size: 20),
                          Padding(
                            padding: EdgeInsets.all(10),
                          ),
                          Text('Note : ' + item.note,
                              style: TextStyle(fontSize: 15))
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
