import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:front_backpack_app/api_provider.dart';

import 'package:front_backpack_app/database/db_account.dart';
import 'package:front_backpack_app/database/db_schema.dart';

import '../profile/profile.dart';
import 'qr_generator.dart';
import 'session.dart';

import '../database/db_account.dart';
import '../database/db_schema.dart';


// import  'category.dart';

class KioskSession extends StatefulWidget {


  AccountObject currentUSer;
  AccountObject borrower;  
  int sessionID;
KioskSession(this.currentUSer,this.borrower,this.sessionID); 

  //Session2



  @override
  State createState() => new KioskSessionState(currentUSer,borrower,sessionID);
}

class KioskSessionState extends State<KioskSession>
    with SingleTickerProviderStateMixin {

  
  AccountObject currentUSer;
  AccountObject borrower;  
  
  int sessionID;

  SessionObject session;
  
KioskSessionState(this.currentUSer,this.borrower,this.sessionID); 
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  ApiProvider apiProvider = ApiProvider();  
    Future doScan(BuildContext context) async {
    String sendSID = sessionID.toString();
    var rs = await apiProvider.doScan(sendSID);
    var jsonRes = json.decode(rs.body);
    if(rs.statusCode==200){
      if(rs.body=='false'){
        print('havent scanned');
      }
      else{
         final session = SessionObject.fromJson(jsonRes[0]);
         print(session);
               
          Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => new SessionPage(session),
                      ),
                  );
      }

    }
  }

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
                  child: Text('Use Kiosk to scan QR Code',style: TextStyle(fontSize: 20),),
                ),
                new Padding(
                  padding: EdgeInsets.all(20),
                  child: QrGenerator('5931333321'),
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
                            image: AssetImage('assets/profile/profile.jpg'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(80.0),
                        ),
                      ),
                      title: Text(
                        'Session With Patsornchai W.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Row(
                        children: <Widget>[
                          Icon(Icons.phone),
                          Text(
                            "  0812345678",
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
                    doScan(context);
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
