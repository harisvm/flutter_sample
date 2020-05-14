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
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: Card(
              color: Colors.greenAccent,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(150, 10, 10, 0),
                      child: Text(
                        'Address',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    FlatButton(
                      onPressed:(){

                        
                      },
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'Change',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 10, 0),
                      child: Text(
                        '',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ]),
            ),
          ),
          SizedBox(
            height: 200,
            width: 400,
            child: Card(
              color: Colors.white70,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(150, 10, 10, 0),
                      child: Text(
                        'Summary',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 10, 0),
                      child: Text(
                        'Subtotal :',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 10, 0),
                      child: Text(
                        'Delivery Cost :',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 10, 0),
                      child: Text(
                        'Discount :',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 15, 10, 0),
                      child: Text(
                        'Total :',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.green),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ]),
            ),
          ),
        ]));
  }
}
