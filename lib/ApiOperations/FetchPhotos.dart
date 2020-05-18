import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../Models/Album.dart';

class FetchPhotos {
  Future<Welcome> fetchAlbum() async {
    final response = await http.get('https://picsum.photos/v2/list');
    print(response.body);
    if (response.statusCode == 200) {
      List<dynamic>res=json.decode(response.body);
      var a=Welcome.fromMap({'data':res});

      // If the server did return a 200 OK response,
      // then parse the JSON.

      return a;
  // return compute(parsePhotos, response.body);
      print(parsePhotos(response.body));
      //return parsePhotos(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}

FutureOr<List<Album>> parsePhotos(String message) {
  final parsed = jsonDecode(message).cast<Map<String, dynamic>>();
  return parsed.map<Album>((json) => Album.fromJson(json)).toList();
}
