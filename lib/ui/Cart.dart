// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:mobile_store/models/CartItem.dart';
import 'package:mobile_store/models/Mobile.dart';
import 'package:mobile_store/widgets/AppBar.dart';
import 'package:mobile_store/widgets/CartItemCard.dart';

class Cart extends StatefulWidget {
  Cart({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State createState() => _CartPageState();
}

class _CartPageState extends State<Cart> {

  bool loading = true;
  List<CartItemCard>? cardlist;

  @override
  void initState() {
    loading = true;
    getCardList();
  }

  void getCardList() async {
    // result = await networkrequest()
    // cardlist = result
    setState(() {
      loading = false;
    });
  }

  CartItem cartItem = CartItem(
    id: 1,
    mobile_name: "Real me 8 pro",
    price: 18000,
    image: "https://rukminim1.flixcart.com/image/416/416/kmmcrrk0/mobile/5/w/u/8-pro-rmx3081-realme-original-imagfgpgcxyjufz3.jpeg?q=70",
    quantity: 3
  );
  CartItem cartItem2 = CartItem(
    id: 2,
    mobile_name: "Iphone max pro",
    price: 1000000,
    image: "https://rukminim1.flixcart.com/image/416/416/kgiaykw0/mobile/g/k/e/apple-iphone-11-mhdf3hn-a-original-imafwqepatn3yzct.jpeg?q=70",
    quantity: 1
  );
  List<Widget> _getCartList() {
    List<Widget> _cartCardList = [];
    _cartCardList.add(CartItemCard(product: cartItem));
    _cartCardList.add(CartItemCard(product: cartItem2));
    _cartCardList.add(CartItemCard(product: cartItem));
    _cartCardList.add(CartItemCard(product: cartItem2));
    _cartCardList.add(CartItemCard(product: cartItem));
    return _cartCardList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(widget.title),
      body: Center(
        child: loading?CircularProgressIndicator():Column(
          children: [
            ListView(
              children: _getCartList(),
            ),
          ],
        )
      ),
    );
  }
}