import 'dart:convert';

LoginResponse welcomeFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String welcomeToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.successful,
    required this.message,
    required this.data,
  });

  bool successful;
  String message;
  String data;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
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
