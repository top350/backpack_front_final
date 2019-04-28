import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'rating.dart';
import '../database/db_account.dart';
import '../database/db_session.dart';

class SessionPage extends StatefulWidget {
  //Session3

  
  AccountObject currentUser; //Receive from Session2
  SessionObject ongoingSession; //Receive from Session2 
  AccountObject otherPerson; //Receive from Session2
  String endSession = 'end'; //Send to BackEnd 
  
  SessionPage(this.currentUser,this.ongoingSession,this.otherPerson);
  @override
  State createState() => new SessionPageState(currentUser,ongoingSession,otherPerson);
}

class SessionPageState extends State<SessionPage>
    with SingleTickerProviderStateMixin {
    
  AccountObject currentUser; //Receive from Session2
  SessionObject ongoingSession; //Receive from Session2
  AccountObject otherPerson; //Receive from Session2
  SessionPageState(this.currentUser,this.ongoingSession,this.otherPerson);


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
     int sesID = ongoingSession.sessionNo; //Send to BackEnd 
    return new Scaffold(
        backgroundColor: Colors.pink[50],
        appBar: AppBar(
          title: Text('Session'),
        ),
        body: new ListView(
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.only(bottom: 20.0, top: 20.0),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Return Time'),
                new Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      DateFormat("h:mm a").format(ongoingSession.endTime),
                      style: TextStyle(fontSize: 50,
                          color: Colors.black, fontWeight: FontWeight.w700,),
                    )),
                new Padding(
                  padding: const EdgeInsets.only(bottom: 20.0, top: 20.0),
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
                        'Session With '+otherPerson.firstName,
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
                  child: new Text("END"),
                  onPressed: () {
                    //send/Receive from back
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => new RatingSession(currentUser,ongoingSession,otherPerson),
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
        ));
  }
}
