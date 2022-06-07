// To parse this JSON data, do
//
//     final categorys = categorysFromMap(jsonString);

import 'dart:convert';

class Categorys {
  Categorys({
    this.id,
    this.code,
    this.name,
    this.parent,
    this.slug,
    this.dateAdded,
    this.lastModified,
    this.fontAwesomeClass,
    this.thumbnail,
    this.subCategories,
  });

  String? id;
  String? code;
  String? name;
  String? parent;
  String? slug;
  String? dateAdded;
  dynamic? lastModified;
  String? fontAwesomeClass;
  String? thumbnail;
  List<Categorys>? subCategories;

  Categorys copyWith({
    String? id,
    String? code,
    String? name,
    String? parent,
    String? slug,
    String? dateAdded,
    dynamic? lastModified,
    String? fontAwesomeClass,
    String? thumbnail,
    List<Categorys>? subCategories,
  }) =>
      Categorys(
        id: id ?? this.id,
        code: code ?? this.code,
        name: name ?? this.name,
        parent: parent ?? this.parent,
        slug: slug ?? this.slug,
        dateAdded: dateAdded ?? this.dateAdded,
        lastModified: lastModified ?? this.lastModified,
        fontAwesomeClass: fontAwesomeClass ?? this.fontAwesomeClass,
        thumbnail: thumbnail ?? this.thumbnail,
        subCategories: subCategories ?? this.subCategories,
      );

  factory Categorys.fromJson(String str) => Categorys.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Categorys.fromMap(Map<String, dynamic> json) => Categorys(
        id: json["id"],
        code: json["code"],
        name: json["name"],
        parent: json["parent"],
        slug: json["slug"],
        dateAdded: json["date_added"],
        lastModified: json["last_modified"],
        fontAwesomeClass: json["font_awesome_class"] == null
            ? null
            : json["font_awesome_class"],
        thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
        subCategories: json["sub_categories"] == null
            ? null
            : List<Categorys>.from(
                json["sub_categories"].map((x) => Categorys.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "code": code,
        "name": name,
        "parent": parent,
        "slug": slug,
        "date_added": dateAdded,
        "last_modified": lastModified,
        "font_awesome_class": fontAwesomeClass,
        "thumbnail": thumbnail,
        "sub_categories": subCategories == null
            ? null
            : List<dynamic>.from(subCategories?.map((x) => x.toMap()) ?? []),
      };
}
