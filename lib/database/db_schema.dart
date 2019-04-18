import 'package:flutter/material.dart';

class RegChulaObject {
  String studentID = '';
  String firstName = '';
  String lastName = '';

  RegChulaObject(this.studentID, this.firstName, this.lastName);
}

class UserObject {
  int accountNo;
  String studentID = ''; //From RegChula
  String phoneNo = '';
  int token;
  double rating;

  UserObject(
      this.accountNo, this.studentID, this.phoneNo, this.token, this.rating);
}

class ItemObject {
  String itemName = '';
  String itemCategory = '';
  String qrCode = '';
  int accountNo; //From User

  ItemObject(this.itemName, this.itemCategory, this.qrCode, this.accountNo);
}

class RequestObject {
  int requestNo;
  String itemCategory = '';
  int tokenUsed;
  String kioskLocation = '';
  DateTime pickUpTime;
  DateTime returnTime;
  bool requestStatus;
  int accountNo; //From User

  RequestObject(
      this.requestNo,
      this.itemCategory,
      this.tokenUsed,
      this.kioskLocation,
      this.pickUpTime,
      this.returnTime,
      this.requestStatus,
      this.accountNo);
}

class SessionObject {
  int sessionNo;
  DateTime startTime;
  DateTime endTime;
  bool sessionStatus;
  int requestID; //From Request
  String itemName = ''; //From Item
  int itemOfAcountNo; //From Item
  int feedbackNo; //From FeedBack

  SessionObject(
      this.sessionNo,
      this.startTime,
      this.endTime,
      this.sessionStatus,
      this.requestID,
      this.itemName,
      this.itemOfAcountNo,
      this.feedbackNo);
}

class FeedbackObject {
  int feedbackNo;
  String comment;
  double rating;

  FeedbackObject(this.feedbackNo, this.comment, this.rating);
}
