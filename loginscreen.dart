// // import 'dart:convert';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'home.dart';
// import 'signup.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// import 'api_provider.dart';

// void main() => runApp(MyApp());

// //void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       //  title:'Home page',
//       //  home: Home(),
//       home: new LoginPage(),
//       theme: new ThemeData(primarySwatch: Colors.pink),
//       routes: <String, WidgetBuilder>{
//         "/Home": (BuildContext context) => new Home(),
//         "/signup": (BuildContext context) => new SignupPage(),
//       }
//     );
//   }
// }

// class LoginPage extends StatefulWidget {
//   @override
//   State createState() => new LoginPageState();
// }

// class LoginPageState extends State<LoginPage>
//     with SingleTickerProviderStateMixin {
//   AnimationController _iconAnimationController;
//   Animation<double> _iconAnimation;
//   TextEditingController _username = TextEditingController();
//   TextEditingController _password = TextEditingController();

//   final _formkey = GlobalKey<FormState>();
//   ApiProvider apiProvider = ApiProvider();
//   Future doLogin() async {
//     if (_formkey.currentState.validate()) {
//       try {
//         var rs = await apiProvider.doLogin(_username.text, _password.text);
//         if (rs.statusCode == 200) {
//           print(rs.body);
//           var jsonRes = json.decode(rs.body);
//           if (jsonRes['ok']) {
//             String token = jsonRes['token'];
//             print(token);
//           } else {
//             print('Server error');
//           }
//         } else {
//           print('server error');
//         }
//       } catch (e) {
//         print(e);
//       }
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _iconAnimationController = new AnimationController(
//         vsync: this, duration: new Duration(milliseconds: 500));
//     _iconAnimation = new CurvedAnimation(
//         parent: _iconAnimationController, curve: Curves.easeOut);
//     _iconAnimation.addListener(() => this.setState(() {}));
//     _iconAnimationController.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       backgroundColor: Colors.pinkAccent,
//       body: new Stack(
//         fit: StackFit.expand,
//         children: <Widget>[
//           new Image(
//             image: new AssetImage("assets/pinkbg.jpg"),
//             fit: BoxFit.cover,
//             color: Colors.white24,
//             colorBlendMode: BlendMode.lighten,
//           ),
//           new Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               new Image(
//                 image: new AssetImage("assets/logo only.png"),
//                 height: _iconAnimation.value * 170,
//                 width: _iconAnimation.value * 170,
//               ),
//               new Form(
//                 key: _formkey,
//                 child: new Theme(
//                   data: new ThemeData(
//                       brightness: Brightness.light,
//                       primarySwatch: Colors.pink[150],
//                       inputDecorationTheme: new InputDecorationTheme(
//                           labelStyle: new TextStyle(
//                               color: Colors.pink[200], fontSize: 20.0))),
//                   child: new Container(
//                     padding: const EdgeInsets.all(40.0),
//                     child: new Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: <Widget>[
//                         new TextFormField(
//                           validator: (value) {
//                             if (value.isEmpty) {
//                               return 'Please enter username';
//                             }
//                           },
//                           controller: _username,
//                           decoration: new InputDecoration(
//                             labelText: "Enter your name",
//                           ),
//                           keyboardType: TextInputType.text,
//                         ),
//                         new TextFormField(
//                           validator: (value) {
//                             if (value.isEmpty) {
//                               return 'Please enter password';
//                             }
//                           },
//                           controller: _password,
//                           decoration: new InputDecoration(
//                             labelText: "Enter Password",
//                           ),
//                           keyboardType: TextInputType.text,
//                           obscureText: true,
//                         ),
//                         new Padding(
//                           padding:
//                               const EdgeInsets.only(bottom: 20.0, top: 20.0),
//                         ),
//                         new MaterialButton(
//                           height: 40.0,
//                           minWidth: 300.0,
//                           color: Colors.pink[400],
//                           textColor: Colors.white,
//                           child: new Text("Log in"),
//                           onPressed: () {
//                             // Navigator.of(context).pushReplacementNamed("/Home");
//                             Navigator.push(context, new MaterialPageRoute(
//                               builder: (context) => new Home())
//                             );
//                             // doLogin();
//                           },
//                           splashColor: Colors.pink[200],
//                         ),
//                         new MaterialButton(
//                           height: 40.0,
//                           minWidth: 300.0,
//                           color: Colors.pink[400],
//                           textColor: Colors.white,
//                           child: new Text("Sign up"),
//                           onPressed: () {
//                             // Navigator.of(context).pushReplacementNamed("/signup");
//                             Navigator.push(context, new MaterialPageRoute(
//                               builder: (context) => new SignupPage())
//                             );
//                           },
//                           splashColor: Colors.pink[200],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// // Future <void> signIn() async{
// //   final formState = _formkey.currentState;
// //   if(formState.validate()){
// //     formState.save();
// //     try {
// //        FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email:_username.text ,password:_password.text  );
// //         Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(user:user)));
// //     } catch (e) {
// //       print(e.message);
// //     }
// }
