import 'package:http/http.dart' as http;

// import 'dart:io';
import 'dart:async';

class ApiProvider {
  ApiProvider();
  String endpoint = "http://192.168.1.77:3000";
  Future<http.Response> doLogin(String username, String password) async {
    String _url = '$endpoint/login';
    var body = {"id": username, "password": password};
    return http.post(_url, body: body);
  }
}
