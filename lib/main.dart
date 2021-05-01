import 'package:flutter/material.dart';
import 'package:mobile_store/ui/Cart.dart';
import 'package:mobile_store/ui/Login.dart';
import 'package:mobile_store/ui/MainMenu.dart';
import 'package:mobile_store/ui/Orders.dart';
import 'package:mobile_store/ui/Products.dart';
import 'package:mobile_store/ui/Profile.dart';
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
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _startApp() {
    // TODO: "Check if the user is already logged in"
    Navigator.of(context).pushReplacementNamed('/home');
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
