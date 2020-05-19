import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/CustomWidgets/CustomButton.dart';
import 'package:flutterapp/CustomWidgets/LoginEmailField.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<RegisterScreen> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 155.0,
                  child: Image.asset(
                    "assets/grocerries.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 45.0),
                LoginEmailField(hint: 'Email',isFieldVisible: true,),
                SizedBox(height: 25.0),
                LoginEmailField(hint: 'Password',isFieldVisible: false,),
                SizedBox(
                  height: 35.0,
                ),
              CustomButton(
                text: 'Create Account',
                color: Color(0xff00BC9C),
                onPressed: () {
                  Navigator.pushNamed(context, '/launcher');
                },
              ),
                FlatButton(
                  child: Text(
                    'Already have an  Account ?',
                    style: TextStyle(color: Colors.black54),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
