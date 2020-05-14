import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldCustom extends StatefulWidget {

  final String hint;
  final TextEditingController controller;
  const TextFieldCustom({Key key, this.hint, this.controller}) : super(key: key);
  @override
  _TextFieldCustomState createState() => _TextFieldCustomState();
}



class _TextFieldCustomState extends State<TextFieldCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: TextField(
          controller: widget.controller,
          decoration: InputDecoration(
              border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.blue)),
              hintText: widget.hint),
        ),
      ),
    );
  }
}
