import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Containers/Address.dart';
import 'package:flutterapp/Containers/FirstPage.dart';

import 'package:flutterapp/Containers/OrderHistory.dart';
import 'package:flutterapp/Containers/Splash.dart';
import 'package:flutterapp/Screens/CartScreen.dart';
import 'package:flutterapp/Screens/ProfileScreen.dart';
import 'Login.dart';
import 'Profile.dart';
import 'Register.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/flutter_app/lib/Containers/Cart.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/flutter_app/lib/Screens/LauncherScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//FirstPage _firstPage;
  Widget defaultLauncher = SplashScreen();

  //Widget defaultLauncher=LauncherScreen();
  //Widget defaultLauncher=Lau7();

  @override
  void initState() {
    //_firstPage = new FirstPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Fetch Data From Api ',
        //  initialRoute: '/',

        routes: <String, WidgetBuilder>{
          // When navigating to the "/" route, build the FirstScreen widget.
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/launcher': (BuildContext context) => MyApp(),

          '/second': (BuildContext context) => Cart(),
          '/address': (BuildContext context) => Address(),
          '/cart': (BuildContext context) => CartScreen(),
          '/login': (BuildContext context) => Login(),
          '/register': (BuildContext context) => Register(),
          '/profile': (BuildContext context) => Profile(),
          '/order': (BuildContext context) => OrderHistory(),
          '/firstPage': (BuildContext context) => FirstPage(),
        },
        theme: ThemeData(
//          primaryColor: Colors.amber,
            primaryColor: Color(0xff00BC9C),
            primarySwatch: Colors.green,
            backgroundColor: Colors.black),
        home: Scaffold(
          body: defaultLauncher,
        ));
  }
}
