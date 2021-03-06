import 'package:flutter/material.dart';

import '../profile/profile.dart';
import 'qr_generator.dart';
import 'session.dart';

import '../database/db_account.dart';
import '../database/db_session.dart';
// import  'category.dart';

class KioskSession extends StatefulWidget {
  //Session2
  AccountObject currentUser; //Receive from Session1
  int sessionID; //Receive from Session1
  AccountObject otherPerson; //Receive from Session1
  KioskSession(this.currentUser, this.sessionID, this.otherPerson);

  @override
  State createState() =>
      new KioskSessionState(currentUser, sessionID, otherPerson);
}

class KioskSessionState extends State<KioskSession>
    with SingleTickerProviderStateMixin {
  
  String verifyResult = ''; //Receive from Back
  SessionObject ongoingSession = sesOne; //Receive from Back

  AccountObject currentUser; //Receive from Session1
  int sessionID; //Receive from Session1 and Send to Back
  AccountObject otherPerson; //Receive from Session1

  KioskSessionState(this.currentUser, this.sessionID, this.otherPerson);

  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.easeOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: Text('Kiosk Session'),
      ),
      body: new ListView(
        children: <Widget>[
          // new Padding(
          //   padding: const EdgeInsets.only(bottom: 20.0, top: 20.0),
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Use Kiosk to scan QR Code',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              new Padding(
                padding: EdgeInsets.all(20),
                child: QrGenerator("currentUser.qrCode"),
              ),
              new Padding(
                padding: const EdgeInsets.only(bottom: 10.0, top: 20.0),
              ),
              Card(
                elevation: 5.0,
                margin:
                    new EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                child: Container(
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                    leading: Container(
                      width: 75.0,
                      height: 75.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(otherPerson.profilePic),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(80.0),
                      ),
                    ),
                    title: Text(
                      'Session With ' + otherPerson.firstName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Row(
                      children: <Widget>[
                        Icon(Icons.phone),
                        Text(
                          otherPerson.telNo,
                          style: TextStyle(color: Colors.black87),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              new Padding(
                padding: EdgeInsets.all(15),
              ),
              new MaterialButton(
                height: 40.0,
                minWidth: 300.0,
                color: Colors.pink[300],
                textColor: Colors.white,
                child: new Text("Scanned"),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => new SessionPage(currentUser,sesOne,otherPerson),
                    ),
                  );
                },
                splashColor: Colors.pink[200],
              ),
              new Padding(
                padding: EdgeInsets.all(15),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
