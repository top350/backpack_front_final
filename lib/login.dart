import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'api_provider.dart';

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  ApiProvider apiProvider = ApiProvider();

  Future doLogin() async {
    if (_formkey.currentState.validate()) {
      try {
        var rs = await apiProvider.doLogin(_username.text, _password.text);
        if (rs.statusCode == 200) {
          print(rs.body);
          var jsonRes = json.decode(rs.body);
          if (jsonRes['ok']) {
            String token = jsonRes['token'];
            print(token);
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('token', token);
            Navigator.of(context).pushReplacementNamed("/Home");
          } else {
            print('Server error');
          }
        } else {
          print('server error');
        }
      } catch (e) {
        print(e);
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

  DecorationImage _buildBackgroungImage() {
    return DecorationImage(
        fit: BoxFit.cover,
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
        image: AssetImage('assets/pinkbg.jpg'));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: _buildBackgroungImage(),
        ),
        padding: EdgeInsets.all(10),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  new Image(
                    image: new AssetImage("assets/logo only.png"),
                    height: _iconAnimation.value * 170,
                    width: _iconAnimation.value * 170,
                  ),
                  new Form(
                    key: _formkey,
                    child: new Theme(
                      data: new ThemeData(
                          brightness: Brightness.light,
                          primarySwatch: Colors.pink[150],
                          inputDecorationTheme: new InputDecorationTheme(
                              labelStyle: new TextStyle(
                                  color: Colors.pink[200], fontSize: 20.0))),
                      child: new Container(
                        padding: const EdgeInsets.all(40.0),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new TextFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter username';
                                }
                              },
                              controller: _username,
                              decoration: new InputDecoration(
                                labelText: "Enter your Student ID",
                              ),
                              keyboardType: TextInputType.text,
                            ),
                            new TextFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter password';
                                }
                              },
                              controller: _password,
                              decoration: new InputDecoration(
                                labelText: "Enter Password",
                              ),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                            ),
                            new Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 20.0, top: 20.0),
                            ),
                            new MaterialButton(
                              height: 40.0,
                              minWidth: 300.0,
                              color: Colors.pink[400],
                              textColor: Colors.white,
                              child: new Text("Log in"),
                              onPressed: () {
                                
                                doLogin();
                              },
                              splashColor: Colors.pink[200],
                            ),
                            new MaterialButton(
                              height: 40.0,
                              minWidth: 300.0,
                              color: Colors.pink[400],
                              textColor: Colors.white,
                              child: new Text("Sign up"),
                              onPressed: () {
                                Navigator.of(context).pushNamed("/signup");
                              },
                              splashColor: Colors.pink[200],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

// Future <void> signIn() async{
//   final formState = _formkey.currentState;
//   if(formState.validate()){
//     formState.save();
//     try {
//        FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email:_username.text ,password:_password.text  );
//         Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(user:user)));
//     } catch (e) {
//       print(e.message);
//     }

}
