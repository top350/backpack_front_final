import 'package:flutter/material.dart';

import 'login.dart';

class DisplayProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _DisplayProfile(), 
      routes: <String, WidgetBuilder>{
      EditProfile.routeName: (BuildContext context) =>
          new EditProfile(),
      "/SuccessPage": (BuildContext context) => new SuccessPage(),
      "/ReviewPage": (BuildContext context) => new ReviewPage(),
      //"/login": (BuildContext context) => new LoginPage(),
    });
  }
}

class _DisplayProfile extends StatefulWidget {
  State<StatefulWidget> createState() => ProfilePage();
}

class ProfilePage extends State<_DisplayProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          ClipPath(
            child: Container(color: Colors.black.withOpacity(0.8)),
            clipper: getClipper(),
          ),
          Positioned(
              width: 350.0,
              top: MediaQuery.of(context).size.height / 5,
              child: Column(
                children: <Widget>[
                  Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                            image: ExactAssetImage('assets/jf.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(75.0)),
                        boxShadow: [
                          BoxShadow(blurRadius: 7.0, color: Colors.black)
                        ]),
                  ),

                  SizedBox(height: 50.0),
                  Text(
                    'Jack Frost',
                    style: TextStyle(fontSize: 30.0),
                  ),
                  //SizedBox(height: 18.0),
                  Text(
                    'Phone',
                    style: TextStyle(fontSize: 17.0),
                  ),
                  //SizedBox(height: 18.0),
                  Text(
                    'Email',
                    style: TextStyle(fontSize: 17.0),
                  ),

                  SizedBox(height: 20.0),
                  Container(
                      height: 30.0,
                      width: 95.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent,
                        color: Colors.green,
                        elevation: 7.0,
                        child: GestureDetector(
                            onTap: onButtonTap,
                            child: Center(
                              child: Text('Edit Profile',
                                  style: TextStyle(color: Colors.white)),
                            )),
                      )),
                  SizedBox(height: 20.0),
                  Container(
                    height: 30.0,
                    width: 95.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.redAccent,
                      color: Colors.red,
                      elevation: 7.0,
                      child: GestureDetector(
                          onTap: () {
                            //  Navigator.of(context).pushReplacementNamed("/login");
                          },
                          child: Center(
                            child: Text('Log out',
                                style: TextStyle(color: Colors.white)),
                          )),
                    ),
                  ),
                  Container(
                    child: new Center(
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new IconButton(
                            icon: new Icon(Icons.check, color: Colors.black),
                            iconSize: 70.0,
                            onPressed: () {
                              Navigator.of(context).pushNamed("/SuccessPage");
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: new Center(
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new IconButton(
                            icon: new Icon(Icons.rate_review,
                                color: Colors.deepOrange),
                            iconSize: 70.0,
                            onPressed: () {
                              Navigator.of(context).pushNamed("/ReviewPage");
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }

  void onButtonTap() {
    Navigator.pushNamed(context, EditProfile.routeName);
  }
}

class EditProfile extends StatefulWidget {
  EditProfile({Key key, this.title}) : super(key: key);

  static const String routeName = "/EditProfile";

  final String title;

  @override
  _EditProfileState createState() => new _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Edit Profile"),
      ),
      // body: new Container(),
      // floatingActionButton: new FloatingActionButton(
      //   onPressed: _onFloatingActionButtonPressed,
      //   tooltip: 'Add',
      //   child: new Icon(Icons.add),
      // ),
    );
  }

  // void _onFloatingActionButtonPressed() {
  // }
}

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Success"),
        backgroundColor: Colors.green,
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SuccessImageAsset(),
              // new IconButton(
              //   icon: new Icon(Icons.favorite, color:Colors.pinkAccent),
              //   iconSize: 70.0,
              //   onPressed: null,
              // ),
              new Text(
                'Complete!',
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Rate"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new IconButton(
                icon: new Icon(Icons.stars, color: Colors.lightBlueAccent),
                iconSize: 70.0,
                onPressed: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SuccessImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('assets/189677.png');
    Image image = Image(
      image: assetImage,
      width: 250.0,
      height: 250.0,
    );
    return Container(
      child: image,
    );
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
