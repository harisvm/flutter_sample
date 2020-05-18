import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Screens/AddressScreen.dart';
import 'package:flutterapp/Screens/CartScreen.dart';
import 'Address.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/flutter_app/lib/Lists/AlbumList.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/flutter_app/lib/Screens/LauncherScreen.dart';

import '../Models/Album.dart';
import '../ApiOperations/FetchPhotos.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  // Future<List<Album>> futureAlbum;
  Welcome futureAlbum=Welcome();

  @override
  void initState() {
     FetchPhotos().fetchAlbum().then((value) {
       futureAlbum =value;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        actions: <Widget>[
          IconButton(
              icon: Badge(
                badgeContent: Text('1'),
                badgeColor: Colors.green,
                showBadge: true,
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              ),
              onPressed: () {})
        ],
      ),
      body: CartScreen(),
    );
  }
}
