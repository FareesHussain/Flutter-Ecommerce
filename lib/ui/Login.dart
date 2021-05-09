import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_store/api/requests/LoginRequest.dart';
import 'package:mobile_store/api/requests/RegisterRequest.dart';
import 'package:mobile_store/api/response/RegisterResponse.dart';
import 'package:mobile_store/constants/Endpoints.dart';
import 'package:mobile_store/constants/SharedPreferencesKeys.dart';
import 'package:mobile_store/api/response/LoginResponse.dart';
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
  TextEditingController nameController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();

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
    String _email = emailController.text;
    String _pass = passwordController.text;
    String _name = nameController.text;
    String _address = addressController.text;

    if(toggle) {
      // login
      LoginResponse res;
      res = await loginRequest(_email, _pass);
      SnackBar snackBar = SnackBar(
        content: Text(res.message),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      if(res.successful){
        final SharedPreferences _prefs = await prefs;
        _prefs.setInt(SharedPreferenecesKeys.customer_id_key, int.parse(res.data));
        Navigator.pushReplacementNamed(context, '/home');
      }
    } else {
      // register
      RegisterResponse res;
      res = await registerRequest(_email, _pass, _name, _address);
      SnackBar snackBar = SnackBar(
        content: Text(res.message),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      if(res.successful){
        final SharedPreferences _prefs = await prefs;
        _prefs.setInt(SharedPreferenecesKeys.customer_id_key, int.parse(res.data));
        setState(() {
          _toggle();
        });
      }
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
        CustomTextField(
          controller: nameController,
          iconData: Icons.person,
          hintText: "Enter your name",
          labelText: "Enter name",
        ),
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
        CustomTextField(
          controller: addressController,
          iconData: Icons.map,
          hintText: "Enter your Address",
          labelText: "Enter Address",
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
