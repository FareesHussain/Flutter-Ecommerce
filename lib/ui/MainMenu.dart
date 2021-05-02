import 'package:flutter/material.dart';
import 'package:mobile_store/ui/Cart.dart';
import 'package:mobile_store/ui/Products.dart';
import 'package:mobile_store/ui/Profile.dart';
import 'package:mobile_store/widgets/NavBarItem.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'Orders.dart';

class MainMenu extends StatefulWidget {
  MainMenu({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenu> {

  PersistentTabController? _controller;

  List<Widget> _buildScreens() {
    return [
      Product(title: "Mobiles"),
      Cart(title: "Shopping Cart"),
      Orders(title: "Orders"),
      Profile(title: "Shopping Cart"),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      customNavBarItem("Mobiles", Icons.store_mall_directory_outlined),
      customNavBarItem("Cart", Icons.shopping_cart_outlined),
      customNavBarItem("Orders", Icons.history_outlined),
      customNavBarItem("Profile", Icons.person_outlined),
    ];
  }

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('This is a Drawer')
            ],
          ),
        ),
      ),
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarItems(),
        navBarStyle: NavBarStyle.style10,
      ),
    );
  }
}

