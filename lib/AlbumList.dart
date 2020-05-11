import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterapp/main.dart';

class AlbumList extends StatelessWidget {
  final List<Album> albumList;

  AlbumList({Key key, this.albumList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,mainAxisSpacing: 2,crossAxisSpacing: 2,childAspectRatio: .6
      ),
      itemCount: albumList.length,
      itemBuilder: (context, index) {
        return Container(
            color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            child: Text(
              albumList[index].title,
              style: TextStyle(color: Colors.white),
            ));
      },
    );

    throw UnimplementedError();
  }
}
