import 'dart:convert';

class Album {
  final String author;
  final String id;
  final String url;

  Album({this.author, this.id, this.url});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      author: json['author'],
      id: json['id'],
      url: json['download_url'],
    );
  }

  @override
  String toString() {
    return 'Album{author: $author, id: $id, url: $url}';
  }

}

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);


Welcome welcomeFromJson(String str) => Welcome.fromMap(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toMap());

class Welcome {
  List<Datum> data;

  Welcome({
    this.data,
  });

  factory Welcome.fromMap(Map<String, dynamic> json) => Welcome(
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toMap())),
  };

  @override
  String toString() {
    return 'Welcome{data: $data}';
  }

}

class Datum {
  String id;
  String author;
  int width;
  int height;
  String url;
  String downloadUrl;

  Datum({
    this.id,
    this.author,
    this.width,
    this.height,
    this.url,
    this.downloadUrl,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["id"] == null ? null : json["id"],
    author: json["author"] == null ? null : json["author"],
    width: json["width"] == null ? null : json["width"],
    height: json["height"] == null ? null : json["height"],
    url: json["url"] == null ? null : json["url"],
    downloadUrl: json["download_url"] == null ? null : json["download_url"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "author": author == null ? null : author,
    "width": width == null ? null : width,
    "height": height == null ? null : height,
    "url": url == null ? null : url,
    "download_url": downloadUrl == null ? null : downloadUrl,
  };

  @override
  String toString() {
    return 'Datum{id: $id, author: $author, width: $width, height: $height, url: $url, downloadUrl: $downloadUrl}';
  }

}
