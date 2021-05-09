// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

RegisterResponse welcomeFromJson(String str) => RegisterResponse.fromJson(json.decode(str));

String welcomeToJson(RegisterResponse data) => json.encode(data.toJson());

class RegisterResponse {
  RegisterResponse({
    required this.successful,
    required this.message,
    required this.data,
  });

  bool successful;
  String message;
  String data;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => RegisterResponse(
    successful: json["successful"],
    message: json["message"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "successful": successful,
    "message": message,
    "data": data,
  };
}
