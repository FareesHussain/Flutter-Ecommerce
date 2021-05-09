import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_store/api/response/LoginResponse.dart';
import 'package:mobile_store/constants/Endpoints.dart';

Future<LoginResponse> loginRequest(String email, String pass) async {
  var client = http.Client();
  LoginResponse res = LoginResponse(successful: false, message: "Error", data: "null");
  try{
    var uriResponse = await client.post(
        Uri.parse(Endpoints.baseurl + Endpoints.login_endpoint),
        body: "{'email': '$email', 'password': '$pass'}",
        headers: {"Content-Type": "application/json"}
    );
    res = LoginResponse.fromJson(jsonDecode(uriResponse.body));
  } finally {
    client.close();
  }
  return res;
}
