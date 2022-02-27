import 'dart:convert';

class Cast {
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  double? popularity;
  String? profilePath;
  int? castId;
  String? character;
  String? creditId;
  int? order;
  Cast({
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
  });

  String get fullProfileW300 => 'https://image.tmdb.org/t/p/w300$profilePath';

  Map<String, dynamic> toMap() {
    return {
      'gender': gender,
      'id': id,
      'knownForDepartment': knownForDepartment,
      'name': name,
      'popularity': popularity,
      'profile_path': profilePath,
      'castId': castId,
      'character': character,
      'creditId': creditId,
      'order': order,
    };
  }

  factory Cast.fromMap(Map<String, dynamic> map) {
    return Cast(
      gender: map['gender']?.toInt(),
      id: map['id']?.toInt(),
      knownForDepartment: map['knownForDepartment'],
      name: map['name'],
      popularity: map['popularity']?.toDouble(),
      profilePath: map['profile_path'],
      castId: map['castId']?.toInt(),
      character: map['character'],
      creditId: map['creditId'],
      order: map['order']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Cast.fromJson(String source) => Cast.fromMap(json.decode(source));
}
