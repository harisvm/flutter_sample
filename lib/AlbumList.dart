import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterapp/main.dart';

class AlbumList extends StatelessWidget {
  final List<Album> albumList;
  bool selected = false;

  AlbumList({Key key, this.albumList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          childAspectRatio: .6),
      itemCount: albumList.length,
      itemBuilder: (context, index) {
        return StatefulBuilder(
          builder: (context, setState) => GestureDetector(
              onTap: () {
                setState((){
                  selected = !selected;
                });
              },
              child: AnimatedContainer(
                  width: selected ? 200.0 : 100.0,
                  height: selected ? 100.0 : 200.0,
                  alignment: selected
                      ? Alignment.center
                      : AlignmentDirectional.topCenter,
                  duration: Duration(seconds: 2),
                  curve: Curves.fastOutSlowIn,
                  color: selected
                      ? Colors
                          .primaries[Random().nextInt(Colors.primaries.length)]
                      : Colors
                          .primaries[Random().nextInt(Colors.primaries.length)],
                  child: Text(
                    albumList[index].title,
                    style: TextStyle(color: Colors.white),
                  ))),
        );
      },
    );

    throw UnimplementedError();
  }
}
