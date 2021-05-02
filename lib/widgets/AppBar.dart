import 'package:flutter/material.dart';

AppBar CustomAppBar(String title) {
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