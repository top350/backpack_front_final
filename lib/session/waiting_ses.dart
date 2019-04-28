import 'package:flutter/material.dart';

import '../database/db_account.dart';
import 'kiosk_session.dart';

class Waiting extends StatelessWidget {
  AccountObject currentUser; //Receive from Home
  Waiting(this.currentUser);

  AccountObject otherPerson = user2; //Receive from Backend if in session
  int sessionID = 0; //Receive from Backend if in session
  String notInSession = ''; //Receive from Backend if not in session

  @override
  Widget build(BuildContext context) {
    String accountstuID = currentUser.studentID; //Send to Backend
    return Scaffold(
      appBar: AppBar(
        title: Text('Waiting Session'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            //Send/Receive when this is press
            //if in session pusj to KioskSession , if not stay at samepage
            print(currentUser.firstName);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      KioskSession(currentUser, sessionID, otherPerson)),
            );
          },
          child: Icon(
            Icons.refresh,
            size: 250,
            color: Colors.pink[200],
          ),
        ),
      ),
    );
  }
}
