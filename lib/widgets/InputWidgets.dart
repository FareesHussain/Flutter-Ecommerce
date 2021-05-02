import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData iconData;
  const CustomTextField(
      {Key? key,
        required this.hintText,
        required this.labelText,
        required this.iconData
      })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
              filled: true,
              icon: Icon(iconData),
              hintText: hintText,
              border: OutlineInputBorder(),
              labelText: labelText
          ),
        ),
      );
  }
}

class CustomPasswordField extends StatefulWidget {
  final String hintText;
  final String labelText;
  CustomPasswordField(
      {Key? key,
        required this.hintText,
        required this.labelText,
      })
      : super(key: key);

  @override
  State createState() => _PasswordState();
}

class _PasswordState extends State<CustomPasswordField> {

  bool _obscureText = true ;
  bool ObscureText() {
    return _obscureText;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _obscureText = true;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: ObscureText(),
        textInputAction: TextInputAction.next,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
            filled: true,
            icon: Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: Icon(
                  ObscureText()?Icons.visibility_off:Icons.visibility,
                  color: Theme.of(context).primaryColorDark
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            hintText: widget.hintText,
            border: OutlineInputBorder(),
            labelText: widget.labelText
        ),
      ),
    );
  }
}