import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_store/api/response/RegisterResponse.dart';
import 'package:mobile_store/constants/Endpoints.dart';

Future<RegisterResponse> registerRequest(String email, String pass, String name, String address) async {
  var client = http.Client();
  RegisterResponse res = RegisterResponse(successful: false, message: "Error", data: "0");
  try{
    var uriResponse = await client.post(
        Uri.parse(Endpoints.baseurl + Endpoints.register_endpoint),
        body: "{'email': '$email', 'password': '$pass', 'name': '$name', 'address': '$address'}",
        headers: {"Content-Type": "application/json"}
    );
    res = RegisterResponse.fromJson(jsonDecode(uriResponse.body));
  } finally {
    client.close();
  }
  return res;
}
