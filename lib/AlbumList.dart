import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterapp/main.dart';

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
          childAspectRatio: 2),
      itemCount: albumList.length,
      itemBuilder: (context, index) {
        return StatefulBuilder(
            builder: (context, setState) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = !selected;
                    });
                  },
              
                  child: Card(

                    child: Row(children: <Widget>[
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/loading.png',
                            image: albumList[index].url,fit: BoxFit.cover,
                          )),
                      Column(
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
                              ))
                        ],
                      ),
                    ]),
                  ),
                ));
      },
    );

    throw UnimplementedError();
  }
}
