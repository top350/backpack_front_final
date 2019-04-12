import 'package:flutter/material.dart';

import 'edit_profile.dart';
import 'profile_object.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState(bus);
}

class _ProfilePageState extends State<ProfilePage> {

  Profile example;

  _ProfilePageState(this.example);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
        body: Stack(
          children: <Widget>[
            _buildCoverImage(screenSize),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 65, horizontal: 10),
                    ),
                    _buildProfileImage(),
                    Container(
                      margin: EdgeInsets.all(10),
                      padding:
                          EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Text(bus.fullName,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      padding:
                          EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Text(
                        'Student ID : ' + bus.studentID,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      padding:
                          EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Text(
                        'Phone Number : ' + bus.phoneNum,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      padding:
                          EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Text(
                        'Line ID : ' + bus.lineID,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      padding:
                          EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Text(
                        'Email : ' + bus.email,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    RaisedButton(
                      child: Text('Edit Profile'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfile(example)),
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                    ),
                    RaisedButton(
                      child: Text('Log out'),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

Widget _buildCoverImage(Size screenSize) {
  return Container(
    height: 200,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/profile/cover.jpg'),
        fit: BoxFit.cover,
      ),
    ),
  );
}


Widget _buildProfileImage() {
  return Center(
    child: Container(
      width: 140.0,
      height: 140.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/profile/profile.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(80.0),
        border: Border.all(
          color: Colors.white,
          width: 10.0,
        ),
      ),
    ),
  );
}
