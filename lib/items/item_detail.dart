import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'dart:io';

import 'item_object.dart';

class ItemDetail extends StatelessWidget {
//this class will tell detail of a item when click on the item c
  ItemObject item;

  ItemDetail(this.item);

  _showWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Are you sure you have the following item?'),
            actions: <Widget>[
              FlatButton(
                child: Text('NO'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text('YES'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamedAndRemoveUntil('/Home', (Route<dynamic> route) => false);
                  // Navigator.popUntil(context, ModalRoute.withName('/Home'));
                  // Navigator.of(context).pushReplacementNamed("/Home");
                  // other alternative Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
                },
              )
            ],
          );
        });
  }

  Icon _detailIcon(IconData icon) {
    return Icon(
      icon,
      size: 25,
      color: Colors.pink[700],
    );
  }

   Widget _imageInBox(String imageurl, File file) {
    return file == null
        ? Image.asset(item.imageurl)
        : new Container(
          width: 500,
          height: 500,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(file),
                fit: BoxFit.fill,
              ),
            ),
            // child: Image.file(file),
          );
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
                      _imageInBox(item.imageurl, item.examplepic),
                      Padding(
                        padding: EdgeInsets.all(5),
                      ),
                      Text(item.itemName,
                          style: TextStyle(fontSize: 30, color: Colors.pink,fontWeight: FontWeight.w600)),
                      Padding(
                        padding: EdgeInsets.all(8),
                      ),
                      Row(
                        // mainAxisSize: MainAxisSize.max,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _detailIcon(Icons.account_circle),
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
                          _detailIcon(Icons.access_time),
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
                          _detailIcon(Icons.access_time),
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
                          _detailIcon(Icons.location_on),
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
                          Container(
                              width: 30,
                              height: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      "assets/token_1.png",
                                    ),
                                    fit: BoxFit.fill),
                              )),
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
                          _detailIcon(Icons.chat),
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
