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
  State createState() => LoginPageState();
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
  List<String> result = List(5);

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
            Navigator.pushReplacement(
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
    _iconAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _iconAnimation = CurvedAnimation(
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
    return Scaffold(
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
                  Image(
                    image: AssetImage("assets/logo only.png"),
                    height: _iconAnimation.value * 170,
                    width: _iconAnimation.value * 170,
                  ),
                  Form(
                    key: _formkey,
                    child: Theme(
                      data: ThemeData(
                          brightness: Brightness.light,
                          primarySwatch: Colors.pink[150],
                          inputDecorationTheme: InputDecorationTheme(
                              labelStyle: TextStyle(
                                  color: Colors.pink[200], fontSize: 20.0))),
                      child: Container(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            TextFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter username';
                                }
                              },
                              controller: _username,
                              decoration: InputDecoration(
                                labelText: "Enter your Student ID",
                              ),
                              keyboardType: TextInputType.text,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter password';
                                }
                              },
                              controller: _password,
                              decoration: InputDecoration(
                                labelText: "Enter Password",
                              ),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 20.0, top: 20.0),
                            ),
                            MaterialButton(
                              height: 40.0,
                              minWidth: 300.0,
                              color: Colors.pink[400],
                              textColor: Colors.white,
                              child: Text("Log in"),
                              onPressed: () {
                                doLogin();
                              },
                              splashColor: Colors.pink[200],
                            ),
                            MaterialButton(
                              height: 40.0,
                              minWidth: 300.0,
                              color: Colors.pink[400],
                              textColor: Colors.white,
                              child: Text("Sign up"),
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

//}
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
