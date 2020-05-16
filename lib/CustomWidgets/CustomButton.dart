import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final double height;
  final double width;
final Color color;
  const CustomButton(
      {Key key, this.onPressed, this.text, this.height, this.width, this.color})
      : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 15.0);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Material(

      elevation: 5,
      borderRadius: BorderRadius.circular(30.0),
      color: widget.color,
      child: MaterialButton(
        height: widget.height,
        minWidth: widget.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: widget.onPressed,
        child: Text(widget.text,
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    ));
  }
}
