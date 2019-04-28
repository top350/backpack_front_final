import 'package:http/http.dart' as http;

// import 'dart:io';
import 'dart:async';

class ApiProvider {
  ApiProvider();
  String endpoint = "http://192.168.1.77:3000";
  Future<http.Response> doLent(int aid, int rid) async {
    String _url = '$endpoint/acceptRequest';
    var body = {"aid": aid, "rid": rid};
    return http.post(_url, body: body);
  }
}
