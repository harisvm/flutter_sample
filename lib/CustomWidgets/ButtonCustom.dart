import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonCustom extends StatefulWidget {
  final String buttonText;
  final  VoidCallback onPressed;

  const ButtonCustom({Key key, this.buttonText,this.onPressed}) : super(key: key);

  @override
  _ButtonCustomState createState() => _ButtonCustomState();
}

class _ButtonCustomState extends State<ButtonCustom> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        color: Colors.cyan,
        shape: ContinuousRectangleBorder(
            side: BorderSide(color: Colors.deepOrange[900], width: 2),
            borderRadius: BorderRadius.circular(5.0)),
        child: Text(widget.buttonText),
      onPressed: widget.onPressed,

        );
  }
}
