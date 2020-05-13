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
}
