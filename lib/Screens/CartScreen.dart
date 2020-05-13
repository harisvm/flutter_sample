import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/ApiOperations/FetchPhotos.dart';
import 'package:flutterapp/Lists/AlbumList.dart';
import 'package:flutterapp/Models/Album.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Future<List<Album>> futureAlbum;

  @override
  void initState() {
    futureAlbum = FetchPhotos().fetchAlbum();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text('Cart'),
          actions: <Widget>[
            IconButton(
                icon: Badge(
                  badgeContent: Text('1'),
                  showBadge: true,
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {})
          ],
        ),
        body: Column(children: <Widget>[
          SafeArea(
            child: FutureBuilder<List<Album>>(
              future: futureAlbum,
              builder: (context, snapshot) {
                print(snapshot.data);
                if (snapshot.hasData) {
                  return snapshot.hasData
                      ? AlbumList(albumList: snapshot.data.sublist(0, 2))
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
          SizedBox(
            height: 200,
            width: 400,
            child: Padding(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Card(
                  color: Colors.white70,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(150, 10, 20, 0),
                    child: Text(
                      'Summary',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                )),
          ),
        ]));
  }
}
