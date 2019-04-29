import 'package:flutter/material.dart';

//Prepare for backend
class RegChulaObject {
  String studentID = '';
  String firstName = '';
  String lastName = '';

  RegChulaObject(this.studentID, this.firstName, this.lastName);
}

class UserObject {
  String aid;
  String it_chula = '';
  String password = '';
  String first_Name = '';
  String last_Name = '';
  String email = '';
  String tel_No = '';
  String qrCode = '';
  String no_Of_Feedback;
  String avg_Rating;
  String token;
 // String categotyHave = '';
  String image;
  bool in_session;
  DateTime createdAt;
  DateTime updatedAt;

  UserObject({
      this.aid,
      this.it_chula,
      this.password,
      this.first_Name,
      this.last_Name,
      this.email,
      this.tel_No,
      this.qrCode,
      this.no_Of_Feedback,
      this.avg_Rating,
      this.token,
   //   this.categotyHave,
      this.image,
      this.in_session,
      this.createdAt,
      this.updatedAt});

      factory UserObject.fromJson(Map<String, dynamic> json) {

  
    return UserObject(
      aid: json['aid'],
      first_Name: json['first_name'],
      last_Name: json['last_name'],
      tel_No: json['tel_no'],
      email: json['email'],
       it_chula: json['it_chula'],
       qrCode: json['qrcode'],
       no_Of_Feedback: json['no_of_feedback'],
       avg_Rating: json['avg_rating'],
        token: json['token'],
       //categotyHave: json['fullname'],
       image: json['image'],
       in_session: json['in_session'],
  
      
    );
}
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

  ItemObject({this.itemNo, this.itemName, this.itemCategory, this.qrCode,
      this.belongToAccountNo, this.examlePic, this.createdAt, this.updatedAt});
      
}

class RequestObjects {
  int requestNo;
  String itemName = '';
  String itemCategory = '';
  String pickUpTime;
  String returnTime;
  String kioskLocation = '';
  String tokenUsed;
  String note;
  String examplePic;
  bool requestStatus;
  int reqByAccountNo; //From account
  DateTime createdAt;
  DateTime updatedAt;

  RequestObjects({
      this.requestNo,
      this.itemName,
      this.itemCategory,
      this.pickUpTime,
      this.returnTime,
      this.kioskLocation,
      this.tokenUsed,
      this.note,
      this.examplePic,
      this.requestStatus,
      this.reqByAccountNo,
      this.createdAt,
      this.updatedAt});
     
     
  factory RequestObjects.fromJson(Map<String, dynamic> json) {

  
    return RequestObjects(
      itemName: json['itemname'],
      itemCategory: json['category'],
      pickUpTime: json['pickupTime'],
      returnTime: json['returnTime'],
      kioskLocation: json['Kios'],
        tokenUsed: json['token'],
      note: json['note'],
  
      
    );
   
  }
 
      
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
