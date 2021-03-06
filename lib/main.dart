import 'package:flutter/material.dart';

import 'splash_page.dart';
import 'bottombar_home.dart';
import 'signUp/signup.dart';
import 'login.dart';
import 'signUp/category.dart';
import './session/session.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new SplashScreen(),
      //home: Waiting(),
      theme: new ThemeData(primarySwatch: Colors.pink),
      routes: <String, WidgetBuilder>{
        "/Home": (BuildContext context) => new  ButtomBarHome(),
        "/login": (BuildContext context) => new LoginPage(),
        "/signup": (BuildContext context) => new SignupPage(),
        //"/session": (BuildContext context) => new SessionPage(),
        "/splash": (BuildContext context) => new SplashScreen(),
        "/category": (BuildContext context) => new Category(),
        //"/item_list": (BuildContext context) => new ItemList(),
        //"/item_detail": (BuildContext context) => new ItemDetail(),
      },
      onUnknownRoute: (RouteSettings setting) {
        // when user try to navigate to unexist route
        return MaterialPageRoute(
          builder: (BuildContext context) => SplashScreen(),
        );
      },
    );
  }
}
