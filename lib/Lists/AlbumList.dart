import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/flutter_app/lib/Containers/main.dart';

import '../Models/Album.dart';

// ignore: must_be_immutable
class AlbumList extends StatelessWidget {
  final List<Album> albumList;
  bool selected = false;

  AlbumList({Key key, this.albumList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: albumList.length,
      itemBuilder: (context, index) {
        return Container(
            child: SizedBox(
          width: 150,
          height: 150,
          child: GestureDetector(
            onTap: () {
              selected = true;
            },
            child: Card(
              borderOnForeground: true,
              shape: RoundedRectangleBorder(
                  side: new BorderSide(color: Colors.blueGrey, width: 2.0),
                  borderRadius: BorderRadius.circular(4.0)),
              child: Row(children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        bottomLeft: Radius.circular(4)),
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
                        padding: EdgeInsets.only(
                            left: 5

                            , right: 25.0, top: 25.0),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new Text(
                                  'Item',
                                  style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        )),

                    Padding(
                        padding: EdgeInsets.only(
                            left: 5, right: 25.0, top: 5.0,bottom: 5),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new Text(
                                  'Description',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 10, 5),
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
