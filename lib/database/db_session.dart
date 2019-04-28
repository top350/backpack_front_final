import 'package:flutter/material.dart';

class SessionObject {
  int sessionNo;
  DateTime startTime;
  DateTime endTime;
  String sessionStatus;
  int requestID; //From Request
  String sessionItemName = ''; //From Item
  int itemOfAcountNo; //From Item
  DateTime createdAt;
  DateTime updatedAt;

  SessionObject({
      this.sessionNo,
      this.startTime,
      this.endTime,
      this.sessionStatus,
      this.requestID,
      this.sessionItemName,
      this.itemOfAcountNo,
      this.createdAt,
      this.updatedAt});

  factory SessionObject.fromJsonSID(Map<String, dynamic> json) {
    return SessionObject(
       sessionNo: json['sid']
    );
      
  }

DateTime sampleTime = DateTime.parse('2019-04-20 12:12:12');

// SessionObject sesOne =   SessionObject({
//       1,
//   DateTime.now(),
//       DateTime.now(),
//       'sessionStatus',
//       1,
//       'sessionItemName',
//       1,
//       DateTime.now(),
//       DateTime.now()
// });
}