import 'package:flutter/material.dart';
import 'package:front_backpack_app/api_provider.dart';

import 'package:intl/intl.dart';

import 'rating.dart';
import '../profile/profile.dart';
import '../database/db_account.dart';
import '../database/db_schema.dart';

import 'qr_generator.dart';
// import  'category.dart';

class SessionPage extends StatefulWidget {
  AccountObject currentUser;
  AccountObject opposite;
  SessionObject session;
  SessionPage(this.currentUser, this.opposite, this.session);
  //Session3
  @override
  State createState() => new SessionPageState(currentUser, opposite, session);
}

class SessionPageState extends State<SessionPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  AccountObject currentUser;
  AccountObject opposite;
  SessionObject session;
  SessionPageState(this.currentUser, this.opposite, this.session);

  ApiProvider apiProvider = ApiProvider();
  Future doEndsession(BuildContext context) async {
    final rs = await apiProvider.doEndsession("sid", "end");
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => new RatingSession(currentUser, opposite, session),
      ),
    );
    print(rs.body);
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

  @override
  Widget build(BuildContext context) {
    DateTime sesEnd = DateTime.parse(session.endTime);

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
                Text('Return Time'),
                new Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      DateFormat("h:mm a").format(sesEnd),
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    )),
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
                        width: 75.0,
                        height: 75.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://firebasestorage.googleapis.com/v0/b/shareit-60e65.appspot.com/o/profile.png?alt=media&token=297c1341-5c7d-4b1e-902b-2a98e4951f52'), //AssetImage('assets/profile/profile.jpg'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(80.0),
                        ),
                      ),
                      title: Text(
                        'Session With ' + opposite.first_Name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Row(
                        children: <Widget>[
                          Icon(Icons.phone),
                          Text(
                            opposite.tel_No,
                            style: TextStyle(color: Colors.black87),
                          )
                        ],
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
                    doEndsession(context);
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
