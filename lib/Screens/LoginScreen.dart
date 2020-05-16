
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/CustomWidgets/ButtonCustom.dart';
import 'package:flutterapp/CustomWidgets/CustomButton.dart';
import 'package:flutterapp/CustomWidgets/LoginEmailField.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
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
                  LoginEmailField(
                    hint: 'Email',
                    isFieldVisible: false,
                  ),
                  SizedBox(height: 25.0),
                  LoginEmailField(hint: 'Password',isFieldVisible: true,),
                  SizedBox(
                    height: 35.0,
                  ),
                  CustomButton(
                    text: 'Login',
                    width: 200,
                    onPressed: () {
                      Navigator.pushNamed(context, '/launcher');
                    },
                  ),
                  FlatButton(
                    child: Text(
                      'Need a new Account ?',
                      style: TextStyle(color: Colors.black54),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
