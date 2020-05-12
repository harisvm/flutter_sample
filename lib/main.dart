import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/AlbumList.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;


Future<List<Album>> fetchAlbum() async {
  final response = await http.get('https://picsum.photos/v2/list');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    return compute(parsePhotos, response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final String author;
  final String id;
  final String url;

  Album({this.author, this.id, this.url});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      author: json['author'],
      id: json['id'],
      url: json['download_url'],
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<List<Album>> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data From Api ',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text("Menu"),
                decoration: BoxDecoration(color: Colors.blueAccent),
              ),
              ListTile(
                title: Text("Item 1"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Item 1"),
                onTap: () {},
              )
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text('Groceries'),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: (){
                  Fluttertoast.showToast(msg: "Cart clicked",toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 15.0
                  );
                }  )

          ],
        ),
        body: Center(
          child: SafeArea(
            child: FutureBuilder<List<Album>>(
              future: futureAlbum,
              builder: (context, snapshot) {
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
      ),
    );
  }
}

FutureOr<List<Album>> parsePhotos(String message) {
  final parsed = jsonDecode(message).cast<Map<String, dynamic>>();

  return parsed.map<Album>((json) => Album.fromJson(json)).toList();
}
