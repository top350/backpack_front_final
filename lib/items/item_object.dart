import 'package:flutter/material.dart';
import 'dart:io';

class ItemObject {

  String itemName;
  String category;
  DateTime pickupTime;
  DateTime returnTime;
  String location;
  int token;
  String note;
  String imageurl;
  String who;
  File examplepic;


  ItemObject(this.itemName, this.category, this.pickupTime, this.returnTime,
      this.location, this.token, this.note, this.imageurl, this.who,this.examplepic);
}

class ItemObjectt {
  int itemNo;
  String itemName = '';
  String itemCategory = '';
  String qrCode = '';
  int belongToAccountNo;
  String examlePic = '';
  DateTime createdAt;
  DateTime updatedAt;

  ItemObjectt(this.itemNo, this.itemName, this.itemCategory, this.qrCode,
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