// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

AllProducts welcomeFromJson(String str) => AllProducts.fromJson(json.decode(str));

String welcomeToJson(AllProducts data) => json.encode(data.toJson());

class AllProducts {
  AllProducts({
    required this.successful,
    required this.message,
    required this.data,
  });

  bool successful;
  String message;
  List<Datum> data;

  factory AllProducts.fromJson(Map<String, dynamic> json) => AllProducts(
    successful: json["successful"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "successful": successful,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.productId,
    required this.mobileName,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.thumbnailUrl,
    required this.brand,
  });

  int productId;
  String mobileName;
  String description;
  int price;
  String imageUrl;
  String thumbnailUrl;
  String brand;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    productId: json["product_id"],
    mobileName: json["mobile_name"],
    description: json["description"],
    price: json["price"],
    imageUrl: json["image_url"],
    thumbnailUrl: json["thumbnail_url"],
    brand: json["brand"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "mobile_name": mobileName,
    "description": description,
    "price": price,
    "image_url": imageUrl,
    "thumbnail_url": thumbnailUrl,
    "brand": brand,
  };
}
