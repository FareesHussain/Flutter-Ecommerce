// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:mobile_store/widgets/AppBar.dart';

class Product extends StatefulWidget {
  Product({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State createState() => _productsPageState();
}

class _productsPageState extends State<Product> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(widget.title),
      body: Center(
        child: Text('Hello World'),
      ),
    );
  }
}