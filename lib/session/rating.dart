import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

import '../database/db_account.dart';
import '../database/db_session.dart';

class RatingSession extends StatefulWidget {
  //Session4
  AccountObject currentUser; //Receive from Session3
  SessionObject ongoingSession; //Receive from Session3
  AccountObject otherPerson; //Receive from Session3
  RatingSession(this.currentUser, this.ongoingSession, this.otherPerson);

  @override
  _RatingSessionState createState() =>
      new _RatingSessionState(currentUser, ongoingSession, otherPerson);
}

class _RatingSessionState extends State<RatingSession> {
  AccountObject currentUser; //Receive from Session3
  SessionObject ongoingSession; //Receive from Session3
  AccountObject otherPerson; //Receive from Session3
  _RatingSessionState(this.currentUser, this.ongoingSession, this.otherPerson);
  double rating = 3.5; //Send to Backend
  int starCount = 5;
  String note = ''; //Send to Backend

  @override
  Widget build(BuildContext context) {
    String user1 = currentUser.studentID; //Send to Backend
    String user2 = otherPerson.studentID; //Send to Backend
    int sesID = ongoingSession.sessionNo; //Send to Backend
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
                    'Please rate ' + otherPerson.firstName,
                    style: TextStyle(fontSize: 20, color: Colors.black87),
                  ),
                ),
                Container(
                  width: 120.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(otherPerson.profilePic),
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
                        labelStyle: TextStyle(
                          fontSize: 15,
                        )),
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
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/Home', (Route<dynamic> route) => false);
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
