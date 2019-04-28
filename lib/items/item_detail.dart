import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'dart:io';

import '../database/db_request.dart';
import '../database/db_account.dart';

class ItemDetail extends StatelessWidget {
//this class will tell detail of a item when click on the item card

  int lenderAccountId = 0; //Send to Backend when press Lent
  int requestNo = 0; //Send to Backend when press Lent
  int sessionID = 0; //Recieve to Backend when press Lent

  AccountObject user; //Reviece from itemCard
  RequestObject itemRequest; //Reviece from itemCard
  AccountObject borrower; //Reviece from itemCard
  ItemDetail(this.user, this.itemRequest, this.borrower);

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
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/Home', (Route<dynamic> route) => false);
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

  Widget _imageInBox(File file) {
    return file == null
        ? Image.asset(itemRequest.examplePicUrl)
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
                  _imageInBox(itemRequest.newExamplePic),
                  Padding(
                    padding: EdgeInsets.all(5),
                  ),
                  Text(itemRequest.itemName,
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.pink,
                          fontWeight: FontWeight.w600)),
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
                      Text(
                          'Posted by: ' +
                              borrower.firstName, //need to show name
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
                                  .format(itemRequest.pickUpTime),
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
                                  .format(itemRequest.returnTime),
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
                      Text('Location : ' + itemRequest.kioskLocation,
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
                      Text(
                          'Offer ' +
                              itemRequest.tokenUsed.toString() +
                              ' Token',
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
                      Text('Note : ' + itemRequest.note,
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
                        // Send/Receive to Backend here
                        lenderAccountId = user.accountNo;
                        requestNo = itemRequest.requestNo;
                        print(lenderAccountId.toString() +
                            "  " +
                            requestNo.toString());
                        _showWarningDialog(context);
                      },
                      splashColor: Colors.pink[200],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
