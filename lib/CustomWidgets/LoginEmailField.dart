import 'package:flutter/material.dart';

class LoginEmailField extends StatefulWidget {
  final String hint;
  final bool isFieldVisible;

  const LoginEmailField({Key key, this.hint, this.isFieldVisible})
      : super(key: key);

  @override
  _LoginEmailFieldState createState() => _LoginEmailFieldState();
}

class _LoginEmailFieldState extends State<LoginEmailField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
      obscureText: widget.isFieldVisible,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: widget.hint,
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
  }
}
