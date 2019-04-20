import 'package:flutter/material.dart';

class RegChulaObject {
  String studentID = '';
  String firstName = '';
  String lastName = '';

  RegChulaObject(this.studentID, this.firstName, this.lastName);
}

class UserObject {
  int accountNo;
  String studentID = '';
  String password = '';
  String firstName = '';
  String lastName = '';
  String email = '';
  String telNo = '';
  String qrCode = '';
  int noOfFeedback;
  double avgRating;
  int token;
  String categotyHave = '';
  String profilePic;
  bool inSession;
  DateTime createdAt;
  DateTime updatedAt;

  UserObject(
      this.accountNo,
      this.studentID,
      this.password,
      this.firstName,
      this.lastName,
      this.email,
      this.telNo,
      this.qrCode,
      this.noOfFeedback,
      this.avgRating,
      this.token,
      this.categotyHave,
      this.profilePic,
      this.inSession,
      this.createdAt,
      this.updatedAt);
}

class ItemObject {
  int itemNo;
  String itemName = '';
  String itemCategory = '';
  String qrCode = '';
  int belongToAccountNo;
  String examlePic = '';
  DateTime createdAt;
  DateTime updatedAt;

  ItemObject(this.itemNo, this.itemName, this.itemCategory, this.qrCode,
      this.belongToAccountNo, this.examlePic, this.createdAt, this.updatedAt);
}

class RequestObject {
  int requestNo;
  String itemName = '';
  String itemCategory = '';
  DateTime pickUpTime;
  DateTime returnTime;
  String kioskLocation = '';
  int tokenUsed;
  String note;
  bool requestStatus;
  int reqByAccountNo; //From account
  DateTime createdAt;
  DateTime updatedAt;

  RequestObject(
      this.requestNo,
      this.itemName,
      this.itemCategory,
      this.pickUpTime,
      this.returnTime,
      this.kioskLocation,
      this.tokenUsed,
      this.note,
      this.requestStatus,
      this.reqByAccountNo,
      this.createdAt,
      this.updatedAt);
}

class SessionObject {
  int sessionNo;
  DateTime startTime;
  DateTime endTime;
  bool sessionStatus;
  int requestID; //From Request
  String sessionItemName = ''; //From Item
  int itemOfAcountNo; //From Item
  DateTime createdAt;
  DateTime updatedAt;

  SessionObject(
      this.sessionNo,
      this.startTime,
      this.endTime,
      this.sessionStatus,
      this.requestID,
      this.sessionItemName,
      this.itemOfAcountNo,
      this.createdAt,
      this.updatedAt);
}

class FeedbackObject {
  int feedbackNo;
  String comment;
  double rating;
  int fromAccountNo;
  int toAccountNo;
  DateTime createdAt;
  DateTime updatedAt;

  FeedbackObject(this.feedbackNo, this.comment, this.rating, this.createdAt,
      this.updatedAt);
}
