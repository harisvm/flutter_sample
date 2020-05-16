import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomEditIcon extends StatefulWidget {
  final GestureTapCallback onPressed;

  const CustomEditIcon({Key key, this.onPressed}) : super(key: key);

  @override
  _CustomEditIconState createState() => _CustomEditIconState();
}

class _CustomEditIconState extends State<CustomEditIcon> {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: widget.onPressed,
    );
    ;
  }
}
