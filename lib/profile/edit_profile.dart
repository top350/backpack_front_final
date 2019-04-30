import 'package:flutter/material.dart';
import 'package:front_backpack_app/api_provider.dart';

import '../database/db_account.dart';
import 'profile_category.dart';
import 'imagePickerProfile.dart';
// import '../borrow/imagePickerBorrow.dart';

class EditProfile extends StatefulWidget {
  AccountObject currentUser;
  EditProfile(this.currentUser);

  @override
  _EditProfileState createState() => _EditProfileState(currentUser);
}

class _EditProfileState extends State<EditProfile> {
  AccountObject currentUser;
  _EditProfileState(this.currentUser);

  String sendFirstName = ''; //Send to Backend when pressed save
  String sendLirstName = ''; //Send to Backend when pressed save
  String sendEmail = ''; //Send to Backend when pressed save
  String sendTelNo = ''; //Send to Backend when pressed save

  TextEditingController _firstNameController;
  TextEditingController _lastNameController;
  TextEditingController _emailController;
  TextEditingController _phoneNumController;

// Future doSignup() async {
//   final rs = await apiProvider.doSignup(studentID.text, firstname.text, lastname.text, password1.text, phoneNo.text, email.text);
//   print(rs.body);
//   if (rs.statusCode == 200) {
//     print(rs.body);
//     //var jsonRes = json.decode(rs.body);
//     if (rs.body == 'signed up') {
//       Navigator.of(context).pushReplacementNamed("/login");
//     } else {
//       print('Server error');

//     }
//   }
// }
  ApiProvider apiProvider = ApiProvider();
  Future doeditProfile() async {
    String aid = this.currentUser.aid.toString();
    print(aid);
    final rs = await apiProvider.doeditProfile(
        aid,
        _firstNameController.text,
        _lastNameController.text,
        _phoneNumController.text,
        _emailController.text);
    print(rs.body);
  }

  @override
  void initState() {
    super.initState();
    _firstNameController =
        new TextEditingController(text: currentUser.first_Name);
    _lastNameController =
        new TextEditingController(text: currentUser.last_Name);
    _emailController = new TextEditingController(text: currentUser.email);
    _phoneNumController = new TextEditingController(text: currentUser.tel_No);
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
            //child: ImagePickerProfile(currentUser),
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
                  currentUser.first_Name = input;
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
                  currentUser.last_Name = input;
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
                    currentUser.tel_No = input;
                  });
                },
              )),

          Padding(
            padding: EdgeInsets.all(5),
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
                    doeditProfile();
                    setState(() {
                      uploadImage(currentUser.image);
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
