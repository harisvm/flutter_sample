import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/flutter_app/lib/Lists/AlbumList.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/flutter_app/lib/Containers/Cart.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/flutter_app/lib/Screens/LauncherScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Models/Album.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Fetch Data From Api ',
        //  initialRoute: '/',
        routes: <String, WidgetBuilder>{
          // When navigating to the "/" route, build the FirstScreen widget.
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/second': (BuildContext context) => Cart(),
        },
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
          body: LauncherScreen(),
        ));
  }
}
