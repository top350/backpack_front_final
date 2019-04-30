import 'dart:convert';

import 'package:http/http.dart' as http;

import 'dart:io';
import 'dart:async';

class ApiProvider {
  ApiProvider();
   String endpoint ="http://192.168.43.173:3000";
  Future<http.Response> doLogin(String id, String password) async {

 
    String _url = '$endpoint/login';
    var body = {"id": id, "password": password};
    print(id+ " " + password);
    print(body);
    return http.post(_url, body: body);
  }
  
   Future<http.Response> doSignup(String studentid,String firstname,String lastname, String password,String phoneNo,String email) async {
    String _url = '$endpoint/signup';
    var body = {"it_chula": studentid, "firstname":firstname ,"lastname":lastname ,"password": password,"tel_no":phoneNo,"email":email};
    return http.post(_url, body: body);
  }
   Future<http.Response> getSignup() async {
    String _url = '$endpoint/getsignup';
    
    return http.get(_url);
  }

  Future<http.Response> doCategory(String categoryname){
    String _url = '$endpoint/homepage';
    var body = {"item_type":categoryname};
    return http.post(_url, body:body);
  }
  Future<http.Response> fetchPost() {
     String _url = '$endpoint/signup';
  return http.get(_url);
}
Future<http.Response> doBorrow(
  String itemName ,
  String _selectedCategory,
  String pickupTime,
 String returnTime,
  String _selectedKiosk ,
  String token,
  String note , 
  String aid,
) async {
    String _url = '$endpoint/borrowRequest';
    var body = {"item_name": itemName, "item_type":_selectedCategory ,"borrow_time":pickupTime ,"return_time": returnTime,"k_location":_selectedKiosk,"token_used":token,"note":note,"aid":aid};
    return http.post(_url, body: body);
  }
  Future<http.Response> doRequestitem(String rid){
    String _url = '$endpoint/requestPage';
    var body = {"rid":rid};
    return http.post(_url, body:body);
  }
   Future<http.Response> doLent(String rid,String aid){
    String _url = '$endpoint/acceptRequest';
    var body = {"rid":rid,"aid":aid};
    return http.post(_url, body:body);
  }
    Future<http.Response> doBottombar(String aid){
    String _url = '$endpoint/profile';
    var body = {"aid":aid};
    return http.post(_url, body:body);
  }
   Future<http.Response> doeditProfile(String aid,String firstname,String lastname,String phoneNo,String email ){
    String _url = '$endpoint/requestPage';
    var body = {"aid":aid,"firstname":firstname ,"lastname":lastname ,"tel_no":phoneNo,"email":email};
    return http.post(_url, body:body);
  }
    Future<http.Response> doAccountsession(String aid){
    String _url = '$endpoint/requestPage';
    var body = {"aid":aid};
    return http.post(_url, body:body);
  }
     Future<http.Response> doEndsession(String sid){
    String _url = '$endpoint/requestPage';
    var body = {"sid":sid};
    return http.post(_url, body:body);
  }
   Future<http.Response> doScan(String sid){
    String _url = '$endpoint/requestPage';
    var body = {"sid":sid};
    return http.post(_url, body:body);
  }
   Future<http.Response> doFeedback(String feedbackNo,String comment,String aid,String sid){
    String _url = '$endpoint/requestPage';
    var body = {"feedbackNo":feedbackNo,"comment":comment,"aid":aid,"sid":sid};
    return http.post(_url, body:body);
  }

}
