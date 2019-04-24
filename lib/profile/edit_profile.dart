import 'package:flutter/material.dart';

import 'profile_object.dart';
import 'profile_category.dart';
import 'imagePickerProfile.dart';

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
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          ),
          //_buildProfileImage(),
          Container(
            margin: EdgeInsets.all(10),
            child: ImagePickerProfile(example),
          ),
          Container(
              // Name
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
              decoration: BoxDecoration(
                color: Colors.pink[50],
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
          Container(
              //Phone Number
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
              decoration: BoxDecoration(
                color: Colors.pink[50],
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _phoneNumController,
                decoration: InputDecoration(labelText: 'Phone Number'),
                onChanged: (String input) {
                  setState(() {
                    example.phoneNum = input;
                  });
                },
              )),
          Container(
              //Email
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
              decoration: BoxDecoration(
                color: Colors.pink[50],
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
            padding: EdgeInsets.all(5),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                width: 150,
                child: RaisedButton(
                  color: Colors.pinkAccent,
                  child: Text(
                    'Category',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileCategory(),
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                width: 150,
                child: RaisedButton(
                  color: Colors.black38,
                  child: Text(
                    'Change Password',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                width: 125,
                child: RaisedButton(
                  color: Colors.green,
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(5),
          ),
        ],
      ),
    );
  }
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
