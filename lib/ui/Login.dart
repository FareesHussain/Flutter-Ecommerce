import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);

  final String title;
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
  loginColumn() {
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
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
            textInputAction: TextInputAction.done,
            textCapitalization: TextCapitalization.words,
            obscureText: true,
            decoration: InputDecoration(
                filled: true,
                icon: const Icon(Icons.keyboard_rounded),
                hintText: 'Enter your password containing only alphabets',
                border: OutlineInputBorder(),
                labelText: 'Enter password'
            ),
          ),
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
    Column(
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: PasswordField(
            hasFloatingPlaceholder: true,
            pattern: r'.*[@$#.*].*',
            border: OutlineInputBorder(
                borderSide: BorderSide(width: 2)),
            errorMessage: 'must contain special character either . * @ # \$',
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
      appBar: AppBar(
        title: Text(widget.title)
      ),
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
