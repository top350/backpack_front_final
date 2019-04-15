import 'package:flutter/material.dart';

import 'profile_object.dart';

class EditProfile extends StatefulWidget {
  Profile example;

  EditProfile(this.example);

  @override
  _EditProfileState createState() => _EditProfileState(example);
}

class _EditProfileState extends State<EditProfile> {
  Profile example;

  _EditProfileState(this.example);

  TextEditingController _nameController;
  TextEditingController _stuIDController;
  TextEditingController _phoneNumController;
  TextEditingController _lineIDController;
  TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = new TextEditingController(text: bus.fullName);
    _stuIDController = new TextEditingController(text: bus.studentID);
    _phoneNumController = new TextEditingController(text: bus.phoneNum);
    _lineIDController = new TextEditingController(text: bus.lineID);
    _emailController = new TextEditingController(text: bus.email);
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Edit"),
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
                        padding: EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 6.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: TextField(
                          controller: _nameController,
                          decoration: InputDecoration(labelText: 'Full Name'),
                          onChanged: (String input) {
                            setState(() {
                              example.fullName = input;
                            });
                          },
                        )),
                    // Container(
                    //     margin: EdgeInsets.all(10),
                    //     padding: EdgeInsets.symmetric(
                    //         vertical: 4.0, horizontal: 6.0),
                    //     decoration: BoxDecoration(
                    //       color: Theme.of(context).scaffoldBackgroundColor,
                    //       borderRadius: BorderRadius.circular(4.0),
                    //     ),
                    //     child: TextField(
                    //       controller: _stuIDController,
                    //       decoration: InputDecoration(labelText: 'Student ID'),
                    //       onChanged: (String input) {
                    //         setState(() {
                    //           example.studentID = input;
                    //         });
                    //       },
                    //     )),
                    Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 6.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: TextField(
                          controller: _phoneNumController,
                          decoration: InputDecoration(labelText: 'Phone Number'),
                          onChanged: (String input) {
                            setState(() {
                              example.phoneNum = input;
                            });
                          },
                        )),
                    Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 6.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: TextField(
                          controller: _lineIDController,
                          decoration: InputDecoration(labelText: 'Line ID'),
                          onChanged: (String input) {
                            setState(() {
                              example.lineID = input;
                            });
                          },
                        )),
                    Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 6.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(labelText: 'Email '),
                          onChanged: (String input) {
                            setState(() {
                              example.email = input;
                            });
                          },
                        )),
                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    RaisedButton(
                      child: Text('Save'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
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
