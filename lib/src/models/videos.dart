// To parse this JSON data, do
//
//     final categorys = categorysFromMap(jsonString);

import 'dart:convert';

class VideoModel {
  VideoModel({
    this.id,
    required this.image,
    required this.name,
    required this.link,
  });

  String? id;
  String image;
  String name;
  String link;

  VideoModel copyWith({
    String? id,
    String? image,
    String? name,
    String? link,
  }) =>
      VideoModel(
        id: id ?? this.id,
        image: image ?? this.image,
        name: name ?? this.name,
        link: link ?? this.link,
      );

  factory VideoModel.fromJson(String str) =>
      VideoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VideoModel.fromMap(Map<String, dynamic> json) => VideoModel(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        link: json["link"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "image": image,
        "name": name,
        "link": link,
      };
}
