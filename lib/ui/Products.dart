// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:mobile_store/models/Mobile.dart';
import 'package:mobile_store/widgets/AppBar.dart';
import 'package:mobile_store/widgets/ProductCard.dart';

class Product extends StatefulWidget {
  Product({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State createState() => _ProductsPageState();
}

class _ProductsPageState extends State<Product> {

  Mobile product = Mobile(
    brand: "realme",
    id: 1,
    image: "https://rukminim1.flixcart.com/image/416/416/kmmcrrk0/mobile/5/w/u/8-pro-rmx3081-realme-original-imagfgpgcxyjufz3.jpeg?q=70",
    isSelected: true,
    name: "Real me 8 Pro",
    price: 18000
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(widget.title),
      body: ProductCard(product: product),
    );
  }
}