import 'package:flutter/material.dart';

import 'dart:io';

import 'edit_profile.dart';

import '../database/db_account.dart';



class ProfilePage extends StatefulWidget {
  
  AccountObject currentUser; //Receive from Home
  ProfilePage(this.currentUser);
  @override
  _ProfilePageState createState() => _ProfilePageState(currentUser);
}

class _ProfilePageState extends State<ProfilePage> {
  AccountObject currentUser;
  _ProfilePageState(this.currentUser);

  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditProfile(currentUser)));
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          _buildCoverImage(screenSize,null,currentUser),
          _buildStatContainer(
            currentUser),
          _buildProfileInfo(currentUser),
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                width: 125,
                child: RaisedButton(
                  color: Colors.black38,
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    _showWarningDialog(context);
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


  _showWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you want to logout?'),
            actions: <Widget>[
              FlatButton(
                child: Text('DISCARD'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text('CONTINUE'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/splash', (Route<dynamic> route) => false);
                },
              )
            ],
          );
        });
  }


Widget _buildCoverImage(double screenSize,File profilepic,AccountObject currentUser) {
  return Container(
    height: screenSize / 2.5,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        displaySelectedFile(profilepic,currentUser),
        // _buildProfileImage(),
        SizedBox(
          height: 15,
        ),
        Text(
         currentUser.first_Name+" " +currentUser.last_Name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          '3rd year, Engineering',//need to make a method
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ],
    ),
    decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [const Color(0xFF915FB5), const Color(0xFFCA436B)])
        ),
  );
}

  Widget displaySelectedFile(File file,AccountObject currentUser) {
    return new Container(
      margin: EdgeInsets.all(10),
      // child: new Card(child: new Text('' + galleryFile.toString())),
      // child: new Image.file(galleryFile),
      child: file == null
          ? _buildProfileImage(currentUser)
          : new Center(
              child: Container(
                width: 140.0,
                height: 140.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(file),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(80.0),
                  border: Border.all(
                    color: Colors.white,
                    width: 10.0,
                  ),
                ),
              // child: Image.file(file),
              ),
            ),
    );
  }

Widget _buildProfileImage(AccountObject currentUser) {
  return Center(
    child: Container(
      width: 120.0,
      height: 120.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/item_example/blanket.jpg"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(80.0),
        border: Border.all(
          color: Colors.white,
          width: 5.0,
        ),
      ),
    ),
  );
}


Widget _buildStatContainer(AccountObject currentUser) {
  return Container(
    height: 60.0,
    decoration: BoxDecoration(
      color: Colors.black12,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _buildStatItem(
            Icon(Icons.star, color: Colors.yellowAccent, size: 30), currentUser.avg_Rating.toString()),
        _buildStatItem(
            Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/token_2.png",
                    ),
                    fit: BoxFit.fill),
              ),
            ),
            currentUser.token.toString()),
      ],
    ),
  );
}

Widget _buildStatItem(Widget input, String count) {
  TextStyle _statCountTextStyle = TextStyle(
    color: Colors.black54,
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
  );

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      input,
      SizedBox(width: 10),
      Text(
        count,
        style: _statCountTextStyle,
      ),
    ],
  );
}

Widget _buildProfileInfo(AccountObject currentUser) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(
              Icons.assignment_ind,
              size: 30,
              color: Colors.pink[300],
            ),
            SizedBox(width: 5),
            Text('Student ID  ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600)),
            SizedBox(
              width: 20,
            ),
            Text(
              currentUser.it_chula,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            Icon(
              Icons.phone,
              size: 30,
              color: Colors.pink[300],
            ),
            SizedBox(width: 8),
            Text('Phone no.  ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600)),
            SizedBox(
              width: 20,
            ),
            Text(
              currentUser.tel_No,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            Icon(
              Icons.email,
              size: 30,
              color: Colors.pink[300],
            ),
            SizedBox(width: 8),
            Text('Email  ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600)),
            SizedBox(
              width: 10,
            ),
            Text(
              currentUser.email,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}


