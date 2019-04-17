import 'package:flutter/material.dart';

import 'rating.dart';
import './profile/profile.dart';
// import  'category.dart';

class SessionPage extends StatefulWidget {
  @override
  State createState() => new SessionPageState();
}

class SessionPageState extends State<SessionPage>
    with SingleTickerProviderStateMixin {
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
                new Image(
                  image: new AssetImage("assets/QR_code.png"),
                  height: _iconAnimation.value * 300,
                  width: _iconAnimation.value * 300,
                ),
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
                        width: 60.0,
                        height: 60.0,
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
                      trailing: IconButton(
                        icon: Icon(Icons.keyboard_arrow_right),
                        iconSize: 40.0,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => new ProfilePage(),
                            ),
                          );
                        },
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => new RatingSession(),
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
