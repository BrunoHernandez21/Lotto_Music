// To parse this JSON data, do
//
//     final categorys = categorysFromMap(jsonString);

import 'dart:convert';

class Video_Model {
  Video_Model({
    this.id,
    required this.image,
    required this.name,
    required this.link,
  });

  String? id;
  String image;
  String name;
  String link;

  Video_Model copyWith({
    String? id,
    String? image,
    String? name,
    String? link,
  }) =>
      Video_Model(
        id: id ?? this.id,
        image: image ?? this.image,
        name: name ?? this.name,
        link: link ?? this.link,
      );

  factory Video_Model.fromJson(String str) =>
      Video_Model.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Video_Model.fromMap(Map<String, dynamic> json) => Video_Model(
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
