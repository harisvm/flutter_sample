import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/flutter_app/lib/ApiOperations/FetchPhotos.dart';
import 'package:http/http.dart' as http;
import '../Models/Album.dart';
import '../Lists/AlbumList.dart';

class LauncherScreen extends StatefulWidget {
  @override
  _LauncherScreenState createState() => _LauncherScreenState();
}

class _LauncherScreenState extends State<LauncherScreen> {
  Future<List<Album>> futureAlbum;

  @override
  void initState() {
    futureAlbum = FetchPhotos().fetchAlbum() as Future<List<Album>>;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: Text("Home"),
            backgroundColor: Colors.blueAccent),
        BottomNavigationBarItem(
            icon: new Icon(Icons.settings), title: Text("Profile")),
        BottomNavigationBarItem(
            icon: new Icon(Icons.search), title: Text("Search"))
      ]),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Groceries'),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              })
        ],
      ),
      body: Center(
        child: SafeArea(
          child: FutureBuilder<List<Album>>(
            future: futureAlbum,
            builder: (context, snapshot) {
              print(snapshot.data);
              if (snapshot.hasData) {
                return snapshot.hasData
                    ? AlbumList(albumList: snapshot.data)
                    : Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
          left: true,
        ),
      ),
    );
  }
}
