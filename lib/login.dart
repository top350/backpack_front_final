import 'package:flutter/material.dart';

import 'signUp/intro.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api_provider.dart';
import 'database/db_schema.dart';
import 'bottombar_home.dart';
import 'database/db_account.dart';

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
  var count;
  List<String> result = new List(5);

  Future<Null> doLogin() async {
    if (_formkey.currentState.validate()) {
      try {
        var rs = await apiProvider.doLogin(_username.text, _password.text);
        if (rs.statusCode == 200) {
          print(rs.body);
          var jsonRes = json.decode(rs.body);
          if (rs.body == 'false') {
            print('error');
          } else {
            print(jsonRes);
            final student = AccountObject.fromJson(jsonRes[0]);
            print(student.aid);
            print('Log in');
            //Navigator.of(context).pushReplacementNamed("/Home");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ButtomBarHome(student),
              ),
            );
          }
        } else {
          print('server error');
          count = 1;
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
                              onPressed: () async {
                                // Navigator.of(context)
                                //     .pushReplacementNamed("/Home");
                                await doLogin();
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Intro(),
                                  ),
                                );
                                //Navigator.of(context).pushNamed("/signup");
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

class Student {
  final String studentid;
  final String firstname;
  final String lastname;
  final String phoneno;
  final String email;

  Student({
    this.studentid,
    this.firstname,
    this.lastname,
    this.phoneno,
    this.email,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      studentid: json['username'],
      firstname: json['fullname'],
      lastname: json['lastname'],
      phoneno: json['phoneno'],
      email: json['email'],
    );
  }
}
