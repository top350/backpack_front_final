import 'package:flutter/material.dart';

class Profile {
  String fullName = '';
  String studentID = '';
  String phoneNum = '';
  String lineID = '';
  String email = '';

  Profile(
      this.fullName, this.studentID, this.phoneNum, this.lineID, this.email);
}

Profile bus = Profile('Patsornchai Wibontanasarn','5931307021','0812345678','patsornchaiw.','patsornchai@gmail.com');