import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/flutter_app/lib/Containers/main.dart';

import '../Models/Album.dart';

// ignore: must_be_immutable
class AlbumList extends StatelessWidget {
  final List<Album> albumList;
  bool selected = false;

  AlbumList({Key key, this.albumList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 8,
        childAspectRatio: 3,
      ),
      itemCount: albumList.length,
      itemBuilder: (context, index) {
        return StatefulBuilder(
            builder: (context, setState) => GestureDetector(
                  onTap: () {
                    print(albumList[index].author);
                    setState(() {
                      selected = !selected;
                    });
                  },
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Card(
                      child: Row(children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/loading.png',
                              width: 150,
                              height: 150,
                              image: albumList[index].url,
                              fit: BoxFit.cover,
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 20, 10, 5),
                              child: Text(
                                'Item',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.fromLTRB(5, 0, 10, 5),
                                child: Text(
                                  'Description',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15),
                                )),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 5),
                              child: IconTheme(
                                  data: IconThemeData(color: Colors.red),
                                  child: Icon(Icons.star)),
                            )
                          ],
                        ),
                      ]),
                    ),
                  ),
                ));
      },
    );

    throw UnimplementedError();
  }
}
