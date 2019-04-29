import 'dart:io';

import 'db_account.dart';
import '../items/item_card.dart';

class RequestObject {
  int requestNo;
  String itemName = '';
  String itemCategory = '';
  String pickUpTime;
  String returnTime;
  String kioskLocation = '';
  int tokenUsed;
  String note;
  String examplePicUrl;
  String requestStatus;
  int reqByAccountNo; //From account
  String createdAt ='';
  String updatedAt='';
  File newExamplePic; //For Local use only

  RequestObject({
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
      this.updatedAt,
      this.examplePicUrl
  });

  factory RequestObject.fromJson(Map<String, dynamic> json) {

  
    return new RequestObject(
      requestNo: json['rid'],
      itemName: json['item_name'],
      itemCategory: json['item_type'],
      pickUpTime: json['borrow_time'],
      returnTime: json['return_time'],
      kioskLocation:json['k_location'],
      tokenUsed:json['token_used'],
      note:json['note'],
      requestStatus:json['l_status'],
      reqByAccountNo:json['aid'],
      createdAt:json['createdAt'],
      updatedAt:json['updatedAt'],
      examplePicUrl: 'assets/item_example/tsquare.jpg'
      
    );
   
}



DateTime sampleTime = DateTime.parse('2019-04-20 12:12:12');
File emptyFile;



// List<RequestObject> stationeryList = sortCategory('Stationery',requestList);
// List<RequestObject> clothingList = sortCategory('Clothing',requestList);
// List<RequestObject> sportEquipmentList = sortCategory('Sport Equipment',requestList);
// List<RequestObject> electronicsList = sortCategory('Electronics',requestList);
// List<RequestObject> booksList = sortCategory('Books',requestList);
// List<RequestObject> othersList = sortCategory('Others',requestList);

List<RequestObject> sortCategory(String category,List<RequestObject> item){ //sort Category
  List<RequestObject> sortedList = [];
  for(int i = 0 ;i<item.length;i++){
    if(item[i].itemCategory == category)
    sortedList.add(item[i]);
  }
  return sortedList;
}

List<ItemCard> convertToCard(List<RequestObject> item,AccountObject user){ //covert ItemObject to ItemCard
  List<ItemCard> cardList = [];
    for(int i = 0 ;i<item.length;i++){
      cardList.add(ItemCard(user,item[i]));
  }
  return cardList;
}}

class RequestList {
  final List<RequestObject> request_list;
  RequestList({
    this.request_list,
  });

  factory RequestList.fromJson(List <dynamic> parsedJson){
    List<RequestObject> request_list = new List<RequestObject>();
    request_list = parsedJson.map((i)=>RequestObject.fromJson(i)).toList();
    return new RequestList(
      request_list: request_list
    );
  }
}