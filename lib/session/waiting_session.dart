import 'package:flutter/material.dart';

import 'kiosk_session.dart';
import '../database/db_account.dart';

class WaitingSession extends StatelessWidget { 
  AccountObject currentUser;
  WaitingSession(this.currentUser);

  //Session1
  @override
  Widget build(BuildContext context) {
    double screenSizeHeight = MediaQuery.of(context).size.height;
    double screenSizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Waiting Session'),
        actions: <Widget>[
          //For Testing Only
          IconButton(
            icon: Icon(
              Icons.navigate_next,
            ),
            onPressed: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(builder: (context) => new KioskSession()),
              // );
            },
          )
        ],
      ),
      body: Center(
        child: Icon(
          Icons.refresh,
          size: screenSizeWidth / 1.5,
          color: Colors.pink[200],
        ),
      ),
    );
  }
}
