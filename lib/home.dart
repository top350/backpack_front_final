// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'display.dart';
import 'homepage.dart';

import 'borrow.dart';
import 'category.dart';

class Home extends StatefulWidget {
  // const Home({Key key, this.user}) : super(key: key);
  // final FirebaseUser user;

  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  int currentindex = 0;
  final List<Widget> _children = [
    Dashboard(),
    BorrowPage(),
    DisplayWidget(Colors.green),
    DisplayProfile()
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: AppBar(
      //    title: Text('${widget.user.email}'),
      //  ),
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
              title: Text('session'),
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
