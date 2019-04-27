import 'package:flutter/material.dart';

import '../database/db_account.dart';
import 'profile_category.dart';
import 'imagePickerProfile.dart';

// String firstName = ''; //editable
// String lastName = ''; //editable
// String email = ''; //editable
// String telNo = ''; //editable

// String categotyHave = ''; //editable
// String profilePic; //editable

class EditProfile extends StatefulWidget {
  AccountObject currentUser;
  EditProfile(this.currentUser);

  @override
  _EditProfileState createState() => _EditProfileState(currentUser);
}

class _EditProfileState extends State<EditProfile> {
  AccountObject currentUser;
  _EditProfileState(this.currentUser);

  TextEditingController _firstNameController;
  TextEditingController _lastNameController;
  TextEditingController _emailController;
  TextEditingController _phoneNumController;

  @override
  void initState() {
    super.initState();
    _firstNameController =
        new TextEditingController(text: currentUser.firstName);
    _lastNameController = new TextEditingController(text: currentUser.lastName);
    _emailController = new TextEditingController(text: currentUser.email);
    _phoneNumController = new TextEditingController(text: currentUser.telNo);
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
            child: ImagePickerProfile(currentUser),
          ),
          Container(
            // firstName
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
            decoration: BoxDecoration(
              color: Colors.pink[50],
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: TextField(
              controller: _firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
              onChanged: (String input) {
                setState(() {
                  currentUser.firstName = input;
                });
              },
            ),
          ),
          Container(
            // lastName
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
            decoration: BoxDecoration(
              color: Colors.pink[50],
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: TextField(
              controller: _lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
              onChanged: (String input) {
                setState(() {
                  currentUser.lastName = input;
                });
              },
            ),
          ),
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
                  currentUser.email = input;
                });
              },
            ),
          ),
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
                    currentUser.telNo = input;
                  });
                },
              )),

          Padding(
            padding: EdgeInsets.all(5),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: <Widget>[
          //     Container(
          //       margin: EdgeInsets.all(5),
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(50.0),
          //       ),
          //       width: 150,
          //       child: RaisedButton(
          //         color: Colors.pinkAccent,
          //         child: Text(
          //           'Category',
          //           style: TextStyle(
          //             color: Colors.white,
          //           ),
          //         ),
          //         onPressed: () {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //               builder: (context) => ProfileCategory(),
          //             ),
          //           );
          //         },
          //       ),
          //     ),
          //     Container(
          //       margin: EdgeInsets.all(5),
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(50.0),
          //       ),
          //       width: 150,
          //       child: RaisedButton(
          //         color: Colors.black38,
          //         child: Text(
          //           'Change Password',
          //           style: TextStyle(
          //             color: Colors.white,
          //           ),
          //         ),
          //         onPressed: () {},
          //       ),
          //     ),
          //   ],
          // ),
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
