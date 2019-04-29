import 'dart:convert';

import 'package:http/http.dart' as http;

import 'dart:io';
import 'dart:async';

class ApiProvider {
  ApiProvider();
  String endpoint = "http://192.168.43.173:3000";
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
  String aid,
) async {
    String _url = '$endpoint/borrowRequest';
    var body = {"item_name": itemName, "item_type":_selectedCategory ,"borrow_time":pickupTime ,"return_time": returnTime,"k_location":_selectedKiosk,"token_used":token,"note":note,"aid":aid};
    return http.post(_url, body: body);
  }
}