import 'package:flutter/material.dart';
import 'package:flutterapp/Screens/CartScreen.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/flutter_app/lib/Lists/AlbumList.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/flutter_app/lib/Screens/LauncherScreen.dart';

import '../Models/Album.dart';
import '../ApiOperations/FetchPhotos.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  Future<List<Album>> futureAlbum;

  @override
  void initState() {
    futureAlbum = FetchPhotos().fetchAlbum();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cart',
      home: Scaffold(
        body: CartScreen(),
    ));


  }
}
