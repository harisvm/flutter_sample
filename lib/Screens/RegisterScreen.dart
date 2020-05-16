import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                LoginEmailField(hint: 'Email'),
                SizedBox(height: 25.0),
                LoginEmailField(hint: 'Password'),
                SizedBox(
                  height: 35.0,
                ),
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(30.0),
                  color: Color(0xff01A0C7),
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    onPressed: () {
                      Navigator.pushNamed(context, '/launcher');
                    },
                    child: Text("Create Account ",
                        textAlign: TextAlign.center,
                        style: style.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
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
