import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:front_backpack_app/api_provider.dart';
import 'category.dart';

class SignupPage extends StatefulWidget {
  @override
  State createState() => new SignupPageState();
}

class SignupPageState extends State<SignupPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController studentID = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNo = TextEditingController();
  TextEditingController password1 = TextEditingController();
  TextEditingController password2 = TextEditingController();
  // final _formkey = GlobalKey<FormState>();
  ApiProvider apiProvider = ApiProvider();
  Future doSignup() async {
    final rs = await apiProvider.doSignup(studentID.text, firstname.text,
        lastname.text, password1.text, phoneNo.text, email.text);
    print(rs.body);
    if (rs.statusCode == 200) {
      print(rs.body);
      //var jsonRes = json.decode(rs.body);
      if (rs.body == 'signed up') {
        Navigator.of(context).pushReplacementNamed("/login");
      } else {
        print('Server error');
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
            ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
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
                Form(
                  child: new Theme(
                    data: new ThemeData(
                        brightness: Brightness.light,
                        primarySwatch: Colors.pink,
                        inputDecorationTheme: new InputDecorationTheme(
                            labelStyle: new TextStyle(
                                color: Colors.black45, fontSize: 20.0))),
                    child: new Container(
                      padding: const EdgeInsets.all(40.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new TextFormField(
                            controller: firstname,
                            decoration: new InputDecoration(
                              labelText: "Enter your Firstname",
                            ),
                            keyboardType: TextInputType.text,
                          ),
                          new TextFormField(
                            controller: lastname,
                            decoration: new InputDecoration(
                              labelText: "Enter your Lastname",
                            ),
                            keyboardType: TextInputType.text,
                          ),
                          new TextFormField(
                            controller: studentID,
                            decoration: new InputDecoration(
                              labelText: "Enter your Student ID",
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          new TextFormField(
                            controller: email,
                            decoration: new InputDecoration(
                              labelText: "Enter Email",
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          new TextFormField(
                            controller: phoneNo,
                            decoration: new InputDecoration(
                              labelText: "Enter Phone no.",
                            ),
                            keyboardType: TextInputType.text,
                          ),
                          new TextFormField(
                            controller: password1,
                            decoration: new InputDecoration(
                              labelText: "Enter Password",
                            ),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),
                          new TextFormField(
                            controller: password2,
                            decoration: new InputDecoration(
                              labelText: "Confirm Password",
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
                            color: Colors.pink[300],
                            textColor: Colors.white,
                            child: new Text("Next"),
                            onPressed: () {
                              doSignup();
                              print('pressed');
                              if (password1.text == password2.text) {
                                // print(password1.text);
                                // print(email.text);
                              } else {
                                print("Passsword not match");
                              }
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
    ));
  }
}
