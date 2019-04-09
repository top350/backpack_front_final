
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:front_backpack_app/loginscreen.dart';
import 'package:front_backpack_app/widgets.dart';

void main() => runApp(MaterialApp(
    theme:
        ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: <String,WidgetBuilder>{ 
      "/loginscreen": (BuildContext context)=> LoginPage()
    }
  ));

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  AnimationController _animationController;
  Animation<double> _animation;

  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = new AnimationController(
        vsync: this,
        duration: new Duration(milliseconds: 500)
    );
    _animation = new CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );

    _animation.addListener(()=> this.setState((){}));
    _animationController.forward();

    Timer(Duration(seconds: 5), (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [const Color(0xFF915FB5), const Color(0xFFCA436B)],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
                stops: [0.0,1.0],
                tileMode: TileMode.clamp
                ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 100.0,
                        child: Logo(),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        "Share That Thing!", 
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text("Designed by Mongkol Team", 
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold)
                    )
                  ],
                )
              )
            ]
          )
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// import 'home.dart';
// import 'signup.dart';
// import 'login.dart';
// import 'category.dart';
// import 'item_list.dart';
// import 'item_detail.dart';


// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: new LoginPage(),
//       theme: new ThemeData(primarySwatch: Colors.pink),
//       routes: <String, WidgetBuilder>{
//         "/Home": (BuildContext context) => new Home(),
//         "/login": (BuildContext context) => new LoginPage(),
//         "/signup": (BuildContext context) => new SignupPage(),
//         "/item_list": (BuildContext context) => new ItemList(),
//         "/item_detail": (BuildContext context) => new ItemDetail(),
//         "/category" : (BuildContext context) => new Category(),
//       },
//       onUnknownRoute: (RouteSettings setting) {
//         // when user try to navigate to unexist route 
//         return MaterialPageRoute(
//           builder: (BuildContext context) => Home(),
//         );
//       },
//     );
//   }
// }
