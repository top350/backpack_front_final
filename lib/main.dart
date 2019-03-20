import 'package:flutter/material.dart';
import 'home.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //  title:'Home page',
      //  home: Home(),
      home: new LoginPage(),
      routes: <String,WidgetBuilder>{
        "/Home" : (BuildContext context)=>new Home()
      }
      
    );
  }
}
class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage>
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
      backgroundColor: Colors.greenAccent,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/gb.jpg"),
            fit: BoxFit.cover,
            color: Colors.black26,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image(
                image: new AssetImage("assets/backpack.png"),
                height: _iconAnimation.value * 170,
                width: _iconAnimation.value * 170,
              ),
              new Form(
                child: new Theme(
                  data: new ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: Colors.teal,
                      inputDecorationTheme: new InputDecorationTheme(
                          labelStyle: new TextStyle(
                              color: Colors.teal, fontSize: 20.0))),
                  child: new Container(
                    padding: const EdgeInsets.all(40.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: "Enter your name",
                          ),
                          keyboardType: TextInputType.text,
                        ),
                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: "Enter Password",
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        new Padding(
                          padding:
                              const EdgeInsets.only(bottom: 20.0, top: 20.0),
                        ),
                        new MaterialButton(
                          height: 40.0,
                          minWidth: 300.0,
                          color: Colors.teal[400],
                          textColor: Colors.white,
                          child: new Text("Log in"),
                          onPressed: ()  {
                            Navigator.of(context).pushNamed("/Home");
                          },
                          splashColor: Colors.blueAccent,
                        ),
                        new MaterialButton(
                          height: 40.0,
                          minWidth: 300.0,
                          color: Colors.teal[400],
                          textColor: Colors.white,
                          child: new Text("Sign up"),
                          onPressed: () => {},
                          splashColor: Colors.blueAccent,
                          
                        ),
                        
                       
                        
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

