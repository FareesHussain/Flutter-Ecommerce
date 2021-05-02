import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_store/constants/Endpoints.dart';
import 'package:mobile_store/constants/SharedPreferencesKeys.dart';
import 'package:mobile_store/api/LoginResponse.dart';
import 'package:mobile_store/widgets/AppBar.dart';
import 'package:mobile_store/widgets/InputWidgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  Login({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  State createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  bool toggle = true;
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  loginOrRegister() async {
    var client = http.Client();
    if(toggle) {
      // login
      String _email = emailController.text;
      String _pass = passwordController.text;
      LoginResponse? res;
      try {
        var uriResponse = await client.post(
          Uri.parse(Endpoints.baseurl + Endpoints.login_endpoint),
          body: "{'email': '$_email', 'password': '$_pass'}",
          headers: {"Content-Type": "application/json"}
        );
        if(uriResponse.statusCode == 200) {
          res = LoginResponse.fromJson(jsonDecode(uriResponse.body));
          if(res.successful) {
            final SharedPreferences _prefs = await prefs;
            _prefs.setInt(SharedPreferenecesKeys.customer_id_key, int.parse(res.data));
            Navigator.pushReplacementNamed(context, '/home');
          }
        }
        SnackBar snackBar = SnackBar(
          content: Text(res!.message),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } finally {
        client.close();
      }
    } else {
      // register
      Navigator.pushNamed(context, '/home');
    }
  }

  _getLoginOrRegister() {
    if(toggle) {
      return loginColumn();
    }
    else return registerColumn();
    }
  _getTitle() {
    if(toggle) {
      return "Login";
    } else {
      return "Register";
    }
  }
  loginColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CustomTextField(
          controller: emailController,
          iconData: Icons.mail,
          hintText: "Enter your Email address",
          labelText: "Enter Email ID",
        ),
        CustomPasswordField(
            controller: passwordController,
            hintText: "Enter your password containing only alphabets",
            labelText: "Enter password"
        ),
        TextButton(
          child: new Text(
            'Don\'t have a account? Register.',
            style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.red
            ),
          ),
          onPressed: _toggle,
        ),
      ],
    );
  }
  registerColumn() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
                filled: true,
                icon: const Icon(Icons.person),
                hintText: 'Enter your name.',
                border: OutlineInputBorder(),
                labelText: 'Enter name'
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
                filled: true,
                icon: const Icon(Icons.mail),
                hintText: 'Enter your Email address',
                border: OutlineInputBorder(),
                labelText: 'Enter Email'
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                filled: true,
                icon: const Icon(Icons.phone),
                hintText: 'Enter your Mobile Number',
                border: OutlineInputBorder(),
                labelText: 'Enter Mobile number'
            ),
          ),
        ),
        TextButton(
          child: new Text(
            'Already Registered? Login.',
            style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.red
            ),
          ),
          onPressed: _toggle,
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(_getTitle()),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             _getLoginOrRegister(),
              ElevatedButton(
                onPressed: (){
                  loginOrRegister();
                },
                child: Text('Submit')
              )
           ],
          ),
        )
      ),
    );
  }
}
