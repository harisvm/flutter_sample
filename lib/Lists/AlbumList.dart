import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import '../Models/Album.dart';

// ignore: must_be_immutable
class AlbumList extends StatelessWidget {
  final Welcome albumList;
  bool selected = false;

  AlbumList({Key key, this.albumList}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      shrinkWrap: true,
      itemCount: albumList?.data?.length,
      itemBuilder: (context, index) {
        return Container(
            child: SizedBox(
                width: 150,
                height: 140,
                child: GestureDetector(
                  onTap: () {
                    selected = true;
                  },
                  child: Card(
                    borderOnForeground: true,
                    shape: RoundedRectangleBorder(
                        side:
                            new BorderSide(color: Colors.blueGrey, width: 2.0),
                        borderRadius: BorderRadius.circular(6.0)),
                    child: Row(children: <Widget>[
                      ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(6),
                              bottomLeft: Radius.circular(6),
                              bottomRight: Radius.circular(6),
                              topRight: Radius.circular(6)),
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/loading.png',
                            width: 150,
                            height: 150,
                            image: albumList?.data[index]?.downloadUrl,
                            fit: BoxFit.cover,
                          )),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 5, right: 25.0, top: 10.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Text(
                                          'Item',
                                          style: TextStyle(
                                              fontSize: 19.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 5, right: 25.0, top: 5.0, bottom: 5),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                              padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                              child: IconTheme(
                                  data: IconThemeData(color: Colors.red),
                                  child: Icon(Icons.star)),
                            ),
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 0, 10, 0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(
                                            width: 2, color: Colors.black)),
                                    child: IconTheme(
                                        data:
                                            IconThemeData(color: Colors.green),
                                        child: Icon(
                                          Icons.remove,
                                        )),
                                  ),
                                ),
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                    child: Text(
                                      '0',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 0, 10, 0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(
                                            width: 2, color: Colors.black)),
                                    child: IconTheme(
                                        data:
                                            IconThemeData(color: Colors.green),
                                        child: Icon(
                                          Icons.add,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    ]),
                  ),
                )));
      },
    );

    throw UnimplementedError();
  }
}
