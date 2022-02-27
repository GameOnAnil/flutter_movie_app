import 'dart:convert';

class Movie {
  int id;
  String? title;
  String? posterPath;
  String? overview;
  Movie({required this.id, this.title, this.posterPath, this.overview});

  String get fullImageUrl300 => 'https://image.tmdb.org/t/p/w300$posterPath';
  String get fullImageUrl500 => 'https://image.tmdb.org/t/p/w780$posterPath';

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'poster_path': posterPath,
      'overview': overview,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id']?.toInt() ?? 0,
      title: map['title'],
      posterPath: map['poster_path'],
      overview: map['overview'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));
}
