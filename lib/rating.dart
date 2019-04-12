import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

import 'home.dart';


class RatingSession extends StatefulWidget {
  @override
  _RatingSessionState createState() => new _RatingSessionState();
}

class _RatingSessionState extends State<RatingSession> {
  double rating = 3.5;
  int starCount = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Star Rating"),
      ),
      body: new Column(
        children: <Widget>[
          new Padding(
            padding: new EdgeInsets.only(
              top: 50.0,
              bottom: 50.0,
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
          new Text(
            "Your rating is: $rating",
            style: new TextStyle(fontSize: 30.0),
          ),
          new Padding(
            padding: const EdgeInsets.only(bottom: 20.0, top: 50.0),
          ),
          new MaterialButton(
            height: 40.0,
            minWidth: 300.0,
            color: Colors.pink[300],
            textColor: Colors.white,
            child: new Text("Summit"),
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/Home'));
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => new Home()));
            },
            splashColor: Colors.pink[200],
          ),
        ],
      ),
    );
  }
}
