// import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:front_backpack_app/api_provider.dart';
import 'package:front_backpack_app/database/db_schema.dart';
import 'dashboard.dart';
import 'borrow/borrow.dart';
import 'session/waiting_session.dart';
import './session/session.dart';
import './profile/profile.dart';

import 'database/db_account.dart';

class ButtomBarHome extends StatefulWidget {
  AccountObject currentUser;
  ButtomBarHome(this.currentUser);
  
  State<StatefulWidget> createState() => ButtomBarHomeState(currentUser);
}

class ButtomBarHomeState extends State<ButtomBarHome> {
  String requestAccount; //Send to Backend
  AccountObject currentUser ; //user1; //Receive from Backend
   ButtomBarHomeState(this.currentUser);
  int currentindex = 0;
  Widget build(BuildContext context) {
    
  final List<Widget> _children = [
    Dashboard(currentUser),
    BorrowPage(currentUser),
    WaitingSession(currentUser),
    ProfilePage(currentUser),
  ];
    return Scaffold(
      body: _children[currentindex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentindex,
          onTap: onTabTapped,
          fixedColor: Colors.pink[200],
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.create),
              title: Text('Borrow'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              title: Text('Session'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.face),
              title: Text('Profile'),
            ),
          ]),
    );
  }

  ApiProvider apiProvider = ApiProvider();
  Future<Null>doBottombar(String aid) async {
  final rs = await apiProvider.doBottombar(aid);
  print(rs.body);
  if (rs.statusCode == 200) {
    print(rs.body);
    var jsonRes = json.decode(rs.body);
    final itemdata = AccountObject.fromJson(jsonRes[0]);
    if (jsonRes['ok']) {
      
      
    } else {
      print('Server error');
      
    }
  }
}

  void onTabTapped(int index) {
    setState(() {
      //Send When pressed this
      currentindex = index;

    });
  }
}
