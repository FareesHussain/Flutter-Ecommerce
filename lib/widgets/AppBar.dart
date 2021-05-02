import 'package:flutter/material.dart';

AppBar customAppBar(String title) {
  return AppBar(
    title: Text(
      title.toUpperCase(),
      style: TextStyle(
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
        color: Colors.white60
      ),
    ),
    centerTitle: true,
  );
}