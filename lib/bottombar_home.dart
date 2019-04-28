// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'dashboard.dart';
import 'borrow/borrow.dart';
import 'session/waiting_session.dart';
import './session/session.dart';
import './profile/profile.dart';

import 'database/db_account.dart';

class ButtomBarHome extends StatefulWidget {
  AccountObject currentUser =  user1; //Receive from Backend
  
  State<StatefulWidget> createState() => ButtomBarHomeState(currentUser);
}

class ButtomBarHomeState extends State<ButtomBarHome> {
  AccountObject currentUser;
  ButtomBarHomeState(this.currentUser);

  int currentindex = 0;
  // final List<Widget> _children = [
  //   Dashboard(currentUser),
  //   BorrowPage(currentUser),
  //   WaitingSession(currentUser),
  //   ProfilePage(currentUser),
  // ];
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

  void onTabTapped(int index) {
    setState(() {
      currentindex = index;
    });
  }
}
