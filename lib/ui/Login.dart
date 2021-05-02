import 'package:flutter/material.dart';
import 'package:mobile_store/widgets/AppBar.dart';
import 'package:mobile_store/widgets/InputWidgets.dart';

class Login extends StatefulWidget {
  Login({Key? key, this.title}) : super(key: key);

  final String? title;
  @override
  State createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {

  bool toggle = true;

  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  void loginOrRegister() {
    if(toggle) {
      // login

    } else {
      // register
    }
    Navigator.pushNamed(context, '/home');
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
          iconData: Icons.mail,
          hintText: "Enter your Email address",
          labelText: "Enter Email ID",
        ),
        CustomPasswordField(
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
              ElevatedButton(onPressed: loginOrRegister, child: Text('Submit'))
           ],
          ),
        )
      ),
    );
  }
}
