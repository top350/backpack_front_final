import 'dart:convert';

import 'package:http/http.dart' as http;

import 'dart:io';
import 'dart:async';

class ApiProvider {
  ApiProvider();
  String endpoint = "http://192.168.137.1:3000";
  Future<http.Response> doLogin(String username, String password) async {
    String _url = '$endpoint/login';
    var body = {"username": username, "password": password};
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
    String _url = '$endpoint/requestPage';
    var body = {"categoryname":categoryname};
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
) async {
    String _url = '$endpoint/borrow';
    var body = {"itemname": itemName, "category":_selectedCategory ,"pickupTime":pickupTime ,"returnTime": returnTime,"Kiosk":_selectedKiosk,"token":token,"note":note};
    return http.post(_url, body: body);
  }
}