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
            if (snapshot.hasData && snapshot.data.data.length <= 2) {
              return snapshot.hasData
                  ? AlbumList(albumList: snapshot.data)
                  : Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.data.data.length == 2) {
              return AlbumList(albumList: snapshot.data);
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
