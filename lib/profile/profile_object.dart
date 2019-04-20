import 'package:flutter/material.dart';
import 'dart:io';

class Profile {
  String fullName = '';
  String studentID = '';
  String phoneNum = '';
  String lineID = '';
  String email = '';
  File profilepic;

  //Ideal
  // int accountNo ;
  // int studentID = '';
  // String password = '';
  // String firstName = '';
  // String lastName = '';
  // int phoneNum = '';
  // String email = '';
  // double rating = '';
  // int token = '';

  Profile(
      this.fullName, this.studentID, this.phoneNum, this.lineID, this.email,this.profilepic);
}

Profile bus = Profile('Patsornchai Wibontanasarn','5931307021','0812345678','patsornchaiw.','patsornchai@gmail.com',File('assets/profile/profile.jpg'));