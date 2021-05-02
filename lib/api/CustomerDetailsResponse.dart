// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

CustomerDetailsResponse welcomeFromJson(String str) => CustomerDetailsResponse.fromJson(json.decode(str));

String welcomeToJson(CustomerDetailsResponse data) => json.encode(data.toJson());

class CustomerDetailsResponse {
  CustomerDetailsResponse({
    required this.successful,
    required this.message,
    required this.data,
  });

  bool successful;
  String message;
  Data data;

  factory CustomerDetailsResponse.fromJson(Map<String, dynamic> json) => CustomerDetailsResponse(
    successful: json["successful"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "successful": successful,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.customerId,
    required this.name,
    required this.email,
    required this.password,
    required this.address,
  });

  int customerId;
  String name;
  String email;
  String password;
  String address;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    customerId: json["customer_id"],
    name: json["name"],
    email: json["email"],
    password: json["password"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "customer_id": customerId,
    "name": name,
    "email": email,
    "password": password,
    "address": address,
  };
}
