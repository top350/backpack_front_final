import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:front_backpack_app/api_provider.dart';

import 'kiosk_session.dart';
import '../database/db_account.dart';
import '../database/db_schema.dart';

class WaitingSession extends StatelessWidget {
  AccountObject currentUser;
  AccountObject opposite;
  SessionObject session;
  WaitingSession(this.currentUser);
  ApiProvider apiProvider = ApiProvider();
  Future<Null> checkBorrowerSession(int aid, BuildContext context) async {
    final rs = await apiProvider.doAccountsession(aid.toString());

    if (rs.statusCode == 200) {
      //print(rs.body);
      var jsonRes = json.decode(rs.body);
      if (rs.body == 'false') {
        print('no session');
      } else {
        print(rs.body);
        final session = SessionObject.fromJson(jsonRes[0]);
        final opposite = AccountObject.fromJson(jsonRes[0]);
        print(session.sessionNo);
        print(opposite.aid);
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) =>
                  new KioskSession(currentUser, opposite, session.sessionNo)),
        );
      }
    }
  }

  //Session1
  @override
  Widget build(BuildContext context) {
    double screenSizeHeight = MediaQuery.of(context).size.height;
    double screenSizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Waiting Session'),
        actions: <Widget>[
          //For Testing Only
          IconButton(
            icon: Icon(
              Icons.navigate_next,
            ),
            onPressed: () {
              // Navigator.of(context).push(

              //   MaterialPageRoute(builder: (context) => new KioskSession(currentUser,opposite,session)),

              // );
            },
          )
        ],
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            checkBorrowerSession(currentUser.aid, context);
            // Navigator.of(context).push(
            //     MaterialPageRoute(builder: (context) => new KioskSession())
            //     ,);
          },
          child: Icon(Icons.refresh,
              size: screenSizeWidth / 1.5, color: Colors.pink[200]),
        ),
      ),
    );
  }
}
