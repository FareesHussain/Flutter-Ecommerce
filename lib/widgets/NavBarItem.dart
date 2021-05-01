import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

PersistentBottomNavBarItem CustomNavBarItem(String title, IconData iconData) {
  return PersistentBottomNavBarItem(
      icon: Icon(iconData),
      title: title,
      activeColorPrimary: Colors.teal,
      activeColorSecondary: Colors.tealAccent
  );
}