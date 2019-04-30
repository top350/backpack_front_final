import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:front_backpack_app/api_provider.dart';
import 'package:front_backpack_app/bottombar_home.dart';
import '../database/db_schema.dart';
import '../database/db_account.dart';

class RatingSession extends StatefulWidget {
  //Session4
  AccountObject currentUser;
  AccountObject opposite;
  SessionObject session;
  RatingSession(this.currentUser,this.opposite,this.session);
  @override
  _RatingSessionState createState() => new _RatingSessionState(this.currentUser,this.opposite,this.session);


}

class _RatingSessionState extends State<RatingSession> {
    AccountObject currentUser;
  AccountObject opposite;
  SessionObject session;
  _RatingSessionState(this.currentUser,this.opposite,this.session);
  double rating = 3.5;
  int starCount = 5;
  String note = '';

 
               
  ApiProvider apiProvider = ApiProvider();  
    Future doFeedback() async {
        String faid = currentUser.aid.toString();
    String taid = opposite.aid.toString();
   
    var rs = await apiProvider.doFeedback(rating.toString(),note,taid,faid);
    if(rs.statusCode==200){
        print('feedback inserted');
               
          Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ButtomBarHome(currentUser),
                      ),
                  );
      }


    } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Star Rating"),
      ),
      body: new ListView(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Icon(
            Icons.check_circle_outline,
            size: 100,
            color: Colors.green,
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Success!',
                style: TextStyle(fontSize: 50),
              ),
              Text(
                'Thank you for using Share-IT',
                style: TextStyle(fontSize: 20, color: Colors.black54),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.pink[50],
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: Colors.pink,
                width: 5.0,
              ),
            ),
            margin: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                new Padding(
                  padding: new EdgeInsets.only(
                    top: 10.0,
                    bottom: 10.0,
                  ),
                  child: Text(
                    'Please rate '+opposite.first_Name,
                    style: TextStyle(fontSize: 20, color: Colors.black87),
                  ),
                ),
                Container(
                  width: 120.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/shareit-60e65.appspot.com/o/profile.png?alt=media&token=297c1341-5c7d-4b1e-902b-2a98e4951f52'),//AssetImage('assets/profile/profile.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(80.0),
                    border: Border.all(
                      color: Colors.white,
                      width: 6.0,
                    ),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(
                    top: 5.0,
                    bottom: 10.0,
                  ),
                  child: new StarRating(
                    size: 50.0,
                    rating: rating,
                    color: Colors.orange,
                    borderColor: Colors.grey,
                    starCount: starCount,
                    onRatingChanged: (rating) => setState(
                          () {
                            this.rating = rating;
                          },
                        ),
                  ),
                ),
                // new Text(
                //   "Your rating is: $rating",
                //   style: new TextStyle(fontSize: 30.0),
                // ),
                // new Padding(
                //   padding: const EdgeInsets.all(20),
                // ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    maxLines: 2,
                    decoration: InputDecoration(
                        labelText: 'Note',
                        labelStyle:
                            TextStyle(fontSize: 15,)),
                    onChanged: (String value) {
                      setState(() {
                        note = value;
                        //note = value;
                      });
                    },
                  ),
                ),

                
              ],
            ),
          ),
          new Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
          ),
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                width: 200,
                child: RaisedButton(
                  color: Colors.green,
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    doFeedback();
                    // Navigator.of(context).pushNamedAndRemoveUntil(
                    //     '/Home', (Route<dynamic> route) => false);
                    // Navigator.of(context).pushReplacement(
                    //     MaterialPageRoute(builder: (context) => new Home()));
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
