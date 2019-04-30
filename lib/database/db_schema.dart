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
  int tokenUsed;
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
  String startTime;
  String endTime;
  String sessionStatus;
  int requestID; //From Request
  int sessionItemName; //From Item
  int itemOfAcountNo; //From Item


 
  SessionObject({
      this.sessionNo,
      this.startTime,
      this.endTime,
      this.sessionStatus,
      this.requestID,
      this.sessionItemName,
      this.itemOfAcountNo}
  );
    

factory SessionObject.fromJson(Map<String, dynamic> json) {

  
    return 
    SessionObject(
      sessionNo: json['sid'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      sessionStatus: json['s_status'],
      requestID : json['rid'], 
      sessionItemName :json['iid'],
      itemOfAcountNo :json['aid']
     
    
    );
}

    
}

class FeedbackObject {
  String feedbackNo;
  String comment;
  double rating;
  int fromAccountNo;
  int toAccountNo;
  DateTime createdAt;
  DateTime updatedAt;

  FeedbackObject(this.feedbackNo, this.comment, this.rating, this.createdAt,
      this.updatedAt);
}

class SessionandOppAcc{
  String oaid;
  String otel_no;
  String oqr_code;
  String ofirst_name;
  String olast_name;
  String oemail;
  String oimage;
  String oit_chula;
  String ssid;
  String sstart_time;
  String ssend_time;
  String ss_status;
  String siid;
  String srid;

  SessionandOppAcc({this.oaid,this.otel_no,this.oqr_code,this.ofirst_name,this.olast_name,this.oemail,this.oimage,this.oit_chula
  ,this.ssid,this.sstart_time,this.ssend_time,this.ss_status,this.siid,this.srid});

  
factory SessionandOppAcc.fromJson(Map<String, dynamic> json) {

  
    return 
    SessionandOppAcc(
      oaid: json['aid'].toString(),
      otel_no: json['tel_no'],
      oqr_code: json['qrcode'],
      ofirst_name: json['first_name'],
      olast_name : json['last_name'], 
      oemail :json['email'],
      oimage :json['image'],
      oit_chula: json['it_chula'],
      ssid: json['sid'].toString(),
      sstart_time: json['start_time'],
      ssend_time: json['end_time'],
      ss_status : json['s_status'], 
     siid :json['iid'].toString(),
     srid :json['rid'].toString()
     
    
    );
}

}
