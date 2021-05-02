import 'package:flutter/material.dart';
import 'package:mobile_store/constants/SharedPreferencesKeys.dart';
import 'package:mobile_store/ui/Cart.dart';
import 'package:mobile_store/ui/Login.dart';
import 'package:mobile_store/ui/MainMenu.dart';
import 'package:mobile_store/ui/Orders.dart';
import 'package:mobile_store/ui/ProductDetail.dart';
import 'package:mobile_store/ui/Products.dart';
import 'package:mobile_store/ui/Profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:mobile_store/ui/MainMenu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'K Mobile Store',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: <String, WidgetBuilder> {
        '/home': (BuildContext context) => MainMenu(title: 'K - Mobile'),
        '/login': (BuildContext context) => Login(title: 'Login or Register'),
        '/products': (BuildContext context) => Product(title: 'Mobiles'),
        '/cart': (BuildContext context) => Cart(title: 'Shopping Cart'),
        '/orders': (BuildContext context) => Orders(title: 'Your orders'),
        '/profile': (BuildContext context) => Profile(title: 'Profile'),
        '/detail': (BuildContext context) => ProductDetail(title: 'Mobile'),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> _startApp() async {
    // TODO: "Check if the user is already logged in"
    final SharedPreferences prefs = await _prefs;
    final int? customerId = prefs.getInt(SharedPreferenecesKeys.customer_id_key);
    if(customerId == null) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Login(title: "login",)));
    } else {
      Navigator.of(context).pushReplacementNamed('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to K-Mobile',
              textScaleFactor: 2,
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Image(
              image: AssetImage('assets/kmobile.png'),
              height: 85,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _startApp,
        child: Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}
