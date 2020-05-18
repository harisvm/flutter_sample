import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/ApiOperations/FetchPhotos.dart';
import 'package:flutterapp/Lists/AlbumList.dart';
import 'package:flutterapp/Models/Album.dart';


class LauncherScreen extends StatefulWidget {
  @override
  _LauncherScreenState createState() => _LauncherScreenState();
}

class _LauncherScreenState extends State<LauncherScreen> {
  Future<Welcome> futureAlbum;

  @override
  void initState() {

    
//    futureAlbum = FetchPhotos().fetchAlbum as Future<List<Album>> ;
    futureAlbum = FetchPhotos().fetchAlbum();
    /* FetchPhotos().fetchAlbum().then((value) {
      var a=value;
      print('value');
      print(value);
    });
*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
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
            child: FutureBuilder<Welcome>(
              future: futureAlbum,
              builder: (context, snapshot) {
                print('snapshot.data----------');
                print(snapshot.data);

                if (snapshot.hasData) {
                  print('snapshot.data.data');
                  print(snapshot.data);

                  return  AlbumList(albumList: snapshot.data);

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
