import 'package:flutter/material.dart';
import 'rating.dart';
// import  'category.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new SessionPage(), routes: <String, WidgetBuilder>{});
  }
}

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
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.all(40.0),
                child: new Column(
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
                    new MaterialButton(
                      height: 40.0,
                      minWidth: 300.0,
                      color: Colors.pink[300],
                      textColor: Colors.white,
                      child: new Text("Next"),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => new Test()));
                      },
                      splashColor: Colors.pink[200],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
