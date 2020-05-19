import 'package:flutter/material.dart';
import 'package:flutterapp/ApiOperations/FetchPhotos.dart';
import 'package:flutterapp/Lists/AlbumList.dart';
import 'package:flutterapp/Models/Album.dart';

class OrderHistoryScreen extends StatefulWidget {
  @override
  _OrderHistoryScreenState createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  Future<Welcome> futureAlbum;

  @override
  void initState() {
    futureAlbum = FetchPhotos().fetchAlbum();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: FutureBuilder<Welcome>(
          future: futureAlbum,
          builder: (context, snapshot) {
            print(snapshot.data);
            if (snapshot.hasData ) {
              return snapshot.hasData
                  ? AlbumList(albumList: snapshot.data)
                  : Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // Bye default, show a loading spinner.

            return Center(child: CircularProgressIndicator());
          },
        ),
        left: true,
      ),
    );
  }
}
